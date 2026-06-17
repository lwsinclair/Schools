/**************************************************************************
 Program:  School Formats  (Prog/School Formats.sas)  -- $SchType block
 Project:  SCHOOLS DCDATA
 Author:   S. Litschwartz

 The source program builds the Schools format catalog. The $SchType
 VALUE block below is reproduced verbatim from the program; the
 data-driven %Data_to_format steps that follow it in the original
 require the master school file library and are out of scope for an
 isolated run. Here the format is applied to a small mock school file
 and tabulated, exercising the format definition end to end.
**************************************************************************/

proc format;
value $SchType
"0"="Charter"
"1"="DCPS"
;
run;

data schools;
  length sch_type $ 1 school $ 12;
  input sch_type $ school $ enrolled;
  datalines;
1 Wilson      1455
1 Eastern      820
1 Ballou       690
0 KIPPDC       540
0 DCIntl       410
0 Friendship   375
;
run;

proc freq data=schools;
  tables sch_type / nocum;
  format sch_type $SchType.;
  title 'School counts by type (School Formats $SchType)';
run;

proc means data=schools n sum mean maxdec=1;
  class sch_type;
  var enrolled;
  format sch_type $SchType.;
  title 'Enrollment by school type';
run;
