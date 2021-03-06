# Introduction #

For my internal processing, I follow a number of steps to go from my master TEI file to HTML or ePub output. These are described here.


# Step 1: Convert from SGML to XML #

Most of my TEI files are in (old-school) SGML format with the '.tei' extension. This needs to be converted to XML, before XSLT wants to do anything with it.

## Step 1.1: Convert transcriptions to SGML entities. ##

Some of my TEI files include snippets of non-Latin script in various transcription formats. These need to be converted to SGML entities (either named or numeric) before we can actually transform to XML. For this, I use a 'patc' tool that will change such transcriptions. For each transcription, a separate run is needed. The 'tei2html.pl' script will check for such transcriptions, and run the right patc tool as needed.

## Step 1.2: Convert to XML. ##

The actual SGML to XML conversion is achieved by running the SX tool.

# Step 2: Run Saxon to generate HTML #

Now that we have XML, we can apply the XSLT transformation on it. This will result in a single HTML output file. Here, again a few intermediate steps are needed.

## Step 2.1: Normalize tables ##

Table handling in TEI and HTML is complicated. To deal with them correctly, we have a separate XSLT stylesheet that adds row and column numbers to cells in tables (leaving the rest of the XML untouched). With those numbers present, styling can be applied to tables more reliable. This script will also warn you when you have tables where the number of (effective, after dealing with spans) columns is not the same for each row.

## Step 2.2: Transform to HTML ##

After the tables have been normalised, we're ready to transform to HTML. This is done now.