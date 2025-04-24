Use AdventureWorks2019;
SELECT TOP 10
    qs.total_logical_reads AS [Total Reads],
    qs.total_worker_time AS [CPU Time],
    qs.execution_count,
    qs.total_elapsed_time / qs.execution_count AS [Avg Elapsed Time],
    SUBSTRING(qt.text, qs.statement_start_offset / 2, 
        (CASE WHEN qs.statement_end_offset = -1 
            THEN LEN(CONVERT(nvarchar(max), qt.text)) * 2 
            ELSE qs.statement_end_offset END - qs.statement_start_offset) / 2) AS query_text
FROM 
    sys.dm_exec_query_stats AS qs
CROSS APPLY 
    sys.dm_exec_sql_text(qs.sql_handle) AS qt
ORDER BY 
    qs.total_worker_time DESC;
