options obs=100;

/* ------------------------------------------------------------------ *
 * Macro under test: %Block10_to_seniorhigh
 *                   (Macros/Block10_to_seniorhigh.sas)
 *
 * Maps a 2010 Census block ID to a DC Senior High School Attendance
 * Zone via the $bk1seniorhigh. format, optionally applying the
 * display format $seniorhigha. The production run sources both formats
 * from the Schools format catalog; here we stand up small mock formats
 * with the same names so the macro's PUT() + label + conditional
 * FORMAT logic can run. The macro body itself is reproduced verbatim
 * in script.sas.
 * ------------------------------------------------------------------ */

proc format;
  /* block-id -> zone code (one char) */
  value $bk1seniorhigh
    '110010001001000' = 'A'
    '110010002001001' = 'B'
    '110010003002005' = 'C'
    other             = 'Z';
  /* zone code -> display label */
  value $seniorhigha
    'A' = 'Anacostia HS Zone'
    'B' = 'Ballou HS Zone'
    'C' = 'Cardozo HS Zone'
    'Z' = 'Unzoned';
run;
