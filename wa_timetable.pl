#Nicole Blanco and Sandley Guo

#search
sub search {
	# Mechanize_webadvisor.pl - Try WWW::Mechanize with webadvisor.

	use WWW::Mechanize;

	$url = "https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesV2.aspx";
	my $mech = WWW::Mechanize->new();
	$mech->get($url);

	#Select the term
	$term = $ARGV[0];

	$mech->field("_ctl0:MainContent:ddlTerm", $term);
	$subject = $ARGV[1];

	$mech->field("_ctl0:MainContent:ddlSubj_1", $subject);

	#Click the Submit Button
	$mech->click_button(name => "_ctl0:MainContent:btnSubmit");

	#Get resulting html from clicking Submit. 
	my $page = $mech->content();

	print $page;
} #end Search();

#help
sub help {
	$message = <<"END_MSG";
			
			Term         : which Term (semester) the class is in, e.g. "19/SP - 2019 Spring"
			Subject      : which Subject the class is in, e.g. English 
			-help        : display a help screen and sample usage.
			-terms       : list all currently available Terms
			-subjects    : list all currently available Subjects

END_MSG
 
	print $message;
}#end help();


#subjects
sub subjects {
	use WWW::Mechanize;

	$url="https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesV2.aspx";
	my $mech = WWW::Mechanize->new();
	$mech->get($url);

	my $page = $mech->content();

	($subjects_section) = $page =~ /<select name="_ctl0:MainContent:ddlSubj_1"(.+?)<\/select>/s; 
	
	(@subjects_tag) = $subjects_section =~ /<option value="[A-Z]+">(.+?)<\/option>/g;

	foreach $sub (@subjects_tag){
		print ("$sub\n");
	}
}#end subjects();


#terms
sub terms {
	use WWW::Mechanize;

	$url=" https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesV2.aspx";
	my $mech = WWW::Mechanize->new();
	$mech -> get($url);

	my $page = $mech -> content();

	($terms_section) = $page =~ /<select name="_ctl0:MainContent:ddlTerm"(.+?)<\/select>/s; 
	
	(@terms_tag) = $terms_section =~ /<option value=".*">(.+?)<\/option>/g;

	foreach $term (@terms_tag){
		print ("$term\n");
	}
}#end terms();

#run help() if not enough command line args or if 1st arg contains -help:
if ($ARGV[0] =~ /-help/) { #if $ARGV[0] contains -help
	help();
	exit(1); #non-zero exit status means an error
} elsif ($ARGV[0] =~ /-terms/) {
	terms();
	exit(1); #non-zero exit status means an error
} elsif ($ARGV[0] =~ /-subjects/) {
	subjects();
	exit(1); #non-zero exit status means an error
} else {
	search();
	exit(1); #non-zero exit status means an error
}

#Get sortby argument from first command line arg:
my $sortby = shift @ARGV; 
