
create or replace function calavrg(Pa_id IN varchar2)
return PACKAGE_INFO.Night_Speed%TYPE is
s1 PACKAGE_INFO.Night_Speed%TYPE;
s2 PACKAGE_INFO.YT_Speed%TYPE;
s3 PACKAGE_INFO.FTP_Speed%TYPE;

begin
Select Night_Speed, YT_Speed, FTP_Speed into S1, S2, S3 from PACKAGE_INFO where PACKAGE_id=Pa_id;
Avg_Speed:= (S1+S2+S3)/3;
return Avg_speed;
end;
/