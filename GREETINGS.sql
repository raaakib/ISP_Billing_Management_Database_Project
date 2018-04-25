drop TABLE BILL_HISTORY;
drop table BILL_INFO;
drop table USER_INFORMATION;
drop table PACKAGE_INFO;


  CREATE TABLE PACKAGE_INFO
  (Package_ID        VARCHAR2(20) not null,
   Package_Name       VARCHAR2(10) NOT NULL,
   Normal_Speed       number(10),
   Rate    NUMBER(10),
   Night_Speed       number(10),
   YT_Speed       number(10),
   FTP_Speed       number(10),
   PRIMARY KEY (Package_ID)
);
INSERT INTO PACKAGE_INFO VALUES ('512','512 Kbps',512,400,512,1024,2048);
INSERT INTO PACKAGE_INFO VALUES ('1024', '1024 Kbps', 1024, 700,1024,1024,2048 );
select * from PACKAGE_INFO;


CREATE TABLE USER_INFORMATION
  (User_ID        VARCHAR2(20),
   Password       NUMBER(10) NOT NULL,
   User_no       NUMBER(10) NOT NULL,
   Phone_no         NUMBER(12),
   Address      varchar2(15),
   Package_ID    VARCHAR2(20) NOT NULL,
   PRIMARY KEY (User_ID),
   FOREIGN KEY (Package_ID) REFERENCES PACKAGE_INFO(Package_ID)
);
INSERT INTO USER_INFORMATION VALUES ('rakib',01728872790,1,01728872790,'109W,AEH',512);
INSERT INTO USER_INFORMATION VALUES ('reaz',01728872791,2,01728872791,'109W,AEH',512);
INSERT INTO USER_INFORMATION VALUES ('rezaul',01728872792,3,01728872792,'109W,AEH',1024);
INSERT INTO USER_INFORMATION VALUES ('habib',01728872793,4,01728872793,'109W,AEH',512);
INSERT INTO USER_INFORMATION VALUES ('dihan',01728872794,5,01728872794,'109W,AEH',1024);
INSERT INTO USER_INFORMATION VALUES ('yead',01728872795,6,01728872795,'109W,AEH',512);
select * from USER_INFORMATION;


CREATE TABLE BILL_INFO
  (User_ID        VARCHAR2(20),
   Package_ID    VARCHAR2(20) NOT NULL,
   Month      varchar2(15),
   Datatzmonth varchar2(15),
   Bill NUMBER(10),
   Due_bill NUMBER(10),
   FOREIGN KEY (Package_ID) REFERENCES PACKAGE_INFO(Package_ID),
   FOREIGN KEY (User_ID) REFERENCES USER_INFORMATION(User_ID)
);
INSERT INTO BILL_INFO VALUES ('rakib',512,'February','5GB',400,0);
INSERT INTO BILL_INFO VALUES ('reaz',512,'June','10GB',400,0);
INSERT INTO BILL_INFO VALUES ('dihan',512,'February','5GB',400,0);
INSERT INTO BILL_INFO VALUES ('habib',512,'March','11GB',400,0);
INSERT INTO BILL_INFO VALUES ('yead',512,'February','25GB',400,0);
  select * from BILL_INFO;

  CREATE TABLE BILL_HISTORY 
  (User_ID    varchar2 (20),
  	Total_used_data varchar2(15),
  	Total_bill number(10),
  	Total_paid number(10),
  	Total_due NUMBER(10),
  	FOREIGN KEY (User_ID) REFERENCES USER_INFORMATION(User_ID)
  	);

INSERT INTO BILL_HISTORY VALUES ('rakib','200GB',3734, 3700, 34);
INSERT INTO BILL_HISTORY VALUES ('reaz','434GB',84684, 468, 34);
INSERT INTO BILL_HISTORY VALUES ('rezaul','5345GB',3734, 3700, 584);
INSERT INTO BILL_HISTORY VALUES ('dihan','5685GB',3734, 3700, 34);
INSERT INTO BILL_HISTORY VALUES ('habib','200GB',4+4, 47974, 6545);
select * from BILL_HISTORY;
describe USER_INFORMATION;
describe BILL_HISTORY;
describe PACKAGE_INFO;
describe BILL_INFO;


