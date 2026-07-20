SELECT
    SUM(signal_wait_time_ms) AS [Signal Wait Time (ms)]
    , CONVERT(DECIMAL(7,4), 100.0 * SUM (signal_wait_time_ms) / SUM(wait_time_ms)) AS [% Signal waits]
    , SUM(wait_time_ms - signal_wait_time_ms) AS [Resource Wait Time (ms)]
    , CONVERT (DECIMAL(7,4), 100.0 * sum(wait_time_ms - signal_wait_time_ms) / SUM(wait_time_ms)) AS [% Resource waits]
FROM
    sys.dm_os_wait_stats WITH (NOLOCK);

/*
    Statistics are collected from the time of the last SQL Server restart.

    In most cases, signal waits should not exceed 10% to 15% of the total wait time.
*/