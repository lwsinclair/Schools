options obs=100;

/* ------------------------------------------------------------------ *
 * Macro under test: %minmaxgrades  (Macros/MinMaxGrades.sas)
 *
 * The macro is a DATA-step body: given per-grade enrollment counts
 * (AO, ps, pk, k, _1 .. _12) it flags adult-only schools and derives
 * the lowest (grade_min) and highest (grade_max) grade offered.
 * Reproduced verbatim below so the bundle exercises the author's
 * logic; the caller DATA step supplies a small mock enrollment file.
 * ------------------------------------------------------------------ */

%macro minmaxgrades ();

/* Flag adult-only school */
if AO >0 then do;
	adult_flag = 1;
end;

else do;

	/* Flag lowest grade */
	if ps > 0 then grade_min = -2;
		else if pk > 0 then grade_min = -1;
		else if k > 0 then grade_min = 0;
		else if _1 > 0 then grade_min = 1;
		else if _2 > 0 then grade_min = 2;
		else if _3 > 0 then grade_min = 3;
		else if _4 > 0 then grade_min = 4;
		else if _5 > 0 then grade_min = 5;
		else if _6 > 0 then grade_min = 6;
		else if _7 > 0 then grade_min = 7;
		else if _8 > 0 then grade_min = 8;
		else if _9 > 0 then grade_min = 9;
		else if _10 > 0 then grade_min = 10;
		else if _11 > 0 then grade_min = 10;
		else if _12 > 0 then grade_min = 12;

	/* Flag highest grade */
	if _12 > 0 then grade_max = 12;
		else if _11 > 0 then grade_max = 11;
		else if _10 > 0 then grade_max = 10;
		else if _9 > 0 then grade_max = 9;
		else if _8 > 0 then grade_max = 8;
		else if _7 > 0 then grade_max = 7;
		else if _6 > 0 then grade_max = 6;
		else if _5 > 0 then grade_max = 5;
		else if _4 > 0 then grade_max = 4;
		else if _3 > 0 then grade_max = 3;
		else if _2 > 0 then grade_max = 5;
		else if _1 > 0 then grade_max = 1;
		else if k > 0 then grade_max = 0;
		else if pk > 0 then grade_max = -1;
		else if ps > 0 then grade_max = -2;

end;

%mend minmaxgrades;
