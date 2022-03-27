------------####INSERT PROC####--------------
------------####PACKAGE DEC####--------------
create or replace PACKAGE INSERTION
AS
PROCEDURE INSERT_USER_ROLES(ROLE_NAME in VARCHAR2,ROLE_DESCRIPTION in VARCHAR2,USER_TYPE in CHAR);
PROCEDURE INSERT_USER_DETAILS(FIRST_NAME in VARCHAR2,LAST_NAME in VARCHAR2,PHONE_NO in NUMBER,EMAIL in VARCHAR2,USER_NAME in VARCHAR2,PASS_WORD in VARCHAR2,ADDRESS_LINE1 in VARCHAR2,ADDRESS_LINE2 in VARCHAR2,CITY in VARCHAR2,ZIPCODE in NUMBER,RESIDENCE_STATE in VARCHAR2,COUNTRY in VARCHAR2,DOB in DATE,SEX in VARCHAR2,ROLE_ID in NUMBER,DATE_CREATED in DATE);
PROCEDURE INSERT_MGMT_DETAILS(mg_comp_name in VARCHAR,mg_reg_status in CHAR,mg_datcreated in DATE);
PROCEDURE INSERT_APARTMENT_DETAILS(AVAILABILITY in	VARCHAR2,NO_OF_TENANTS in	NUMBER,BUILDING_TYPE	in VARCHAR2,BUILT_YEAR in	NUMBER,LOCATION	in VARCHAR2,UNIT_NO	in NUMBER,SQT_AREA in	NUMBER,BUILDING_NO	in NUMBER,AC_SYSTEM	in CHAR,HEATER_SYSTEM	in CHAR,HOT_WATER in	CHAR,GAS_CONNECTION in	CHAR,ELECTRICITY	in CHAR,ASBESTOS	in CHAR,REFRIGARATOR	in CHAR,NO_OF_BEDROOMS	in CHAR,FLOOR_NO	in NUMBER,PARKING_AVAILABLE	in CHAR,NO_OF_KEYS	in NUMBER,OVEN	in CHAR,STATUS_KEYLOCK	in CHAR,STATUS_WINDOWS	in CHAR,STATUS_DOOR	in CHAR,STATUS_TOILETSINK	in CHAR,STATUS_WASHSINK	in CHAR,OWNER_NAME	in VARCHAR2,SPECIAL_DESCRIPTION	in VARCHAR2,NO_OF_BATHROOMS	in NUMBER,NO_OF_BALCONY	in VARCHAR2,BROKER_COMMISSION	in NUMBER,MGID	in NUMBER);
PROCEDURE INSERT_CONTRACTOR_DETAILS(STAFF_ROLE in VARCHAR2,CO_SPECIALTY in VARCHAR2,CO_HOURS in NUMBER,CO_RATE in NUMBER,CO_EMP_START_DATE in DATE,CO_EMP_END_DATE in DATE,MGID in NUMBER);
PROCEDURE INSERT_MAINTENANCE_DETAILS(MAINTENANCE_TYPE in VARCHAR2,MAINTENANCE_COMMENTS in VARCHAR2,FREQUENCY in NUMBER,DATE_LAST_DONE in DATE,COMPLIANCE_STATUS in CHAR,MGID in NUMBER);
PROCEDURE INSERT_BOOKING_DETAILS(user_id in NUMBER, aid in NUMBER, mgid in NUMBER, bkng_fees in NUMBER, bkng_status in CHAR,bkng_date in date);
PROCEDURE INSERT_LEASE_DETAILS(l_type in CHAR, l_start_date in DATE,l_end_date in DATE, is_sub_allowed in CHAR, sub_charges in NUMBER, is_active in CHAR, sec_deposit in NUMBER, bal_amt in NUMBER, dat_created in DATE, rent in NUMBER, is_cancel_allowed in CHAR,cancel_charges in NUMBER, cancel_status in VARCHAR, is_ext_allowed in CHAR, ext_status in CHAR,ext_charges in NUMBER, ext_comments in VARCHAR, new_start_dat in DATE, new_end_dat in DATE, new_rent in NUMBER,aid in NUMBER);
PROCEDURE INSERT_TENANT_DETAILS(LID in NUMBER,ID_PROOF_SUBMITTED in CHAR,ID_PROOF_DOCUMENT_TYPE in VARCHAR);
PROCEDURE INSERT_PAYMENT_DETAILS(LID in NUMBER,PAYMENT_DATE in DATE,PAYMENT_METHOD in VARCHAR2,PAYMENT_BY_NAME in VARCHAR2,PAYMENT_TO_NAME in VARCHAR2,PAYMENT_AMOUNT in NUMBER,PAYMENT_CATEGORY in VARCHAR2,PAYMENT_STATUS in CHAR);
PROCEDURE INSERT_NOTIFICATION(ntfy_type in VARCHAR, ntfy_cmnts in VARCHAR, creation_date in DATE, ntfy_date in DATE, mgid in NUMBER, tid in NUMBER);
PROCEDURE INSERT_LAUNDRY_DETAILS(LA_MACHINE_NO in NUMBER,LA_WASHING_LOAD in VARCHAR2,LA_DRYING_LOAD in VARCHAR2,LA_TIME_STARTED in TIMESTAMP,LA_TIME_ENDED in TIMESTAMP,LA_STATUS in CHAR,LA_FEE_WASHING in NUMBER,LA_FEE_DRYING in NUMBER,LA_PAYMENT_RECEIVED in CHAR,NID in NUMBER);
PROCEDURE INSERT_COMPLAINT_DETAILS(C_REF_NO in NUMBER,C_RAISED_BY_NAME in VARCHAR2,C_RAISED_BY_APT in NUMBER,C_RAISED_TIME in TIMESTAMP,C_RAISED_DATE in DATE,C_CATEGORY in VARCHAR2,C_SEVERITY in VARCHAR2,C_DESCRIPTION in VARCHAR2,C_STATUS in CHAR,C_CLOSURE_DATE in DATE,CO_ID in NUMBER,NID in NUMBER);
END;
/
create or replace PACKAGE BODY INSERTION
	AS
	
