/**************************************************************************
 Caller for %Block10_to_seniorhigh  (Macros/Block10_to_seniorhigh.sas)

 The macro definition is reproduced verbatim, then invoked over a small
 mock block file with format=Y so the display format branch executes.
**************************************************************************/

%macro Block10_to_seniorhigh( invar=geoblk2010, outvar=seniorhigh, format=N );

  length &outvar $ 1;

  &outvar = put( &invar, $bk1seniorhigh. );

  label &outvar = "Senior High School Attendance Zone ";

  %if %upcase( &format ) = Y %then %do;
    format &outvar $seniorhigha.;
  %end;

%mend Block10_to_seniorhigh;

data blocks;
  length geoblk2010 $ 15;
  input geoblk2010 $;
  datalines;
110010001001000
110010002001001
110010003002005
110019999999999
;
run;

data zoned;
  set blocks;
  %Block10_to_seniorhigh( invar=geoblk2010, outvar=seniorhigh, format=Y )
run;

proc print data=zoned noobs label;
  var geoblk2010 seniorhigh;
  title 'Census blocks mapped to Senior High Attendance Zones';
run;
