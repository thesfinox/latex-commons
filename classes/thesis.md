# Thesis

The `thesis.cls` class provides environments and commands to typeset a Ph.D. thesis with very simple title pages and style. Ideally this is the template for thesis in the Dep. of Physics at the [University of Torino](https://en.unito.it/), Italy.

### Included Packages

In addition to the default packages in the `article` class, the class includes:

* `graphicx` for pictures and figures,
* `geometry` for margins,
* `booktabs` for improved tables \(with `multicol` and `multirow` support if needed\),
* `caption` for better control over captions,
* `xcolor` for coloured output and text,
* `fancyhdr` for _fancy_ style,
* `tocbibind` to insert the bibliography in the table of contents \(with `nottoc` option to avoid duplicating the _Contents_ section in the table\),
* `titlesec` to customise title page and sectioning,
* `biblatex` to handle the bilbiography \(`bibtex` backend, `none` sorting, `ieee` style, and at most 3 names before truncating to _et al._\),
* `bookmark` to load _hyperref_ and customise metadata.

### Compiler

The class uses `XeLaTeX` to compile to have more freedom over fonts.

### Macros

The class provides the following macros used to typeset the title page:

* `\author` for the author name and surname,
* `\title` for the title of the thesis,
* `\advisor` for the name of the Ph.D.  advisor,
* `\institution` for the institute,
* `\school` for the name of the specialisation school,
* `\specialisation` for the name of the specialisation/department,
* `\logo` for the logo of the university/college

### Environments

The following are the environments provided by the class.

{% tabs %}
{% tab title="Abstract" %}
The environment `abstractpage` provides a space in which to type the standalone abstract of the thesis.
{% endtab %}

{% tab title="Acknowledgements" %}
The environment `acknowledgmentspage` provides a standalone page for ackowledgments.
{% endtab %}
{% endtabs %}

### Commands

This is a collection of commands which can be used to typeset the thesis:

{% tabs %}
{% tab title="Title page" %}
The command `\maketitlepage` is reminiscent of `\maketitle` in the standard `article` class. It creates a simple title page to display information.
{% endtab %}

{% tab title="Frontespice" %}
The command `\makefrontespice` generates a second title page to accompany the first containing more explicit information.
{% endtab %}

{% tab title="Clear page" %}
The command `\cleardoubleplainpage` provides clearing of two pages \(without styling\) to start in odd pages.
{% endtab %}

{% tab title="TOC" %}
The command `\plaintoc` generates a table of contents without specific styles defined.
{% endtab %}

{% tab title="Parts" %}
The command `\thesispart` creates a standalone page with the title of the _part_ section. It takes one argument representing the title of the _part_.
{% endtab %}

{% tab title="Outline" %}
Using `\outline` it is possible to insert an unnumbered section containing the standalone outline of the thesis. It takes one argument representing the title of the section. It will be added to the table of contents before the first _part_ section.
{% endtab %}
{% endtabs %}