---------------------------------------------------------INSERT_USER_ROLES-------------------------
PROCEDURE INSERT_USER_ROLES(ROLE_NAME in VARCHAR2,ROLE_DESCRIPTION in VARCHAR2,USER_TYPE in CHAR)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into USER_ROLES(ROLE_NAME,ROLE_DESCRIPTION,USER_TYPE) values (ROLE_NAME,ROLE_DESCRIPTION,USER_TYPE);
	dbms_output.put_line('Row inserted into USER_ROLES Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in USER_ROLES! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into USER_ROLES Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_USER_ROLES;
	
-------------------------------------------------INSERT_USER_DETAILS-----------------------------------

PROCEDURE INSERT_USER_DETAILS(FIRST_NAME in VARCHAR2,LAST_NAME in VARCHAR2,PHONE_NO in NUMBER,EMAIL in VARCHAR2,USER_NAME in VARCHAR2,PASS_WORD in VARCHAR2,ADDRESS_LINE1 in VARCHAR2,ADDRESS_LINE2 in VARCHAR2,CITY in VARCHAR2,ZIPCODE in NUMBER,RESIDENCE_STATE in VARCHAR2,COUNTRY in VARCHAR2,DOB in DATE,SEX in VARCHAR2,ROLE_ID in NUMBER,DATE_CREATED in DATE)
AS
BEGIN
dbms_output.put_line('----------------------------------------------------------');
insert into USER_DETAILS(FIRST_NAME,LAST_NAME,PHONE_NO,EMAIL,USER_NAME,PASS_WORD,ADDRESS_LINE1,ADDRESS_LINE2,CITY,ZIPCODE,RESIDENCE_STATE,COUNTRY,DOB,SEX,ROLE_ID,DATE_CREATED) values (FIRST_NAME,LAST_NAME,PHONE_NO,EMAIL,USER_NAME,PASS_WORD,ADDRESS_LINE1,ADDRESS_LINE2,CITY,ZIPCODE,RESIDENCE_STATE,COUNTRY,DOB,SEX,ROLE_ID,DATE_CREATED);
dbms_output.put_line('Row inserted into USER_DETAILS Table');
dbms_output.put_line('----------------------------------------------------------');
commit;
exception
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found in USER_DETAILS! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into USER_DETAILS Table');
rollback;
dbms_output.put_line('The error encountered is: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_USER_DETAILS;

------------------------------------------------------INSERT_MGMT_DETAILS----------------------------------
	PROCEDURE INSERT_MGMT_DETAILS(mg_comp_name in VARCHAR, mg_reg_status in CHAR, mg_datcreated in DATE)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into MANAGEMENT_DETAILS(M_COMPANY_NAME,M_REGISTRATION_STATUS,M_DATE_CREATED) values (mg_comp_name,mg_reg_status,mg_datcreated);
	dbms_output.put_line('Row inserted into MANAGEMENT_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
	when dup_val_on_index then
	dbms_output.put_line('Duplicate Value Found in MANAGEMENT_DETAILS! Insert Different Value');
	when others then
	dbms_output.put_line('Error while inserting data into MANAGEMENT_DETAILS Table');
	rollback;
	dbms_output.put_line('The error encountered is: ');
	dbms_output.put_line(dbms_utility.format_error_stack);
	dbms_output.put_line('----------------------------------------------------------');
	end INSERT_MGMT_DETAILS;
    
---------------------------------INSERT_APARTMENT_DETAILS-------------------------------------------------------

PROCEDURE INSERT_APARTMENT_DETAILS(AVAILABILITY in	VARCHAR2,NO_OF_TENANTS in	NUMBER,BUILDING_TYPE	in VARCHAR2,BUILT_YEAR in	NUMBER,LOCATION	in VARCHAR2,UNIT_NO	in NUMBER,SQT_AREA in	NUMBER,BUILDING_NO	in NUMBER,AC_SYSTEM	in CHAR,HEATER_SYSTEM	in CHAR,HOT_WATER in	CHAR,GAS_CONNECTION in	CHAR,ELECTRICITY	in CHAR,ASBESTOS	in CHAR,REFRIGARATOR	in CHAR,NO_OF_BEDROOMS	in CHAR,FLOOR_NO	in NUMBER,PARKING_AVAILABLE	in CHAR,NO_OF_KEYS	in NUMBER,OVEN	in CHAR,STATUS_KEYLOCK	in CHAR,STATUS_WINDOWS	in CHAR,STATUS_DOOR	in CHAR,STATUS_TOILETSINK	in CHAR,STATUS_WASHSINK	in CHAR,OWNER_NAME	in VARCHAR2,SPECIAL_DESCRIPTION	in VARCHAR2,NO_OF_BATHROOMS	in NUMBER,NO_OF_BALCONY	in VARCHAR2,BROKER_COMMISSION	in NUMBER,MGID	in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into APARTMENT_DETAILS(AVAILABILITY,NO_OF_TENANTS,BUILDING_TYPE,BUILT_YEAR,LOCATION,UNIT_NO,SQT_AREA,BUILDING_NO,AC_SYSTEM,HEATER_SYSTEM,HOT_WATER,GAS_CONNECTION,
ELECTRICITY,ASBESTOS,REFRIGARATOR,NO_OF_BEDROOMS,FLOOR_NO,PARKING_AVAILABLE,NO_OF_KEYS,OVEN,STATUS_KEYLOCK,STATUS_WINDOWS,STATUS_DOOR,STATUS_TOILETSINK,STATUS_WASHSINK,OWNER_NAME,SPECIAL_DESCRIPTION,NO_OF_BATHROOMS,NO_OF_BALCONY,BROKER_COMMISSION,MGID) values (AVAILABILITY,
NO_OF_TENANTS,BUILDING_TYPE,BUILT_YEAR,LOCATION,UNIT_NO,SQT_AREA,BUILDING_NO,AC_SYSTEM,HEATER_SYSTEM,HOT_WATER,GAS_CONNECTION,ELECTRICITY,ASBESTOS,REFRIGARATOR,
NO_OF_BEDROOMS,FLOOR_NO,PARKING_AVAILABLE,NO_OF_KEYS,OVEN,STATUS_KEYLOCK,STATUS_WINDOWS,STATUS_DOOR,STATUS_TOILETSINK,STATUS_WASHSINK,OWNER_NAME,SPECIAL_DESCRIPTION,NO_OF_BATHROOMS,NO_OF_BALCONY,BROKER_COMMISSION,MGID);
	dbms_output.put_line('Row inserted into APARTMENT_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
	when dup_val_on_index then
	dbms_output.put_line('Duplicate Value Found in INSERT_APARTMENT_DETAILS! Insert Different Value');
	when others then
	dbms_output.put_line('Error while inserting data into APARTMENT-DETAILS Table');
	rollback;
	dbms_output.put_line('The error encountered is: ');
	dbms_output.put_line(dbms_utility.format_error_stack);
	dbms_output.put_line('----------------------------------------------------------');
	end INSERT_APARTMENT_DETAILS;
    
---------------------------------------------------INSERT_CONTRACTOR_DETAILS-------------------------
PROCEDURE INSERT_CONTRACTOR_DETAILS(STAFF_ROLE in VARCHAR2,CO_SPECIALTY in VARCHAR2,CO_HOURS in NUMBER,CO_RATE in NUMBER,CO_EMP_START_DATE in DATE,CO_EMP_END_DATE in DATE,MGID in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into CONTRACTOR_DETAILS(STAFF_ROLE,CO_SPECIALTY,CO_HOURS,CO_RATE,CO_EMP_START_DATE,CO_EMP_END_DATE,MGID) values (STAFF_ROLE,CO_SPECIALTY,CO_HOURS,CO_RATE,CO_EMP_START_DATE,CO_EMP_END_DATE,MGID);
	dbms_output.put_line('Row inserted into CONTRACTOR_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in CONTRACTOR_DETAILS! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into CONTRACTOR_DETAILS Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_CONTRACTOR_DETAILS;
	
------------------------------------INSERT_MAINTENANCE_DETAILS-------------------------
PROCEDURE INSERT_MAINTENANCE_DETAILS(MAINTENANCE_TYPE in VARCHAR2,MAINTENANCE_COMMENTS in VARCHAR2,FREQUENCY in NUMBER,DATE_LAST_DONE in DATE,COMPLIANCE_STATUS in CHAR,MGID in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into MAINTENANCE_DETAILS(MAINTENANCE_TYPE,MAINTENANCE_COMMENTS,FREQUENCY,DATE_LAST_DONE,COMPLIANCE_STATUS,MGID) values (MAINTENANCE_TYPE,MAINTENANCE_COMMENTS,FREQUENCY,DATE_LAST_DONE,COMPLIANCE_STATUS,MGID);
	dbms_output.put_line('Row inserted into MAINTENANCE_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in MAINTENANCE_DETAILS! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into MAINTENANCE_DETAILS Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_MAINTENANCE_DETAILS;
	
    -----------------------------INSERT_BOOKING_DETAILS----------------------------------
    PROCEDURE INSERT_BOOKING_DETAILS(user_id in NUMBER, aid in NUMBER, mgid in NUMBER, bkng_fees in NUMBER, bkng_status in CHAR,bkng_date in date)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into BOOKING(user_id,aid,mgid,booking_fees,booking_status,booking_date) values (user_id,aid,mgid,bkng_fees,bkng_status,bkng_date);
	dbms_output.put_line('Row inserted into BOOKING Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
	when dup_val_on_index then
	dbms_output.put_line('Duplicate Value Found in BOOKING! Insert Different Value');
	when others then
	dbms_output.put_line('Error while inserting data into BOOKING Table');
	rollback;
	dbms_output.put_line('The error encountered is: ');
	dbms_output.put_line(dbms_utility.format_error_stack);
	dbms_output.put_line('----------------------------------------------------------');
	end INSERT_BOOKING_DETAILS;	

-------------------------------------------------LEASE_DETAILS--------------------------------------------------
	PROCEDURE INSERT_LEASE_DETAILS(l_type in CHAR, l_start_date in DATE,l_end_date in DATE, is_sub_allowed in CHAR, sub_charges in NUMBER, is_active in CHAR,sec_deposit in NUMBER, bal_amt in NUMBER, dat_created in DATE, rent in NUMBER, is_cancel_allowed in CHAR,cancel_charges in NUMBER, cancel_status in VARCHAR, is_ext_allowed in CHAR, ext_status in CHAR,ext_charges in NUMBER, ext_comments in VARCHAR, new_start_dat in DATE, new_end_dat in DATE, new_rent in NUMBER,aid in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
    dbms_output.put_line(l_start_date);
	insert into LEASE_DETAILS(LEASE_TYPE,LEASE_START_DATE,LEASE_END_DATE,IS_SUBLET_ALLOWED,SUBLETTING_CHARGES,IS_ACTIVE,SECURITY_DEPOSIT,BALANCE_AMOUNT,DATE_CREATED,RENT,IS_CANCELLATION_ALLOWED,CANCELLATION_CHARGES,CANCEL_STATUS,IS_EXTENSION_ALLOWED,EXTENSION_STATUS,EXTENSION_CHARGES,EXTENSION_COMMENTS,NEW_START_DATE,NEW_END_DATE,NEW_RENT,AID) values (l_type,l_start_date,l_end_date,is_sub_allowed,sub_charges,is_active,sec_deposit,bal_amt,dat_created,rent,is_cancel_allowed,cancel_charges,cancel_status,is_ext_allowed,ext_status,ext_charges,ext_comments,new_start_dat,new_end_dat,new_rent,aid);
	dbms_output.put_line('Row inserted into LEASE_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found LEASE_DETAILS! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into LEASE_DETAILS Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_LEASE_DETAILS;
   	
--------------------------INSERT_TENANT_DETAILS-----------------------------------
PROCEDURE INSERT_TENANT_DETAILS(LID in NUMBER,ID_PROOF_SUBMITTED in CHAR,ID_PROOF_DOCUMENT_TYPE in VARCHAR)
AS
BEGIN
    dbms_output.put_line('----------------------------------------------------------');
    insert into TENANT_DETAILS(LID,ID_PROOF_SUBMITTED,ID_PROOF_DOCUMENT_TYPE) values (LID,ID_PROOF_SUBMITTED,ID_PROOF_DOCUMENT_TYPE);
    dbms_output.put_line('Row inserted into TENANT_DETAILS Table');
    dbms_output.put_line('----------------------------------------------------------');
    commit;
    exception
    when dup_val_on_index then
    dbms_output.put_line('Duplicate Value Found in TENANT_DETAILS! Insert Different Value');
    when others then
    dbms_output.put_line('Error while inserting data into TENANT_DETAILS Table');
    rollback;
    dbms_output.put_line('The error encountered is: ');
    dbms_output.put_line(dbms_utility.format_error_stack);
    dbms_output.put_line('----------------------------------------------------------');
end INSERT_TENANT_DETAILS;

----------------------------------INSERT_PAYMENT_DETAILS--------------------------------
PROCEDURE INSERT_PAYMENT_DETAILS(LID in NUMBER,PAYMENT_DATE in DATE,PAYMENT_METHOD in VARCHAR2,PAYMENT_BY_NAME in VARCHAR2,PAYMENT_TO_NAME in VARCHAR2,PAYMENT_AMOUNT in NUMBER,PAYMENT_CATEGORY in VARCHAR2,PAYMENT_STATUS in CHAR)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into PAYMENT_DETAILS(LID,PAYMENT_DATE,PAYMENT_METHOD,PAYMENT_BY_NAME,PAYMENT_TO_NAME,PAYMENT_AMOUNT,PAYMENT_CATEGORY,PAYMENT_STATUS) values (LID,PAYMENT_DATE,PAYMENT_METHOD,PAYMENT_BY_NAME,PAYMENT_TO_NAME,PAYMENT_AMOUNT,PAYMENT_CATEGORY,PAYMENT_STATUS);
	dbms_output.put_line('Row inserted into PAYMENT_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in PAYMENT_DETAILS! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into PAYMENT_DETAILS Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_PAYMENT_DETAILS;

-----------------------------------------------INSERT_NOTIFICATION--------------------------------
PROCEDURE INSERT_NOTIFICATION(ntfy_type in VARCHAR, ntfy_cmnts in VARCHAR, creation_date in DATE, ntfy_date in DATE, mgid in NUMBER, tid in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into NOTIFICATION(NOTIFICATION_TYPE, NOTIFICATION_COMMENTS, DATE_CREATED, NOTIFICATION_DATE, MGID, TID) values (ntfy_type, ntfy_cmnts, creation_date, ntfy_date, mgid, tid);
	dbms_output.put_line('Row inserted into NOTIFICATION Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in NOTIFICATION! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into NOTIFICATION Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_NOTIFICATION;

------------------------------------INSERT_LAUNDRY_DETAILS--------------------------------
PROCEDURE INSERT_LAUNDRY_DETAILS(LA_MACHINE_NO in NUMBER,LA_WASHING_LOAD in VARCHAR2,LA_DRYING_LOAD in VARCHAR2,LA_TIME_STARTED in TIMESTAMP,LA_TIME_ENDED in TIMESTAMP,LA_STATUS in CHAR,LA_FEE_WASHING in NUMBER,LA_FEE_DRYING in NUMBER,LA_PAYMENT_RECEIVED in CHAR,NID in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into LAUNDRY_DETAILS(LA_MACHINE_NO,LA_WASHING_LOAD,LA_DRYING_LOAD,LA_TIME_STARTED,LA_TIME_ENDED,LA_STATUS,LA_FEE_WASHING,LA_FEE_DRYING,LA_PAYMENT_RECEIVED,NID) values (LA_MACHINE_NO,LA_WASHING_LOAD,LA_DRYING_LOAD,LA_TIME_STARTED,LA_TIME_ENDED,LA_STATUS,LA_FEE_WASHING,LA_FEE_DRYING,LA_PAYMENT_RECEIVED,NID);
	dbms_output.put_line('Row inserted into LAUNDRY_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in LAUNDRY_DETAILS! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into LAUNDRY_DETAILS Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_LAUNDRY_DETAILS;

-----------------------INSERT_COMPLAINT_DETAILS-------------------------
PROCEDURE INSERT_COMPLAINT_DETAILS(C_REF_NO in NUMBER,C_RAISED_BY_NAME in VARCHAR2,C_RAISED_BY_APT in NUMBER,C_RAISED_TIME in TIMESTAMP,C_RAISED_DATE in DATE,C_CATEGORY in VARCHAR2,C_SEVERITY in VARCHAR2,C_DESCRIPTION in VARCHAR2,C_STATUS in CHAR,C_CLOSURE_DATE in DATE,CO_ID in NUMBER,NID in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into COMPLAINT_DETAILS(C_REF_NO,C_RAISED_BY_NAME,C_RAISED_BY_APT,C_RAISED_TIME,C_RAISED_DATE,C_CATEGORY,C_SEVERITY,C_DESCRIPTION,C_STATUS,C_CLOSURE_DATE,CO_ID,NID) values (C_REF_NO,C_RAISED_BY_NAME,C_RAISED_BY_APT,C_RAISED_TIME,C_RAISED_DATE,C_CATEGORY,C_SEVERITY,C_DESCRIPTION,C_STATUS,C_CLOSURE_DATE,CO_ID,NID);
	dbms_output.put_line('Row inserted into COMPLAINT_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in COMPLAINT_DETAILS! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into COMPLAINT_DETAILS Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_COMPLAINT_DETAILS;

end;
/