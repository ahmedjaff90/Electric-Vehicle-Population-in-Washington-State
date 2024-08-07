-- Query to analyze the electric vehicle (EV) population in selected cities in Washington state
-- The query calculates total EV count and breaks down counts by manufacturer and vehicle type

SELECT 
    City, 
    COUNT(*) AS total_count, -- Total number of EVs in each city
    SUM(CASE WHEN Make = 'TESLA' THEN 1 ELSE 0 END) AS tesla_count, -- Count of Tesla EVs
    SUM(CASE WHEN Make = 'BMW' THEN 1 ELSE 0 END) AS bmw_count, -- Count of BMW EVs
    SUM(CASE WHEN Make = 'TOYOTA' THEN 1 ELSE 0 END) AS toyota_count, -- Count of Toyota EVs
    SUM(CASE WHEN Make = 'NISSAN' THEN 1 ELSE 0 END) AS nissan_count, -- Count of Nissan EVs
    SUM(CASE WHEN Make = 'FORD' THEN 1 ELSE 0 END) AS ford_count, -- Count of Ford EVs
    SUM(CASE WHEN `Electric Vehicle Type` = 'Battery Electric Vehicle (BEV)' THEN 1 ELSE 0 END) AS bev_count, -- Count of BEV vehicles
    SUM(CASE WHEN `Electric Vehicle Type` = 'Plug-in Hybrid Electric Vehicle (PHEV)' THEN 1 ELSE 0 END) AS phev_count -- Count of PHEV vehicles
FROM 
    `electric-vehicle-431416.electric_vehicle.Electric_Vehicle_Population_Data`
WHERE 
    City IN ('Seattle', 'Kent', 'Yakima', 'Zillah', 'Olympia') -- Filtering for specific cities
GROUP BY 
    City
ORDER BY 
    total_count DESC; -- Sorting cities by total EV count in descending order
