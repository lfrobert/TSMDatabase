--THIS VIEW CONTAINS INFOMATION ON EACH SENIOR COMMUNITY AND THEIR MAIN POINT OF CONTACT
--VW_TSM_COMMUNITY_CONTACT
CREATE OR REPLACE VIEW  VW_TS_COMMUNITY_CONTACT
AS

SELECT 
SC.COMMUNITY_ID,
SC.COMMUNITY_NAME,
SC.STREET,
SC.CITY,
SC.STATE,
SC.ZIP_CODE,
SC.NUM_OF_FLOORS,
SC.ASSISTED_OR_MEMORY_YN,

ED.EXECUTIVE_ID,
ED.FIRST_NAME AS EXECUTIVE_FIRST_NAME,
ED.LAST_NAME AS EXECUTIVE_LSST_NAME,
ED.PHONE_NUMBER AS EXECUTIVE_PHONE_NUMBER,
ED.EMAIL AS EXECUTIVE_EMAIL
FROM TSM_SENIOR_COMMUNITY SC
LEFT JOIN TSM_EXECUTIVE_DIRECTOR ED
ON SC.EXECUTIVE_ID = ED.EXECUTIVE_ID

with read only;


--THIS VIEW PROVIDES VEHICLE/EQUIPMENT INFORMATION
--VW_TSM_EQUIPMENT_ON_VEHICLES
CREATE OR REPLACE VIEW VW_TSM_EQUIPMENT_ON_VEHICLES
AS

SELECT 
V.VEHICLE_ID, 
V.VEHICLE_MAKE, 
V.VEHICLE_MODEL, 
V.VEHICLE_YEAR, 
E.EQUIPMENT_NAME, 
EV.EQUIPMENT_QUANTITY, 
CASE WHEN CAST(T.TRUCK_LENGTH_FT AS VARCHAR2(14) ) IS NULL THEN 'NOT A TRUCK' ELSE CAST(T.TRUCK_LENGTH_FT AS VARCHAR2(14) ) || 'FT' END AS TRUCK_LENGTH,
CASE WHEN C.CAR_PURPOSE IS NULL THEN 'NOT A CAR' ELSE C.CAR_PURPOSE END AS CAR_PURPOSE
FROM TSM_VEHICLE V 
LEFT JOIN TSM_EQUIPMENT_VEHICLE EV
ON V.VEHICLE_ID = EV.VEHICLE_ID AND V.VEHICLE_TYPE = EV.VEHICLE_TYPE
FULL OUTER JOIN TSM_EQUIPMENT E
ON E.EQUIPMENT_ID = EV.EQUIPMENT_ID
LEFT JOIN TSM_TRUCK T
ON V.VEHICLE_ID = T.VEHICLE_ID AND V.VEHICLE_TYPE = T.VEHICLE_TYPE
LEFT JOIN TSM_CAR C
ON V.VEHICLE_ID = C.VEHICLE_ID AND V.VEHICLE_TYPE = C.VEHICLE_TYPE

with read only;


--THIS VIEW PROVIDES EMPLOYEE INFORMATION FOR MOVERS AND HOURLY WORKERS
--VW_TSM_EMPLOYEE_INFO
CREATE OR REPLACE VIEW VW_TSM_EMPLOYEE_INFO
AS

WITH
EMPLOYEE_HOURS_WORKED_AVG
AS
(
SELECT 
M.EMPLOYEE_ID,
AVG(P.HOURS_WORKED) AS AVERAGE_HOURS_WORKED
FROM TSM_MOVER M
LEFT JOIN TSM_HOURLY_PAYROLL P
ON M.EMPLOYEE_ID = P.EMPLOYEE_ID AND M.MOVER_YN = P.MOVER_YN AND M.OFFICE_WORKER_YN = P.OFFICE_WORKER_YN
GROUP BY
M.EMPLOYEE_ID
ORDER BY
M.EMPLOYEE_ID
)

