/**************************************************************************
 Caller for %minmaxgrades  (Macros/MinMaxGrades.sas)

 Builds a small mock enrollment file with the per-grade count columns
 the macro reads, then invokes the macro inside a DATA step exactly as
 the production enrollment programs do (e.g. Prog/Enrollment/minmax_*).
 Each row is a school; the macro derives adult_flag, grade_min, grade_max.
**************************************************************************/

data enroll;
  input school $ AO ps pk k _1 _2 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12;
  datalines;
ElemA   0  0 12 18 20 19 21 17  0  0  0  0  0  0  0  0  0
MiddleB 0  0  0  0  0  0  0  0  0 22 24 23  0  0  0  0  0
HighC   0  0  0  0  0  0  0  0  0  0  0  0 30 28 27 25  0
PkOnlyD 0  0 15  0  0  0  0  0  0  0  0  0  0  0  0  0  0
AdultE  9  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
;
run;

data enroll_flagged;
  set enroll;
  %minmaxgrades()
run;

proc print data=enroll_flagged noobs;
  var school adult_flag grade_min grade_max;
  title 'Min / max grade flags from %minmaxgrades';
run;
