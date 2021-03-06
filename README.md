# tei2html

A collection of XSLT 2.0 style sheets to transform a document encoded in according to the TEILite DTD to HTML. 
They have been specifically developed to create a monolithic (single) HTML document for posting on 
[Project Gutenberg](http://www.gutenberg.org/), but are also capable of generating ePub files from the same 
source with a similar look and feel. In line with the type of material Project Gutenberg deals with, these 
style sheets are designed to deal with encoded pre-existing works, rather than works created digitally from scratch.

The transformation supports the following elements as present in TEI:

  * Plain Text and text styles
  * Title Pages
  * Tables
  * Lists
  * Tables of contents
  * Poetry and Plays
  * Footnotes
  * Illustrations
  * Cover images

Furthermore, the script can generate

  * Tables of Contents.
  * Lists of Corrections.
  * Colophons
  * Metadata as used in ePub

Tei2Html includes localisation support for English, Dutch, and to a lesser extend German, French, Spanish, 
Tagalog and Cebuano.

Note, that these scripts partly depend on the use of rend attributes and other TEI conventions. It should 
not be expected that an arbitrary TEI file renders well with those scripts (although it should render 
reasonable in any case.)

If you need modifications, extensions of these scripts, or need to have other TEI/XML/XSLT related work 
done, please be in touch with me on how I can help (at a fee).

## External Links

  * [TEI tools](http://www.tei-c.org/Tools/)
  * [another take at converting TEI to HTML](http://www.tei-c.org/Tools/Stylesheets/)
  * [another link to TEI converters](http://wiki.tei-c.org/index.php/Tei-xsl)
  * [OxGarage, tools to convert TEI files](http://www.oucs.ox.ac.uk/oxgarage/)
