# Cover Pages #

Older books where often sold in simple paper covers, often just repeating the information on the title page. It was expected that the buyer of the book would bind it (or more likely have it bound by a professional bookbinder). As a result, covers for older books are not standard, and often do not contain more than a short title on the spine. The practice of selling books in nice decorative covers started in the late nineteenth century. Including the original cover of the book as an illustration in the TEI version is often nice, and is also a great feature for ePub devices, which use cover images to generate thumbnails from.

When generating ePubs, `tei2html` expects the cover image to be indicated in a specific way in the front matter, using the exact `id`s as shown below:

```
<div1 id="cover" type="Cover">
<p><figure id="cover-image" rend="image(images/front.jpg)"/></p>
```

To make this work with the various ePub ebook readers, make this image 600 by 800 pixels, preferably as full color JPG.

When a cover image is missing, a title page image can be used instead, as long as it is encoded following this convention (again, it are the `id`s that matter, not the file names):

```
<div1 id="titlepage" type="Titlepage">
<p><figure id="titlepage-image" rend="image(images/titlepage.png)"/></p>
```


See also: http://blog.threepress.org/2009/11/20/best-practices-in-epub-cover-images/


## Cover Thumbnail ##

Sometimes it makes sense to also have a cover thumbnail which isn't just a reduction of the (original) cover page. To do this, just specify (as a hack) `cover-thumbnail(imagefile)` in the rend attribute of the text element. Similarly, `cover-image(imagefile)` can be used to specify a cover image that is not part of the original book, for those who like to have both. [TODO: implement this].