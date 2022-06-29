SELECT nonearth.building.*, 
	   nonearth.gran_distr.name AS na_rayon,
	   nonearth.gran_adm_okr.name AS na_ao
FROM nonearth.building
LEFT JOIN nonearth.gran_distr 
	   ON ST_Intersects("building"."SP_GEOMETRY", "gran_distr"."SP_GEOMETRY")
LEFT JOIN nonearth.gran_adm_okr 
	   ON ST_Within("building"."SP_GEOMETRY", "gran_adm_okr"."SP_GEOMETRY")
