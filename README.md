# gsIntroR
This package contains materials to teach USGS water data users how to use R [better].

## How to use this package
The workshop schedule and all lessons are stored as R vignettes. View these materials in RStudio like this:

1. Navigate to the Packages tab (Ctrl/Cmd-7)
2. Click on the word 'gsIntroR'
3. Click the link for "User guiides, package vignettes and other documentation"
4. The Help window should now contain links to the HTML, source, and R code for each vignette. Click the desired link to see more.

##Disclaimer
This software is in the public domain because it contains materials that originally came from the U.S. Geological Survey, an agency of the United States Department of Interior. For more information, see the [official USGS copyright policy](http://www.usgs.gov/visual-id/credit_usgs.html#copyright/ "official USGS copyright policy")

Although this software program has been used by the U.S. Geological Survey (USGS), no warranty, expressed or implied, is made by the USGS or the U.S. Government as to the accuracy and functioning of the program and related program material nor shall the fact of distribution constitute any such warranty, and no responsibility is assumed by the USGS in connection therewith.

This software is provided "AS IS."

 [
    ![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png)
  ](http://creativecommons.org/publicdomain/zero/1.0/)

##Notes for Instructors
Vignettes should be edited in the vignettes folder and then moved to the inst/doc folder by these steps:

1. Build/reload the package
2. devtools::build_vignettes()
3. Build/reload the package again
4. Vignettes will now be in package help