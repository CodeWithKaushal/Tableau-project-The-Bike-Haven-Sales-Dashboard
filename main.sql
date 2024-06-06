SELECT * FROM customer


ALTER TABLE customer
DROP COLUMN customeralternatekey,
DROP COLUMN title,
DROP COLUMN middlename,
DROP COLUMN namestyle,
DROP COLUMN birthdate,
DROP COLUMN maritalstatus,
DROP COLUMN suffix,
DROP COLUMN gender,
DROP COLUMN emailaddress,
DROP COLUMN yearlyincome,
DROP COLUMN spanisheducation,
DROP COLUMN frenchoccupation,
DROP COLUMN houseownerflag,
DROP COLUMN addressline1,
DROP COLUMN addressline2,
DROP COLUMN phone,
DROP COLUMN datefirstpurchase


SELECT COUNT(totalchildren),totalchildren from customer
GROUP BY totalchildren



SELECT * FROM customer;

ALTER TABLE customer
DROP COLUMN numberchildrenathome,
DROP COLUMN frencheducation,
DROP COLUMN spanishoccupation,
DROP COLUMN totalchildren,
DROP COLUMN numbercarsowned,
DROP COLUMN englishoccupation

SELECT englisheducation,COUNT(englisheducation)
from customer
group by englisheducation;


/*************************************************************************/

select * from date;

alter table date
DROP COLUMN daynumberofweek,
DROP COLUMN englishdaynameofweek,
DROP COLUMN spanishdaynameofweek,
DROP COLUMN frenchdaynameofweek,
DROP COLUMN daynumberofmonth,
DROP COLUMN daynumberofyear,
DROP COLUMN weeknumberofyear,
DROP COLUMN spanishmonthname,
DROP COLUMN frenchmonthname,
DROP COLUMN monthnumberofyear,
DROP COLUMN calendarsemester,
DROP COLUMN fiscalquarter,
DROP COLUMN fiscalyear,
DROP COLUMN fiscalsemester;

ALTER TABLE date 
RENAME COLUMN englishmonthname TO month;

/*************************************************************/

SELECT * FROM geography;

ALTER TABLE geography
DROP COLUMN stateprovincecode,
DROP COLUMN countryregioncode,
DROP COLUMN spanishcountryregionname,
DROP COLUMN frenchcountryregionname,
DROP COLUMN postalcode,
DROP COLUMN salesterritorykey,
DROP COLUMN ipaddresslocator;

ALTER TABLE geography
RENAME COLUMN englishcountryregionname TO countryname;

ALTER TABLE geography
RENAME COLUMN geographykey TO geography_key;

/**********************************************************************/

SELECT * FROM internetsales;

ALTER TABLE internetsales
DROP COLUMN duedatekey,
DROP COLUMN promotionkey,
DROP COLUMN currencykey,
DROP COLUMN salesordernumber,
DROP COLUMN totalproductcost,
DROP COLUMN orderdate,
DROP COLUMN duedate,
DROP COLUMN shipdate;

/*********************************************************/

SELECT * FROM product;

ALTER TABLE product
DROP COLUMN startdate,
DROP COLUMN enddate,
DROP COLUMN status,
DROP COLUMN productalternatekey,
DROP COLUMN color,
DROP COLUMN safetystocklevel,
DROP COLUMN reorderpoint,
DROP COLUMN size,
DROP COLUMN daystomanufacture,
DROP COLUMN productline,
DROP COLUMN englishdescription,
DROP COLUMN modelname;

/******************************************/

SELECT * FROM productcategory;

ALTER TABLE productcategory
DROP COLUMN productcategoryalternatekey;

ALTER TABLE productcategory
RENAME COLUMN productcategorykey TO productcategory_key;

ALTER TABLE productcategory
RENAME COLUMN englishproductcategoryname TO productcategories;

/****************************************************************************/


SELECT * FROM productsubcategory;

ALTER TABLE productsubcategory
DROP COLUMN productsubcategoryalternatekey;

ALTER TABLE productsubcategory
RENAME COLUMN englishproductsubcategoryname To productsubcategories;

ALTER TABLE productsubcategory
RENAME COLUMN productsubcategorykey TO productsubcategory_key;

/************************************************************/


-- joining tables

SELECT * FROM customer;

CREATE TABLE customers
AS
(SELECT customerkey,geographykey,firstname || ' ' ||lastname AS customername,englisheducation,commutedistance
 FROm customer);
 
CREATE TABLE customer_geography_data
AS
(SELECT * FROM customers
 JOIN geography
 ON customers.geographykey=geography.geography_key);
 

SELECT * FROM customer_geography_data;

/******************************************************/

SELECT * FROM date
WHERE calendaryear > 2020;
 

SELECT * FROM internetsales
WHERE orderdatekey > 20201231;

ALTER TABLE internetsales
ALTER COLUMN orderdatekey TYPE integer
USING orderdatekey::integer;

SELECT * FROM product;
SELECT * FROM productcategory;
SELECT * FROM productsubcategory;


SELECT * FROM 
(SELECT * FROM productcategory 
 INNER JOIN productsubcategory 
 ON productcategory.productcategory_key=productsubcategory.productcategorykey) AS p
 JOIN product on p.productsubcategory_key=product.productsubcategorykey;


SELECT * FROM internetsales
WHERE orderdatekey > 20201231;


SELECT sum(salesamount) FROM internetsales
where orderdatekey > 20201231;