CREATE OR REPLACE PROCEDURE greetings 
AS 
BEGIN 
   dbms_output.put_line('Hello World!'); 
END; 
/
EXECUTE greetings;


-------procedure with no parameters---
SET SERVEROUTPUT ON
create or replace procedure info_show is
user_name USER_INFORMATION.User_ID%type;
users_package USER_INFORMATION.Package_ID%type;
begin
select User_ID,Package_ID into user_name,users_package from USER_INFORMATION where Phone_no=01728872790;
DBMS_OUTPUT.PUT_LINE('USER NAME = ' || user_name || ' and his/her  Package_ID = ' || users_package);
END info_show;
/
SET SERVEROUTPUT ON
Execute info_show;
/
------PROCEDURE WITH NO PARAMETERS------

set serveroutput on
--Declare
 CREATE OR REPLACE PROCEDURE GreatPackage IS 
     user512 number(2);
     user1024 number(2);
Begin
    select count(Package_ID) into user512 from USER_INFORMATION where Package_ID = 512;
    select count(Package_ID) into user1024 from USER_INFORMATION where Package_ID = 1024;
    if user1024 > user512
    then DBMS_OUTPUT.PUT_LINE('User of 1024 Kbps is larger.');
    else DBMS_OUTPUT.PUT_LINE('User of 512 Kbps is larger');
    end if;
End GreatPackage; 
/
SET SERVEROUTPUT ON
Execute GreatPackage;
/




set SERVEROUTPUT ON
declare
Avg_speeds number;
P_id VARCHAR2(10):= '1024';
BEGIN
calAvg('1024',Avg_speeds);
DBMS_OUTPUT.PUT_LINE(Avg_speeds);
DBMS_OUTPUT.PUT_LINE(calAvg2(P_id));
End;
/







set SERVEROUTPUT ON
declare

BEGIN

End;
/






----FOR LOOP-----

SET SERVEROUTPUT ON
DECLARE
   --counter number;
   userid  USER_INFORMATION.User_ID%TYPE;
   phoneno USER_INFORMATION.Phone_no%TYPE;
   addr USER_INFORMATION.Address%TYPE;
   idnum USER_INFORMATION.User_no%TYPE;
  
BEGIN

   FOR counter IN 1..6
   LOOP

      SELECT User_ID, Phone_no, Address
      INTO userid, phoneno, addr
      FROM USER_INFORMATION
      WHERE
      idnum = counter;


      DBMS_OUTPUT.PUT_LINE ('Users name  ' || userid );
      DBMS_OUTPUT.PUT_LINE ('Users Phone_no' || phoneno);
      DBMS_OUTPUT.PUT_LINE ('Users Address  ' || addr );
      DBMS_OUTPUT.PUT_LINE ('-----------');
   END LOOP;
END;
/


-------while loop--------

SET SERVEROUTPUT ON
DECLARE
	counter number;
   userid  USER_INFORMATION.User_ID%TYPE;
   phoneno USER_INFORMATION.Phone_no%TYPE;
   addr USER_INFORMATION.Address%TYPE;
   idnum USER_INFORMATION.User_no%TYPE;
  
BEGIN

   WHILE counter <= 6 
   LOOP

      SELECT User_ID, Phone_no, Address
      INTO userid, phoneno, addr
      FROM USER_INFORMATION
      WHERE
      idnum = counter;

      DBMS_OUTPUT.PUT_LINE ('Users name  ' || userid );
      DBMS_OUTPUT.PUT_LINE ('Users Phone_no' || phoneno);
      DBMS_OUTPUT.PUT_LINE ('Users Address  ' || addr );
      DBMS_OUTPUT.PUT_LINE ('-----------');

      counter := counter + 1 ;

   END LOOP;
END;
/