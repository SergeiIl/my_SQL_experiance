SELECT CAST(nonearth.building.id AS int) AS building_id, 
	   nonearth.gran_distr.name AS na_rayon 
FROM nonearth.building 
LEFT JOIN nonearth.gran_distr 
	   ON st_within("building"."SP_GEOMETRY", "gran_distr"."SP_GEOMETRY")
