# Science Stuff

The package `sciencestuff.sty` provides shortcuts for commonly inserted commands in scientific texts.

### Included Packages

Together with new commands, the package also automatically includes:

* `amsmath`, `amssymb`, `amsfonts` for mathematical symbols and fonts,
* `dsfonts` for improved numerical sets,
* `upgreek` for upright Greek letters,
* `physics` for common physics-related objects,
* `siunitx` for SI units of measurements,
* `cleveref` for improved citations.

### Commands

This is a collection of commands which can be used:

{% tabs %}
{% tab title="Numerical sets" %}
* `\1` for the identity matrix,
* `\N`, `\Q`, `\R`, `\Z` for numeric sets.
{% endtab %}

{% tab title="Math letters" %}
* `\c<capital-letter>` for calligraphic letters,
* `\r<capital-letter>` for romanic letters,
* `\f<capital-letter>` for Gothic letters.
{% endtab %}

{% tab title="Groups" %}
* `\O{<num>}` for orthogonal groups,
* `\SO{<num>}` for special orthogonal groups,
* `\U{<num>}` for unitary groups,
* `\SU{<num>}` for special unitary groups,
* `\GL{<num>}{<field>}` for general linear groups,
* `\SL{<num>}{<field>}` for special linear groups.
{% endtab %}

{% tab title="Inline derivatives" %}
`\ipd{<letter>}` can be used for inline partial derivatives \(e.g. `\ipd{u}` is equivalent to `\partial_u`\).
{% endtab %}

{% tab title="Line elements" %}
As `\dd[<num>]{<letter>}` can be used to print `\mathrm{d}^<num> <letter>`, `\dss[<num>]{<letter>}` can be used to print `\mathrm{d}<letter>^<num>`. 

{% hint style="info" %}
`<num>` can be omitted in both cases.
{% endhint %}
{% endtab %}

{% tab title="Integrals, sums, products" %}
* `\zeroinfint{<letter>}` is used for integrals from 0 to `+\infty` in `\dd{<letter>}`,
* `\infzeroint{<letter>}` is used for integrals from `-\infty` to 0 in `\dd{<letter>}`,
* `\infinfint{<letter>}` is used for integrals from `-\infty` to `+\infty` in `\dd{<letter>}`,
* `\finiteint{<letter>}{<low>}{<upp>}` is used for integrals from `<low>` to `<upp>` if `\dd{<letter>}`.

{% hint style="info" %}
Substitute `int` with `sum` or `prod` to get the same behaviour for sums and products.
{% endhint %}
{% endtab %}
{% endtabs %}

