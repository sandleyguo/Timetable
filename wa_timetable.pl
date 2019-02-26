# wa_timetable.pl
# Sandley Guo
#

open FILE, "<classV2.htm";

$classes = do { local $/; <FILE> };

sub help {
	#Using a Perl "heredoc";
	$message = <<"END_MSG";
			
			Term         : which Term (semester) the class is in, e.g. "19/SP - Spring 2019"
			Subject      : which Subject the class is in, e.g. English 
			-help        : display a help screen and sample usage.
			-terms       : list all currently available Terms
			-subjects    : list all currently available Subjects

END_MSG
 
	print $message;
}		#end help();

#run help() if not enough command line args or if 1st arg contains -h:
$numargs = $#ARGV + 1;
if ($numargs < 2 || $ARGV[0] =~ /-h/) { #if $ARGV[0] contains -h
	help();
	exit(1); #non-zero exit status means an error
}

#Get sortby argument from first command line arg:
my $sortby = shift @ARGV; 

# Read all the headlines into @headkines:
@term = $classes =~ /<optional>(.+)<\/optional>/g;
# Each headline is (.+) between <optional> and </optional>.
# Need to use () to exclude <optional> tags in match.
# Must use \ in front of / in <optional>.

# Display headlines:
foreach my $h1 ( @optional ) {
	print "$h1\n";
}
