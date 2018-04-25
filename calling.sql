set SERVEROUTPUT ON
declare
Avg_speeds number;
P_id VARCHAR2(10):= '1024';
BEGIN
calAvg('1024',Avg_speeds);
DBMS_OUTPUT.PUT_LINE(Avg_speeds);
DBMS_OUTPUT.PUT_LINE(calavrg(P_id));
End;
/