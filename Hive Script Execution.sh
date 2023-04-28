show databases;
create database if not exists bda65;
Use bda65;

Check location from hdfs:
hadoop fs -ls /user/hive/warehouse

Managed tables:
create table if not exists emp(empno int, ename string, sal float, comm float, dpno int) row format delimited fields terminated by ',’;
describe emp;
load data local inpath '/home/karan7/data/emp.csv' into table emp;
Select * from emp;

External Tables:
create external table  ext_emp1(empno int,ename string,sal float,dpno int) row format delimited fields terminated by ',’ location '/user/karan7/data/emp’;
#While giving path we have to give only directory path not file name
#Here, table will be in given hdfs path.

create external table  ext_emp2(empno int,ename string,sal float,dpno int) row format delimited fields terminated by ‘,’;
Table will be stored under /user/hive/warehouse/bda21_db/ext_emp2/emp

load data local inpath '/home/karan7/empdata' into table ext_emp2;

Partioning:
set hive.exec.dynamic.partition.mode;
set hive.exec.dynamic.partition.mode=nonstrict;

create external table emp_dept(empno int,ename string,sal float) partitioned by (dpno int) row format delimited fields terminated by ',’;
insert into table emp_dept partition(dpno) select * from emp;

Check:
hadoop fs -ls /user/hive/warehouse/bda21_db
