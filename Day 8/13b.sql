set serveroutput on

CREATE OR REPLACE FUNCTION retman(id IN varchar2)
RETURN varchar2
IS 
mid varchar2(5);
BEGIN
SELECT Manager INTO mid
FROM Employee
WHERE EmpId=id;
RETURN mid;
END;
/

DECLARE
eid varchar2(5);
man varchar2(5);
ename varchar2(10);
BEGIN
eid:='&eid';
man:=retman(eid);
SELECT EmpName into ename FROM Employee WHERE EmpId=man;
dbms_output.put_line('Manager of '||eid||' is '||man||'.'||ename);
END;
/