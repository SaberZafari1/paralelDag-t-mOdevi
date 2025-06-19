-- TDE test etmek

SELECT 
    name AS DatabaseName, 
    is_encrypted 
FROM 
    sys.databases 
WHERE 
    name = 'OrnekDB';
