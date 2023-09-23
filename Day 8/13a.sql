CREATE OR REPLACE PROCEDURE inc_comm(old IN NUMBER,new OUT NUMBER)
AS
BEGIN
	new:=old+old*0.05;
END;

DECLARE
	id varchar2(5);
	oldcom number(38);
	newcom number(38);
BEGIN
	dbms_output.put_line('Enter Employee Id = ');
	id:='&id';

	select Comm into oldcom
	from Employee
	where EmpId=id;

	inc_comm(oldcom,newcom);
	
	update Employee
	set Comm=newcom
	where EmpId=id;
END;




	