SELECT 
E.EMPLOYEE_ID,
E.FIRST_NAME,
E.MIDDLE_INITAL,
E.LAST_NAME,
E.STREET,
E.CITY,
E.STATE,
E.ZIP_CODE,
E.DOB,
E.CELL_PHONE,
E.EMAIL,
E.GENDER,
E.MOVER_YN,
E.OFFICE_WORKER_YN,
CASE WHEN O.OFFICE_POSITION IS NULL THEN 'NONE' ELSE O.OFFICE_POSITION END AS  OFFICE_POSITION,
CASE WHEN M.DRIVER_YN IS NULL THEN 'NO' ELSE M.DRIVER_YN END AS DRIVER_YN,
AV.AVERAGE_HOURS_WORKED AS AVERAGE_HOURS_WORKED_FOR_MOVERS
FROM TSM_EMPLOYEE E
LEFT JOIN TSM_OFFICE_WORKER O
ON E.EMPLOYEE_ID = O.EMPLOYEE_ID AND E.MOVER_YN = O.MOVER_YN AND E.OFFICE_WORKER_YN = O.OFFICE_WORKER_YN 
LEFT JOIN TSM_MOVER M
ON E.EMPLOYEE_ID = M.EMPLOYEE_ID AND E.MOVER_YN = M.MOVER_YN AND E.OFFICE_WORKER_YN = M.OFFICE_WORKER_YN
LEFT JOIN EMPLOYEE_HOURS_WORKED_AVG AV
ON E.EMPLOYEE_ID = AV.EMPLOYEE_ID

with read only;



--THIS VIEW CONTAINS INFORMATION FOR ALL RESIDENTS AND THEIR RELATED GUARDIANS
--VW_TSM_RESIDENT_GUARDIAN
CREATE OR REPLACE VIEW VW_TSM_RESIDENT_GUARDIAN
AS

WITH GUARDIAN_RELATIONSHIPS
AS (
SELECT 
RG.RESIDENT_ID,
G.CUSTOMER_ID AS GUARDIAN_ID,
G.RELATION_TO_RESIDENT AS GUARDIAN_RELATION_TO_RESIDENT,
C.FIRST_NAME AS GUARDIAN_FIRST_NAME,
C.MIDDLE_INITAL AS GUARDIAN_MIDDLE_INITAL,
C.LAST_NAME AS GUARDIAN_LAST_NAME,

C.DOB AS GUARDIAN_DOB,
C.CELL_PHONE AS GUARDIAN_CELL_PHONE,
C.HOME_PHONE AS GUARDIAN_HOME_PHONE,
C.EMAIL AS GUARDIAN_EMAIL,
C.GENDER AS GUARDIAN_GENDER,
C.RESPONSABLE_FOR_PAYMENT_YN AS GUARDIAN_RESPONSABLE_FOR_PAYMENT_YN,
C.COMMENTS AS GUARDIAN_COMMENTS

FROM TSM_GUARDIAN G
LEFT JOIN TSM_RESIDENT_GUARDIAN RG
ON G.CUSTOMER_ID = RG.GUARDIAN_ID AND G.CUSTOMER_TYPE = RG.CUSTOMER_TYPE_G
LEFT JOIN TSM_CUSTOMER C
ON G.CUSTOMER_ID = C.CUSTOMER_ID AND G.CUSTOMER_TYPE = C.CUSTOMER_TYPE
)

SELECT
C.CUSTOMER_ID AS RESIDENT_ID,
C.CUSTOMER_TYPE,
C.FIRST_NAME AS RESIDENT_FIRST_NAME,
C.MIDDLE_INITAL AS RESIDENT_MIDDLE_INITAL,
C.LAST_NAME AS RESIDENT_LAST_NAME,
C.DOB AS RESIDENT_DOB,
C.CELL_PHONE AS RESIDENT_CELL_PHONE,
C.HOME_PHONE AS RESIDENT_HOME_PHONE,
C.EMAIL AS RESIDENT_EMAIL,
C.GENDER AS RESIDENT_GENDER,
C.RESPONSABLE_FOR_PAYMENT_YN AS RESIDENT_RESPONSABLE_FOR_PAYMENT_YN,
C.COMMENTS AS RESIDENT_COMMENTS,

GR.GUARDIAN_ID,
GR.GUARDIAN_RELATION_TO_RESIDENT,
GR.GUARDIAN_FIRST_NAME,
GR.GUARDIAN_MIDDLE_INITAL,
GR.GUARDIAN_LAST_NAME,

GR.GUARDIAN_DOB,
GR.GUARDIAN_CELL_PHONE,
GR.GUARDIAN_HOME_PHONE,
GR.GUARDIAN_EMAIL,
GR.GUARDIAN_GENDER,
GR.GUARDIAN_RESPONSABLE_FOR_PAYMENT_YN,
GR.GUARDIAN_COMMENTS

FROM TSM_CUSTOMER C
LEFT JOIN TSM_RESIDENT R
ON C.CUSTOMER_ID = R.CUSTOMER_ID AND C.CUSTOMER_TYPE = R.CUSTOMER_TYPE
LEFT JOIN GUARDIAN_RELATIONSHIPS GR
ON C.CUSTOMER_ID = GR.RESIDENT_ID
WHERE C.CUSTOMER_TYPE = 'RESIDENT'
ORDER BY RESIDENT_ID


with read only;



COMMIT;