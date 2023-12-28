--ERASE ALL TABLES SCRIPT
--MAYBE DROP PK(FK) INSTEAD OF FK REFERENCE

DROP TABLE TSMDB.DBO.TSM_EQUIPMENT;
DROP TABLE TSMDB.DBO.TSM_VEHICLE;

ALTER TABLE TSMDB.DBO.TSM_TRUCK
DROP CONSTRAINT CAR_VEHICLEID_TYPE_FK;
DROP TABLE TSMDB.DBO.TSM_TRUCK;

ALTER TABLE TSMDB.DBO.TSM_CAR
DROP CONSTRAINT TRUCK_VEHICLEID_TYPE_FK;
DROP TABLE TSMDB.DBO.TSM_CAR;
------------------------------------------------------



DROP TABLE TSMDB.DBO.TSM_EMPLOYEE;

ALTER TABLE TSMDB.DBO.TSM_MOVER
DROP CONSTRAINT MOVER_EMPLOYEEID_FK;
DROP TABLE TSMDB.DBO.TSM_MOVER;

ALTER TABLE TSMDB.DBO.TSM_OFFICE_WORKER
DROP CONSTRAINT OFFICEWORKER_EMPLOYEEID_FK;
DROP TABLE TSMDB.DBO.TSM_OFFICE_WORKER;

ALTER TABLE TSMDB.DBO.TSM_HOURLY_PAYROLL
DROP CONSTRAINT HOURLYPAYROLL_EMPLOYEEID_FK;
DROP TABLE TSMDB.DBO.TSM_HOURLY_PAYROLL;
---------------------------------------------------------------


DROP TABLE TSMDB.DBO.TSM_CUSTOMER;

ALTER TABLE TSMDB.DBO.TSM_RESIDENT
DROP CONSTRAINT RES_CUSTOMERID_TYPE_FK;
DROP TABLE TSMDB.DBO.TSM_RESIDENT;

ALTER TABLE TSMDB.DBO.TSM_GUARDIAN
DROP CONSTRAINT GAURD_CUSTOMERID_TYPE_FK;
DROP TABLE TSMDB.DBO.TSM_GUARDIAN;
---------------------------------------------------------------



DROP TABLE TSMDB.DBO.TSM_EXECUTIVE_DIRECTOR;

ALTER TABLE TSMDB.DBO.TSM_SENIOR_COMMUNITY
DROP CONSTRAINT SENIOR_EXECUTIVEID_FK;
DROP TABLE TSMDB.DBO.TSM_SENIOR_COMMUNITY;

ALTER TABLE TSMDB.DBO.TSM_JOB_ORDER
DROP CONSTRAINT JO_COMMUNITYID_FK;
DROP TABLE TSMDB.DBO.TSM_JOB_ORDER;
----------------------------------------------------------

ALTER TABLE TSMDB.DBO.TSM_EQUIPMENT_VEHICLE
DROP CONSTRAINT EQUIP_VEH_EQUIPMENTID_FK
ALTER TABLE TSMDB.DBO.TSM_EQUIPMENT_VEHICLE
DROP CONSTRAINT EQUIP_VEH_VEHICLEID_FK;
DROP TABLE TSMDB.DBO.TSM_EQUIPMENT_VEHICLE;

ALTER TABLE TSMDB.DBO.TSM_RESIDENT_GUARDIAN
DROP CONSTRAINT RES_GAURD_RESIDENTID_FK
ALTER TABLE TSMDB.DBO.TSM_RESIDENT_GUARDIAN
DROP CONSTRAINT RES_GAURD_GUARDIANID_FK
DROP TABLE TSMDB.DBO.TSM_RESIDENT_GUARDIAN;

ALTER TABLE TSMDB.DBO.TSM_VEHICLE_JOB_ORDER
DROP CONSTRAINT VEHJO_VEHICLEID_FK;
ALTER TABLE TSMDB.DBO.TSM_VEHICLE_JOB_ORDER
DROP CONSTRAINT VEHJO_JOBID_FK;
DROP TABLE TSMDB.DBO.TSM_VEHICLE_JOB_ORDER; 

ALTER TABLE TSMDB.DBO.TSM_EMPLOYEE_JOB_ORDER
DROP CONSTRAINT EMPJO_EMPLOYEEID_JOBID_PK
ALTER TABLE TSMDB.DBO.TSM_EMPLOYEE_JOB_ORDER
DROP CONSTRAINT EMPJO_EMPLOYEEID_FK;
DROP TABLE TSMDB.DBO.TSM_EMPLOYEE_JOB_ORDER;

ALTER TABLE TSMDB.DBO.TSM_CUSTOMER_JOB_ORDER
DROP CONSTRAINT CUSTJO_CUSTOMERID_FK;
ALTER TABLE TSMDB.DBO.TSM_CUSTOMER_JOB_ORDER
DROP CONSTRAINT CUSTJO_JOBID_FK;
DROP TABLE TSMDB.DBO.TSM_CUSTOMER_JOB_ORDER;






--DROP VIEWS------------------------------------------------------------------------------------------------

DROP VIEW VW_TS_COMMUNITY_CONTACT;

DROP VIEW VW_TSM_EQUIPMENT_ON_VEHICLES;

DROP VIEW VW_TSM_EMPLOYEE_INFO;

DROP VIEW VW_TSM_RESIDENT_GUARDIAN
