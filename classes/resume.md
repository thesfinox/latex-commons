# Resume

The class `resume.cls` provides environments and commands to create a one page, two columns resume. It is based on the `article` class in LaTeX.

### Included Packages

In addition to the defaults, the class provides:

* `graphicx` to handle figures and pictures,
* `enumitem` to control the spacing in enumeration environments,
* `fontawesome` for symbols and icons,
* `booktabs` for an improved _tabular_ environment \(with `multicol` and `multirow` support if needed\),
* `xcolor` for coloured text and output,
* `framed` for shaded backgrounds,
* `mdframed` for T_ikz_ boxes,
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
* `\email` for the author's e-mail link.

### Environments

The following are the defined environments which can be used to typeset the resume. Ideally one could use two `minipage` environments, one including a _sidebar_ and one including the _main_ portion.

{% tabs %}
{% tab title="Main" %}
The environment `cvmain` represents the main portion of the resume with work experience, skills, etc.
{% endtab %}

{% tab title="Sidebar" %}
The environment `cvsidebar` can be used to typeset a column with a shaded background
{% endtab %}

{% tab title="About" %}
The environment `cvabout` contains the summary of the resume and is usually inserted inside the `cvmain` environment.
{% endtab %}

{% tab title="Sections" %}
The environment `cvmainsection` is used for a boxed section inside the `cvmain` environment.

It takes one argument representing the title of the section:

```text
\begin{cvmainsection}{Title}
  ...
\end{cvmainsection}
```
{% endtab %}

{% tab title="Itemize" %}
The environment `cvitemize` provides a list of bragging points with optimised spacing. It can be used inside any environment.
{% endtab %}
{% endtabs %}

### Commands

The following are the commands which can be used to insert entries and descriptions:

{% tabs %}
{% tab title="Title" %}
The command `\cvtitle` creates the title section of the resume including generalities, contact information and social media links. It usually is the first command after `\begin{document}`.
{% endtab %}

{% tab title="Sections" %}
The command `\cvsection` takes one argument as the title of a subsection. It can for example be used in the sidebar to divide education, certifications, etc.
{% endtab %}

{% tab title="Entries" %}
The command `\cventry` is used to insert an item in the resume. It may be the name of the univeristy or college, the title of a course or the name of the position covered.
{% endtab %}

{% tab title="Roles" %}
Roles are inserted with `\cvrole`. It takes 3 arguments:

* the 1st represents the start date,
* the 2nd is the end date and can be left empty for currently covered roles,
* the 3rd is the name of the company.
{% endtab %}

{% tab title="Descriptions" %}
The command `\cvdescription` takes the description of the role or the bragging points through the `cvitemize` environment as argument.
{% endtab %}

{% tab title="GDPR" %}
`\cvgdpr` inserts the European GDPR statement \(usually at the bottom of the main section\).
{% endtab %}
{% endtabs %}

