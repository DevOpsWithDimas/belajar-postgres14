--- default behavior
INSERT INTO regions(region_id, region_name)
VALUES (10, 'Other');

select *
from regions
where region_id = 10;

--- manual behavior by editor
INSERT INTO regions(region_id, region_name)
VALUES (11, 'Other 2');

select *
from regions
where region_id = 11;

--- manual behavior by query
BEGIN;

INSERT INTO regions(region_id, region_name)
VALUES (12, 'Other 3');

select *
from regions
where region_id = 12;


--- transaction with commit clause
BEGIN;

INSERT INTO regions(region_id, region_name)
VALUES (12, 'Other 3');

select *
from regions
where region_id = 12;

UPDATE regions
SET region_name = 'Asia Pasific'
where region_id = 10;

select *
from regions
where region_id = 10;

COMMIT;

--- rollback with schenario human error
BEGIN;
UPDATE regions
SET region_name = 'Asia Pasific UPDATED'
where region_id = 10;

select *
from regions
where region_id = 10;

ROLLBACK;

--- rollback with schenario runtime error
BEGIN;

INSERT INTO regions(region_id, region_name)
VALUES (10, 'Other');

COMMIT;


--- using savepoint
BEGIN;

INSERT INTO regions(region_id, region_name)
VALUES (14, 'Other 4');

UPDATE regions
SET region_name = 'Asia Pasific UPDATED'
where region_id = 10;

select *
from regions
where region_id in (10, 14);

savepoint trx1;

UPDATE regions
SET region_name = 'Asia Pasific UPDATED ke 2'
where region_id = 10;

select *
from regions
where region_id in (10, 14);

savepoint trx2;

INSERT INTO regions(region_id, region_name)
VALUES (10, 'Other');

rollback to savepoint trx1;

UPDATE regions
SET region_name = 'Asia Pasific'
where region_id = 10;

commit;
