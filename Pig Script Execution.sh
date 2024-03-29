Copy files to read:
hdfs dfs -put /home/karan7/hadoopdata/empdata.csv /user/data/empdata_pig.csv

Load Data:
A = load '/user/root/pig/empdata.csv' using PigStorage(',') as (eid:int,ename:chararray,epos:chararray,esal:int,ecom:int,edpno:int);

Dump A;

A2 = load '/user/root/pig/empdata.csv’;

describe A2;

Aggregate (by row):

B = filter A by edpno==20;
B2 = filter A by edpno==20 and esal=='2000’,
C = limit B 3;
D = order C by esal desc;

Store Data:
store D into '/pig/pigout1’ using PigStorage(',’);

Transform (by column):
Select existing column
E = foreach A generate eid;

Create new column:
F = foreach A generate *, ecom*2 as Bonus,esal*5 as Incentive;

Transform columns:
G = foreach A generate SUBSTRING(ename,0,4);

Advanced codes:
H = foreach A generate $0,$1;
