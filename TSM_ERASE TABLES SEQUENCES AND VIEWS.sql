--ERASE ALL TABLES SCRIPT
DROP TABLE TSM_EQUIPMENT CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_VEHICLE CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_TRUCK CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_CAR CASCADE CONSTRAINTS PURGE;

DROP TABLE TSM_EMPLOYEE CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_MOVER CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_OFFICE_WORKER CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_HOURLY_PAYROLL CASCADE CONSTRAINTS PURGE;

DROP TABLE TSM_CUSTOMER CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_RESIDENT CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_GUARDIAN CASCADE CONSTRAINTS PURGE;

DROP TABLE TSM_EXECUTIVE_DIRECTOR CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_SENIOR_COMMUNITY CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_JOB_ORDER CASCADE CONSTRAINTS PURGE;

DROP TABLE TSM_EQUIPMENT_VEHICLE CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_RESIDENT_GUARDIAN CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_VEHICLE_JOB_ORDER CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_EMPLOYEE_JOB_ORDER CASCADE CONSTRAINTS PURGE;
DROP TABLE TSM_CUSTOMER_JOB_ORDER CASCADE CONSTRAINTS PURGE;



--SEQUENCES---------------------------------------------------------


DROP SEQUENCE TSM_EQUIPMENT_EQUIPMENTID_SEQ;
DROP SEQUENCE TSM_VEHICLE_VEHICLEID_SEQ;

DROP SEQUENCE TSM_EMPLOYEE_EMPLOYEEID_SEQ;
DROP SEQUENCE TSM_HOURLYPAY_PAYROLLID_SEQ;

DROP SEQUENCE TSM_CUSTOMER_CUSTOMERID_SEQ;

DROP SEQUENCE TSM_EXECUTIVE_EXECUTIVEID_SEQ;
DROP SEQUENCE TSM_COMMUNITY_COMMUNITYID_SEQ;
DROP SEQUENCE TSM_JOBORDER_JOBID_SEQ;




--VIEWS----------------------------------------------------------------------

DROP VIEW ContactInfo;
DROP VIEW VEHICLEINFO;
DROP VIEW CommunityLocations;
DROP VIEW EMPLOYEETYPE;