# Full Article

The class `fullarticle.cls` can be used to typeset research papers or reports using the `article` class in LaTeX.

### Included Packages

In addition to the defaults, `fullarticle.cls` includes commonly used packages:

* `geometry` to customise margins,
* `graphicx` to handle images and figures,
* `booktabs` for better looking tables,
* `caption`for better captions,
* `xcolor` for coloured text and output,
* `fancyhdr` for _fancy_ style paging,
* `authblk` to automatically handle multiple authors and affiliations,
* `tocbibind` to include the bilbliography in the table of contents \(using `nottoc` option to avoid duplicating the _Contents_ section in the table\),
* `biblatex` for bibliography support \(with `biber` backend, `none` sorting, `ieee` style of citations, and 3 names at most before truncating with _et al._\),
* `bookmark` to import _hyperref_ and customise the metadata.

{% hint style="info" %}
Add

```text
\hypersetup
{%
    pdftitle={title},
    pdfsubject={subject},
    pdfkeywords={keywords}
}
```

to complete the metadata setup.
{% endhint %}

### Commands

{% tabs %}
{% tab title="Email" %}
Use `\email{URL}` to add an clickable URL to the `\thanks` field in the author\(s\) definition.
{% endtab %}
{% endtabs %}

