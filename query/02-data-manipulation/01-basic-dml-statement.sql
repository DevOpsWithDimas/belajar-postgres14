-- simple insert statement
INSERT INTO regions (region_id, region_name)
VALUES (5, 'Asia Tengara');

select *
from regions;

-- simple update statement
UPDATE regions
SET region_name = 'Oceania'
WHERE region_id = 5;

-- simple delete statement
DELETE
FROM regions
WHERE region_id = 5;

-- simple returning data
select nextval('regions_region_id_seq');
alter sequence regions_region_id_seq restart start 10;

INSERT INTO regions (region_id, region_name)
VALUES (default, 'Other')
returning *;
