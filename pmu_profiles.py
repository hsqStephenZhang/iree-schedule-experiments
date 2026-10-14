"""Named counter profiles; event availability is checked on the current machine."""


def amd_config():
    # Core-scoped Zen 3 events; do not substitute Intel LLC/TLB semantics.
    groups = {
        "dc_access": [
            "ls_dc_accesses",
            "ls_dispatch.ld_dispatch",
            "ls_dispatch.store_dispatch",
        ],
        "l2": ["l2_cache_accesses_from_dc_misses", "l2_cache_misses_from_dc_misses"],
        "demand_fills": [
            "ls_dmnd_fills_from_sys.lcl_l2",
            "ls_dmnd_fills_from_sys.int_cache",
            "ls_dmnd_fills_from_sys.mem_io_local",
        ],
        "demand_fill_access": ["ls_dmnd_fills_from_sys.mem_io_local", "ls_dc_accesses"],
        "all_fills": [
            "ls_any_fills_from_sys.lcl_l2",
            "ls_any_fills_from_sys.int_cache",
            "ls_any_fills_from_sys.mem_io_local",
        ],
        "all_fill_access": ["ls_any_fills_from_sys.mem_io_local", "ls_dc_accesses"],
        "dtlb": ["ls_dc_accesses", "l1_dtlb_misses", "ls_tablewalker.dside"],
        "dtlb_4k": [
            "ls_l1_d_tlb_miss.tlb_reload_4k_l2_hit",
            "ls_l1_d_tlb_miss.tlb_reload_4k_l2_miss",
            "ls_dc_accesses",
        ],
        "dtlb_2m": [
            "ls_l1_d_tlb_miss.tlb_reload_2m_l2_hit",
            "ls_l1_d_tlb_miss.tlb_reload_2m_l2_miss",
            "ls_dc_accesses",
        ],
    }
    metrics = {}

    def metric(name, group, numerator, denominator, factor=1):
        metrics[name] = dict(
            group=group, numerator=numerator, denominator=denominator, factor=factor
        )

    metric("ipc", "dc_access", ["instructions"], ["cycles"])
    metric(
        "l2_dc_request_miss_percent_including_prefetch",
        "l2",
        ["l2_cache_misses_from_dc_misses"],
        ["l2_cache_accesses_from_dc_misses"],
        100,
    )
    for kind, prefix in [
        ("demand", "ls_dmnd_fills_from_sys"),
        ("all", "ls_any_fills_from_sys"),
    ]:
        group = kind + "_fills"
        metric(
            kind + "_memory_io_fills_per_1000_dc_accesses",
            kind + "_fill_access",
            [prefix + ".mem_io_local"],
            ["ls_dc_accesses"],
            1000,
        )
        metric(
            kind + "_memory_io_share_of_local_fills_percent",
            group,
            [prefix + ".mem_io_local"],
            [prefix + ".lcl_l2", prefix + ".int_cache", prefix + ".mem_io_local"],
            100,
        )
    metric(
        "l1_dtlb_misses_per_1000_dc_accesses",
        "dtlb",
        ["l1_dtlb_misses"],
        ["ls_dc_accesses"],
        1000,
    )
    metric(
        "dside_pagewalks_per_1000_dc_accesses",
        "dtlb",
        ["ls_tablewalker.dside"],
        ["ls_dc_accesses"],
        1000,
    )
    for page in ["4k", "2m"]:
        metric(
            "dtlb_" + page + "_l2_misses_per_1000_dc_accesses",
            "dtlb_" + page,
            ["ls_l1_d_tlb_miss.tlb_reload_" + page + "_l2_miss"],
            ["ls_dc_accesses"],
            1000,
        )
    return dict(
        groups=groups,
        metrics=metrics,
        note="Zen 3 core events. DC accesses/dispatched operations include speculative activity. Fill ratios are normalized event rates, not retired-load miss probabilities. int_cache includes L3 or other L2 in the CCX; mem_io_local includes DRAM or IO. Core fill events do not measure total system DRAM bandwidth. L2 requests include prefetch. AMD shared-L3 PMU and IMC are not assumed available.",
    )


def intel_config():
    from profile_perf import GROUPS

    metrics = {}

    def metric(name, group, numerator, denominator, factor=100):
        metrics[name] = dict(
            group=group, numerator=numerator, denominator=[denominator], factor=factor
        )

    metric("ipc", "retired_loads", ["instructions"], "cycles", 1)
    for level in ["l1", "l2", "l3"]:
        metric(
            level + "_load_miss_percent",
            "retired_loads",
            ["mem_load_retired." + level + "_miss"],
            "mem_inst_retired.all_loads",
        )
    metric(
        "l2_demand_request_miss_percent",
        "cache_requests",
        ["l2_rqsts.demand_data_rd_miss"],
        "l2_rqsts.all_demand_data_rd",
    )
    metric(
        "llc_request_miss_percent",
        "cache_requests",
        ["longest_lat_cache.miss"],
        "longest_lat_cache.reference",
    )
    for direction, retired in [("load", "loads"), ("store", "stores")]:
        prefix = f"dtlb_{direction}_misses."
        group = direction + "_tlb"
        metric(
            direction + "_dtlb_events_per_1000_" + retired,
            group,
            [prefix + "stlb_hit", prefix + "walk_completed"],
            "mem_inst_retired.all_" + retired,
            1000,
        )
        metric(
            direction + "_pagewalks_per_1000_" + retired,
            group,
            [prefix + "walk_completed"],
            "mem_inst_retired.all_" + retired,
            1000,
        )
        metric(
            direction + "_pagewalk_active_cycle_percent",
            group,
            [prefix + "walk_active"],
            "cycles",
        )
    for name, event in [
        ("l1_miss", "stalls_l1d_miss"),
        ("l2_miss", "stalls_l2_miss"),
        ("l3_miss", "stalls_l3_miss"),
        ("total", "stalls_total"),
    ]:
        metric(
            name + "_stall_cycle_percent",
            "stalls",
            ["cycle_activity." + event],
            "cycles",
        )
    return dict(
        groups=GROUPS,
        metrics=metrics,
        note="Intel retired-load miss ratios and speculative DTLB event rates. DTLB events divided by retired loads/stores are normalized rates, not probabilities. Stall events overlap; do not sum them.",
    )


def select_profile(cpuinfo, event_names):
    if "AuthenticAMD" in cpuinfo:
        candidate, name = amd_config(), "amd-named-core"
    elif "GenuineIntel" in cpuinfo:
        candidate, name = intel_config(), "intel-named-core"
    else:
        candidate, name = (
            dict(
                groups={},
                metrics={},
                note="Only portable cycles/instructions; no cache/TLB rates inferred.",
            ),
            "generic",
        )
    skipped = {}
    groups = {}
    for group, events in candidate["groups"].items():
        missing = sorted(set(events) - event_names)
        if missing:
            skipped[group] = dict(
                reason="events not advertised by perf", events=missing
            )
        else:
            groups[group] = events
    # Always expose an independent IPC group, even when no detailed profile fits.
    groups["basic"] = []
    metrics = {
        k: v
        for k, v in candidate["metrics"].items()
        if v["group"] in groups and k != "ipc"
    }
    metrics["ipc"] = dict(
        group="basic", numerator=["instructions"], denominator=["cycles"], factor=1
    )
    return dict(
        profile=name,
        groups=groups,
        metrics=metrics,
        unavailable_groups=skipped,
        note=candidate["note"],
    )
