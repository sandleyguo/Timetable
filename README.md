CS-371, Spring 2019
Perl Project - Retrieve Web Advisor Course Timetable

Due: Tuesday, Feb 26, 2019, 11:59pm

Work in groups of 2-3.

Write a Perl script, wa_timetable.pl, to retrieve a department course timetable from https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesV2.aspx.

Dropbox wa_timetable.pl, containing project source code. Put every group member's name in a comment block.

wa_timetable.pl will take the following command line arguments:

  * Term         : which Term (semester) the class is in, e.g. "19/SP - 2019 Spring"
  * Subject      : which Subject the class is in, e.g. English
  * -help        : display a help screen and sample usage
  * -terms       : list all currently available Terms
  * -subjects    : list all currently available Subjects

A sample usage for wa_timetable.pl is:

     perl -w wa_timetable.pl "19/SP - 2019 Spring" "ENGLISH (EN)"

The above run of wa_timetable.pl must return the html code that displays the course timetable for English, Spring 2019. Your program must be able to retrieve timetables for all available semesters and subjects. The output html code may be displayed in the console (terminal). (See Note 1 below.)

For the -terms and -subjects command line arguments, wa_timetable.pl must extract and display currently available Terms and Subjects from https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesV2.aspx. For example, running

	perl -w wa_timetable.pl -terms

will output

	19/SP - 2019 Spring
	19P2/SP - 2019 Spring - PA Program
	19P3/SP - 2019 Spring - PA Program
	19/SU - All Summer 2019
	19/SA - Summer A 2019
	19/SB - Summer B 2019
	19/SC - Summer C 2019
	19/SD - Summer D 2019
	19/SE - Summer E 2019


	perl -w wa_timetable.pl -subjects

will output

	AFRICANA STUDIES (AA)
	ANTHROPOLOGY (AN)
	ARABIC (FA)
	
… many lines omitted …

SPEECH LANGUAGE PATHO (SLP)
	STUDY ABROAD
	THEATRE (TH)

Links:
Perl web automation
http://perldoc.perl.org/perlrequick.html#Extracting-matches
http://www.perl101.org/regexes.html (common regex match flags)
Also see https://stackoverflow.com/questions/159118/how-do-i-match-any-character-across-multiple-lines-in-a-regular-expression
Perl exercise 5 - command line arguments
Perl exercise 7 - html parsing (Also see mechanize_webadvisor.pl which we worked on in class.)
Notes:


Note 1:
To redirect the program output to a HTML file, you can use standard output redirection:

	perl -w wa_timetable.pl "19/SP - 2019 Spring" "ENGLISH (EN)" > ensp19.html
