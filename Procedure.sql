
------Procedure with IN and OUT-----
set SERVEROUTPUT ON
Create or replace procedure calAvg( P_id IN varchar2, Avg_Speed OUT number) IS
Speed1 PACKAGE_INFO.Night_Speed%TYPE;
Speed2 PACKAGE_INFO.YT_Speed%TYPE;
Speed3 PACKAGE_INFO.FTP_Speed%TYPE;
begin

Select Night_Speed, YT_Speed, FTP_Speed into Speed1, Speed2, Speed3 from PACKAGE_INFO where PACKAGE_id=P_id;
Avg_Speed:= (Speed1+Speed2+Speed3)/3;
end;
/

