# Cover Letter

The class `cover.cls` provides a template for a one page cover letter to accompany a curriculum vitae or a resume.

### Included Packages

In addition to the packages in the default `article` class, this class includes:

* `graphicx` to handle figures and pictures,
* `enumitem` to control the spacing in enumeration environments,
* `fontawesome` for symbols and icons,
* `booktabs` for an improved _tabular_ environment \(with `multicol` and `multirow` support if needed\),
* `xcolor` for coloured text and output,
* `framed` for shaded backgrounds,
* `mdframed` for T_ikz_ boxes,
* `ragged2e` to improve text alignment,
* `bookmark` for _hyperref_ and metadata.

### Fonts and Compiler

The class uses `XeLaTeX` to compile in order to have access to system fonts. By default it uses the **DejaVu Sans** family.

### Macros

The following macros are defined for metadata and title:

* `\authorname` for the author's first and middle name,
* `\authorsurname` for the author's surname,
* `\skypename` for the author's Skype username,
* `\skypeinvite` for the author's Skype link,
* `\github` for the author's GitHub link \(username\),
* `\linkedin` for the author's LinkedIN profile \(username\),
* `\phone` for the author's phone number,
* `\email` for the author's e-mail link,
* `\address` for the work or home address.

### Commands and Environments

The class simply renews the `\maketitle` command to display information input using macros in fancier way. It also provides the environment `\begin{receiver} ... \end{receiver}` to enter the generalities of the receiving end of the cover letter.

