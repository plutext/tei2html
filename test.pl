# Perl script to test the the tei2html.xsl stylesheet with Saxon.

use strict;

use FindBin qw($Bin);

my $toolsdir    = $Bin;
my $xsldir      = $toolsdir;
my $saxon       = "java -jar " . $toolsdir . "/tools/lib/saxon9he.jar ";
my $epubcheck   = "java -jar " . $toolsdir . "/tools/lib/epubcheck-3.0.1.jar ";
my $prince		= "\"C:\\Program Files (x86)\\Prince\\Engine\\bin\\prince.exe\"";


my $pwd = `pwd`;
chop($pwd);
$pwd =~ s/\\/\//g;


# Provide the imageinfo file with a full path in a parameter.
my $fileImageParam = "";
if (-f "imageinfo.xml")
{
    print "Adding imageinfo.xml...\n";
    $fileImageParam = "imageInfoFile=\"file:/$pwd/imageinfo.xml\"";
}

# Provide the custom CSS file with a full path in a parameter.
my $cssFileParam = "";
if (-f "custom.css")
{
    print "Adding custom.css stylesheet...\n";
    $cssFileParam = "customCssFile=\"file:/$pwd/custom.css\"";
}

my $opfManifestFileParam = "";
if (-f "opf-manifest.xml")
{
    print "Adding additional elements for the OPF manifest...\n";
    $opfManifestFileParam = "opfManifestFile=\"file:/$pwd/opf-manifest.xml\"";
}

my $opfMetadataFileParam = "";
if (-f "opf-metadata.xml")
{
    print "Adding additional items to the OPF metadata...\n";
    $opfMetadataFileParam = "opfMetadataFile=\"file:/$pwd/opf-metadata.xml\"";
}

print "Add col and row attributes to tables...\n";
system ("$saxon test.xml $xsldir/normalize-table.xsl > test-normalized.xml");

system ("$saxon test-normalized.xml $xsldir/tei2html.xsl $fileImageParam $cssFileParam > test.html");
system ("$saxon test-normalized.xml $xsldir/tei2epub.xsl $fileImageParam $cssFileParam $opfManifestFileParam $opfMetadataFileParam basename=\"test\" > tmp.xhtml");

system ("del test.epub");
chdir "epub";
system ("zip -Xr9Dq ../test.epub mimetype");
system ("zip -Xr9Dq ../test.epub * -x mimetype");
chdir "..";

system ("$epubcheck test.epub 2> test-epubcheck.err");


system ("$saxon test-normalized.xml $xsldir/tei2html.xsl $fileImageParam $cssFileParam optionPrinceMarkup=\"Yes\" > test-prince.html");
system ("$prince test-prince.html test.pdf");



# system ("$saxon test-div.xml $xsldir/normalize-table.xsl > test-div-normalized.xml");
# system ("$saxon test-div-normalized.xml $xsldir/tei2html.xsl $fileImageParam $cssFileParam optionExternalLinks=\"Yes\" optionExternalLinksTable=\"No\" > test-div.html");
# system ("$saxon test-div-normalized.xml $xsldir/tei2epub.xsl $fileImageParam $cssFileParam $opfManifestFileParam $opfMetadataFileParam basename=\"test-div\" > tmp-div.xhtml");

# system ("del test-div.epub");
# chdir "epub";
# system ("zip -Xr9Dq ../test-div.epub mimetype");
# system ("zip -Xr9Dq ../test-div.epub * -x mimetype");
# chdir "..";
