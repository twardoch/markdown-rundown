
# Python Markdown Extensions Rundown

[TOC]

## Installation {: #extensions-install }

This is a collected list of packages to install:

```bash
pip install --user --upgrade PyYAML
pip install --user --upgrade Markdown
pip install --user --upgrade pymdown-extensions
pip install --user --upgrade python-markdown-pretty
pip install --user --upgrade pyembed-markdown
pip install --user --upgrade markdown-include
pip install --user --upgrade mdx_sections
pip install --user --upgrade git+https://github.com/twardoch/markdown-steroids.git/@master#egg=mdx_steroids-0.4.0
```


## Usage {: #extensions-usage }

### Python {: #extensions-usage-python }

```python
md = markdown.Markdown(
  extensions=[
  'markdown_include.include',  'markdown_include.include',

  'path/to/my_ext.py',
  ],
  extension_configs={
  'markdown_include.include': {
  base_path: './srcdocs'
  }
  }
)
html = md.convert(markdown_string)
```

### Command-line {: #extensions-usage-commandline }

1. Create a `config.yml` file that describes the `extension_configs` dictionary using YAML:

  ```yaml
  markdown_include.include:
      base_path: './srcdocs'
  ```

2. Run:

  ```bash
  $ python -m markdown \
      -x path/to/my_ext.py \
      -x markdown_include.include \
      -c config.yml \
      -o 'html5' -f output.html input.md
  ```


## tables {: #tables }

The `tables` extension adds the ability to create tables in Markdown documents.

### Installation {: #tables-installation }

*preinstalled*

### Docs {: #tables-docs }

* https://pythonhosted.org/Markdown/extensions/tables.html

### Example {: #tables-example }

---

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell

---

#### Input Markdown {: #tables-example-md }

````markdown
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
````

#### Output HTML {: #tables-example-html }

````html
<table>
  <thead>
    <tr>
      <th>First Header</th>
      <th>Second Header</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Content Cell</td>
      <td>Content Cell</td>
    </tr>
    <tr>
      <td>Content Cell</td>
      <td>Content Cell</td>
    </tr>
  </tbody>
</table>
````


## abbr {: #abbr }

The `abbr` extension adds the ability to define abbreviations, which are then wrapped in an `<abbr>` tag.

### Installation {: #abbr-installation }

*preinstalled*

### Docs {: #abbr-docs }

* https://pythonhosted.org/Markdown/extensions/abbreviations.html

### Example {: #abbr-example }

---

The WOFF specification is maintained by the W3C.

*[WOFF]: Web Open Font Format
*[W3C]:  World Wide Web Consortium

---

#### Input Markdown {: #abbr-example-md }

````markdown
The WOFF specification is maintained by the W3C.

*[WOFF]: Web Open Font Format
*[W3C]:  World Wide Web Consortium
````

#### Output HTML {: #abbr-example-html }

````html
<p>The <abbr title="Hyper Text Markup Language">HTML</abbr> specification
is maintained by the <abbr title="World Wide Web Consortium">W3C</abbr>.</p>
````


## attr_list {: #attr_list }

The `attr_list` extension adds a syntax to define attributes on the various HTML elements in markdown’s output.

### Installation {: #attr_list-installation }

*preinstalled*

### Docs {: #attr_list-docs }

* https://pythonhosted.org/Markdown/extensions/attr_list.html

### Example {: #attr_list-example }

---

### Header 3 {: #header_3 }

[link](http://example.com){: class="foo bar" title="Some title!" }

This is a paragraph.
{: #an_id .class_1 .class_2 title="explain" }

---

#### Input Markdown {: #attr_list-example-md }

````markdown
### Header 3 {: #header_3 }

[link](http://example.com){: class="foo bar" title="Some title!" }

This is a paragraph.
{: #an_id .class_1 .class_2 title="explain" }
````

#### Output HTML {: #attr_list-example-html }

````html
<h3 id="header_3">Header 3</h3>
<p><a href="http://example.com" class="foo bar" title="Some title!">link</a></p>
<p id="an_id" class="class_1 class_2" title="explain">This is a paragraph.</p>
````


## markdown_attr_plus {: #markdown_attr_plus }

The `markdown_attr_plus` extension modifies the default Attribute List extension to include `{^ ... }`, `{o ... }`, and `{> ... }` syntax, which specifically only modify lists, list items, and blockquotes respectively.

### Installation {: #markdown_attr_plus-installation }

```bash
pip install --user --upgrade markdown-attr-plus
```

### Docs {: #markdown_attr_plus-docs }

* **Code**: https://github.com/Undeterminant/markdown-attr-plus


## admonition {: #admonition }

The `admonition` extension adds rST-style admonitions to Markdown documents.

### Installation {: #admonition-installation }

*preinstalled*

### Docs {: #admonition-docs }

* https://pythonhosted.org/Markdown/extensions/admonition.html

Common admonition types are: `attention`, `caution`, `danger`, `error`, `hint`, `important`, `note`, `tip`, `warning`

### Example {: #admonition-example }

---

!!! important "Word of warning"
This is a admonition box.

---

#### Input Markdown {: #admonition-example-md }

````markdown
!!! important "Word of warning"
This is a admonition box.
````

#### Output HTML {: #admonition-example-html }

````html
<div class="admonition important">
    <p class="admonition-title">Word of warning</p>
    <p>This is a admonition box.</p>
</div>

````


## codehilite {: #codehilite }

The `codehilite` extension adds code/syntax highlighting to standard Python-Markdown code blocks using [Pygments](http://pygments.org/).

### Installation {: #codehilite-installation }

*preinstalled*

### Docs {: #codehilite-docs }

* https://pythonhosted.org/Markdown/extensions/code_hilite.html
* http://pygments.org/docs/

### Options {: #codehilite-options }

```yaml
  codehilite:
    css_class      : 'code'
    linenums       : null
    guess_lang     : true
    use_pygments   : true
    pygments_style : 'default'
```


## def_list {: #def_list }

The `def_list` extension adds the ability to create definition lists in Markdown documents.

### Installation {: #def_list-installation }

*preinstalled*

### Docs {: #def_list-docs }

* https://pythonhosted.org/Markdown/extensions/definition_lists.html

### Example {: #def_list-example }

---

Apple
:   Pomaceous fruit of plants of the genus Malus in
    the family Rosaceae.

Orange
:   The fruit of an evergreen tree of the genus Citrus.

---

#### Input Markdown {: #def_list-example-md }

````markdown
Apple
:   Pomaceous fruit of plants of the genus Malus in
    the family Rosaceae.

Orange
:   The fruit of an evergreen tree of the genus Citrus.
````

#### Output HTML {: #def_list-example-html }

````html
<dl>
    <dt>Apple</dt>
    <dd>Pomaceous fruit of plants of the genus Malus in the family Rosaceae.</dd>
    <dt>Orange</dt>
    <dd>The fruit of an evergreen tree of the genus Citrus.</dd>
</dl>
````


## footnotes {: #footnotes }

The `footnotes` extension adds syntax for defining footnotes in Markdown documents.

### Installation {: #footnotes-installation }

*preinstalled*

### Docs {: #footnotes-docs }

* https://pythonhosted.org/Markdown/extensions/footnotes.html

### Options {: #footnotes-options }

```yaml
  footnotes:
    PLACE_MARKER   : '///Footnotes Go Here///'
    # // if the place marker text is not found in the document,
    # // the footnote definitions are placed at the end of the resulting HTML document
    UNIQUE_IDS     : false
    BACKLINK_TEXT  : '&#8617;'
```

### Example {: #footnotes-example }

---

Footnotes[^1] have a label[^@#$%] and the footnote's content.

[^1]: This is a footnote content.
[^@#$%]: A footnote on the label: "@#$%".

///Footnotes Go Here///

---

#### Input Markdown {: #footnotes-example-md }

````markdown
Footnotes[^1] have a label[^@#$%] and the footnote's content.

[^1]: This is a footnote content.
[^@#$%]: A footnote on the label: "@#$%".

///Footnotes Go Here///

````

#### Output HTML {: #footnotes-example-html }

````html
<p>Footnotes<a href="#fn:1" id="fnref:1" title="see footnote" class="footnote">[1]</a> have a label<a href="#fn:2" id="fnref:2" title="see footnote" class="footnote">[2]</a> and the footnote’s content.</p>

<div class="footnotes">
    <hr>
    <ol>
        <li id="fn:1">
            <p>This is a footnote content. <a href="#fnref:1" title="return to article" class="reversefootnote">&nbsp;↩</a></p>
        </li>
        <li id="fn:2">
            <p>A footnote on the label: “@#$%”. <a href="#fnref:2" title="return to article" class="reversefootnote">&nbsp;↩</a></p>
        </li>
    </ol>
</div>
````


## meta {: #meta }

The `meta` extension adds a syntax for defining meta-data about a document.

### Installation {: #meta-installation }

*preinstalled*

### Docs {: #meta-docs }

* https://pythonhosted.org/Markdown/extensions/meta_data.html

### Example {: #meta-example }

#### Input Markdown {: #meta-example-input }

````markdown
Title:   My Document
Summary: A brief description of my document.
Authors: Waylan Limberg
         John Doe
Date:    October 2, 2007
blank-value:
base_url: http://example.com

This is the first paragraph of the document.
````


## nl2br {: #nl2br }

The `nl2br` extension will cause newlines to be treated as hard breaks.

### Installation {: #nl2br-installation }

*preinstalled*

### Docs {: #nl2br-docs }

* https://pythonhosted.org/Markdown/extensions/nl2br.html

### Example {: #nl2br-example }

---

Line 1
Line 2

---

#### Input Markdown {: #nl2br-example-md }

````markdown
Line 1
Line 2
````

#### Output HTML {: #nl2br-example-html }

````html
<p>Line 1<br />
Line 2</p>
````


## smarty {: #smarty }

The `smarty` extension converts ASCII dashes, quotes and ellipses to their HTML entity equivalents.

### Installation {: #smarty-installation }

*preinstalled*

### Docs {: #smarty-docs }

* https://pythonhosted.org/Markdown/extensions/smarty.html

### Options {: #smarty-options }

```yaml
  smarty:
    smart_dashes           : true  # // convert dashes
    smart_quotes           : true  # // convert straight quotes
    smart_angled_quotes    : false # // whether to convert angled quotes
    smart_ellipses         : true  # // whether to convert ellipses
    substitutions:                 # // overwrite default substitutions
        left-single-quote  : '‘'   # // '
        right-single-quote : '’'   # // '
        left-double-quote  : '“'   # // "
        right-double-quote : '”'   # // "
        left-angle-quote   : '«'   # // <<
        right-angle-quote  : '»'   # // >>
        ellipsis           : '…'   # // ...
        ndash              : '–'   # // --
        mdash              : '—'   # // ---
```

### Example {: #smarty-example }

---

The "quick brown" fox's tail --- voila...

---

#### Input Markdown {: #smarty-example-md }

````markdown
The "quick brown" fox's tail --- voila...
````

#### Output HTML {: #smarty-example-html }

````html
<p>The “quick brown” fox’s tail — voila…</p>
````


## toc {: #toc }

The `toc` extension

### Installation {: #toc-installation }

*preinstalled*

### Docs {: #toc-docs }

* https://pythonhosted.org/Markdown/extensions/toc.html

### Options {: #toc-options }

```yaml
  toc:
    permalink      : '❡'
    marker         : '[TOC]'
    title          : 'Table of Contents'
    anchorlink     : true
    baselevel      : 1
    separator      : '-'
    slugify        : headerid.slugify
```

### Example {: #toc-example }

#### Input Markdown {: #toc-example-md }

````markdown
[TOC]

# Header 1

## Header 2 {: #Header 2 }
````

#### Output HTML {: #toc-example-html }

````html
<div class="toc">
  <ul>
    <li><a href="#header-1">Header 1</a></li>
      <ul>
        <li><a href="#header-2">Header 2</a></li>
      </ul>
  </ul>
</div>
<h1 id="header-1">Header 1</h1>
<h1 id="header-2">Header 2</h1>
````


## pymdownx.betterem {: #pymdownx.betterem }

The `pymdownx.betterem` extension improves emphasis (**bold** and _italic_) handling.

### Installation {: #pymdownx.betterem-installatio }

```bash
pip install --user --upgrade pymdown-extensions
```

### Docs {: #pymdownx.betterem-docs }

* http://facelessuser.github.io/pymdown-extensions/extensions/betterem/
* Replaces `smartstrong`
* **Code**: https://github.com/facelessuser/pymdown-extensions/blob/master/pymdownx/betterem.py

### Options {: #pymdownx.betterem-options }

```yaml
  pymdownx.betterem:
    smart_enable   : 'all'                # // 'all' | 'asterisk' | 'underscore' | 'none'
```

### Example {: #pymdownx.betterem-example }

---

Usage is the __same__ as usual. Just keep in mind the _differences_.

---

#### Input Markdown {: #pymdownx.betterem-example-md }

````markdown
Usage is the __same__ as usual. Just keep in mind the _differences_.
````

#### Output HTML {: #pymdownx.betterem-example-html }

````html
<p>Usage is the <strong>same</strong> as usual. Just keep in mind the <em>differences</em>. </p>
````


## pymdownx.magiclink {: #pymdownx.magiclink }

The `pymdownx.magiclink` extension

### Installation {: #pymdownx.magiclink-installation }

```bash
pip install --user --upgrade pymdown-extensions
```

### Docs {: #pymdownx.magiclink-docs }

* http://facelessuser.github.io/pymdown-extensions/extensions/magiclink/

### Options {: #pymdownx.magiclink-options }

```yaml
  pymdownx.magiclink:
    hide_protocol  : true
```

### Example {: #pymdownx.magiclink-example }

---

Visit https://github.com/twardoch for more info.

---

#### Input Markdown {: #pymdownx.magiclink-example-md }

````markdown
Visit https://github.com/twardoch for more info.
````

#### Output HTML {: #pymdownx.magiclink-example-html }

````html
<p>Visit <a href="https://github.com/twardoch">https://github.com/twardoch</a> for more info.</p>
````


## pymdownx.mark {: #pymdownx.mark }

The `pymdownx.mark` extension

### Installation {: #pymdownx.mark-installation }

```bash
pip install --user --upgrade pymdown-extensions
```

### Docs {: #pymdownx.mark-docs }

* https://facelessuser.github.io/pymdown-extensions/extensions/mark/

### Options {: #pymdownx.mark-options }

```yaml
  pymdownx.mark:
    smart_mark     : true                 # // Allows for ==mark==me==
```

### Example {: #pymdownx.mark-example }

---

Choose ==File > Open...== and pick the file.

---

#### Input Markdown {: #pymdownx.mark-example-md }

````markdown
Choose ==File > Open...== and pick the file.
````

#### Output HTML {: #pymdownx.mark-example-html }

````html
<p>Choose <mark>File &gt; Open…</mark> and pick the file. </p>
````


## pymdownx.superfences {: #pymdownx.superfences }

The `pymdownx.superfences` extension adds flexible ways to define code blocks, and replaces the  `fenced_code` extension.

### Installation {: #pymdownx.superfences-installation }

```bash
pip install --user --upgrade pymdown-extensions
```

### Docs {: #pymdownx.superfences-docs }

* https://facelessuser.github.io/pymdown-extensions/extensions/superfences/

### Options {: #pymdownx.superfences-options }

```yaml
  pymdownx.superfences:
    disable_indented_code_blocks : false
    nested         : true
    uml_flow       : false
    uml_sequence   : false
```

### Example {: #pymdownx.superfences-example }

---

> ```python
class MyClass(object):
  def __init__(self):
  	return pass

> print("Done")
> ```

---

#### Input Markdown {: #pymdownx.superfences-example-md }

````markdown
> ```python
class MyClass(object):
  def __init__(self):
  	return pass

> print("Done")
```
````

#### Output HTML {: #pymdownx.superfences-example-html }

````html
<blockquote>
<pre class=" language-python"><code class=" language-python"><span class="token keyword">class</span> <span class="token class-name">MyClass</span><span class="token punctuation">(</span>object<span class="token punctuation">)</span><span class="token punctuation">:</span>
  <span class="token keyword">def</span> <span class="token function">__init__</span><span class="token punctuation">(</span>self<span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token keyword">return</span> <span class="token keyword">pass</span>

<span class="token keyword">print</span><span class="token punctuation">(</span><span class="token string">"Done"</span><span class="token punctuation">)</span>
</code></pre>
</blockquote>
````


## pyembed.markdown {: #pyembed.markdown }

The `pyembed.markdown` extension allows you to embed content in your Markdown websites and documents from a wide range of producers using OEmbed.

### Installation {: #pyembed.markdown-installation }

```bash
pip install --user --upgrade pyembed-markdown
```

### Docs {: #pyembed.markdown-docs }

* https://pyembed.github.io/usage/markdown/
* https://pyembed.github.io/
* **Code**: https://github.com/pyembed/pyembed-markdown

### Example {: #pyembed.markdown-example }

#### Input Markdown {: #pyembed.markdown-example-md }

````markdown
[!embed](http://www.youtube.com/watch?v=9bZkp7q19f0)
````

#### Output HTML {: #pyembed.markdown-example.html }

````html
<iframe width="480" height="270" src="http://www.youtube.com/embed/9bZkp7q19f0?feature=oembed" frameborder="0" allowfullscreen></iframe>
````


## markdown_include.include {: #markdown_include.include }

The `markdown_include.include` extension replaces the `{!Home.md!}` statement with the contents of `Home.md`. It works recursively, prior to any other Markdown processing.

### Installation {: #markdown_include.include-installation }

```bash
pip install --user --upgrade markdown-include
```

### Docs {: #markdown_include.include-docs }

* https://github.com/cmacmackin/markdown-include

### Options {: #markdown_include.include-options }

```yaml
  markdown_include.include:
    base_path      : './srcdocs/'
    encoding       : 'utf-8'
```

### Example {: #markdown_include.include-example }

---

{!Home.md!}

---

#### Input Markdown {: #markdown_include.include-example-md }

<code>
{!Home.md!}
</code>


## sections {: #sections }

The `sections` extension adds a small amount of structure to Markdown documents.

### Installation {: #sections-installation }

```bash
pip install --user --upgrade mdx_sections
```

### Docs {: #sections-docs }

* https://github.com/jessedhillon/mdx_sections


## outline {: #outline }

The `outline` extension uses the `h1`-`h6` headings to create HTML `section` elements with the `sectionN` class, where `N` is the header level being wrapped. Also, the header attributes get moved to the wrapper.

### Installation {: #outline-installation }

```bash
pip install --user --upgrade mdx_outline
```

### Docs {: #outline-docs }

* https://github.com/aleray/mdx_outline

### Example {: #outline-example }

#### Input Markdown {: #outline-example-md }

````markdown
# Introduction {: foo=bar }

This is a paragraph.
````

#### Output HTML {: #outline-example-html }

````html
<section class="section1" foo="bar">
    <h1>Introduction</h1>
    <p>This is a paragraph.</p>
</section>
````


## cite {: #cite }

The `cite` extension wraps the inline content surrounded by three double quotes into `cite` tags.

### Installation {: #cite-installation }

```bash
pip install --user --upgrade mdx_cite
```

### Docs {: #cite-docs }

* https://github.com/aleray/mdx_cite

### Example {: #cite-example }

---

"""In the Loop""" is the last movie I watched.

---

#### Input Markdown {: #cite-example-md }

````markdown
"""In the Loop""" is the last movie I watched.
````

#### Output HTML {: #cite-example-html }

````html
<p><cite>In the Loop</cite> is the last movie I watched.</p>
````


## collapse {: #collapse }

The `collapse` extension defines collapsible areas.

!!! warning "The `collapse` extension makes problems"

### Installation {: #collapse-installation }

```bash
pip install --user --upgrade mdx_collapse
```

### Docs {: #collapse-docs }

* https://github.com/AlexJF/mdx_collapse

### Example {: #collapse-example }

---

<<< "Collapsible stuff"
    * Stuff 1
    * Stuff 2
    * Stuff 3
    * Stuff 4

---

#### Input Markdown {: #collapse-example-md }

````markdown
<<< "Collapsible stuff"
    * Stuff 1
    * Stuff 2
    * Stuff 3
    * Stuff 4
````

#### Output HTML {: #collapse-example-html }

````html
<div class="panel panel-default panel-collapsible">
    <div class="panel-heading">
        <a data-toggle="collapse" data-target="#collapse1" />
    </div>
    <div id="collapse1" class="panel-body collapse in">
        <ul>
            <li>Stuff 1</li>
            <li>Stuff 2</li>
            <li>Stuff 3</li>
            <li>Stuff 4</li>
        </ul>
    </div>
</div>
````




## custom_span_class {: #custom_span_class }

The `custom_span_class` allows adding span elements with custom class.

### Installation

```bash
pip install --user --upgrade mdx_customspanclass
```

### Docs

* https://github.com/grinich/mdx_custom_span_class

### Example

---

I love !!text-alert|spam!!

---

#### Input Markdown

````markdown
I love !!text-alert|spam!!
````

#### Output HTML

````html
<p>I love <span class="text-alert">spam</span></p>
````



## figcap {: #figcap }

The `figcap` extension converts a Markdown image into a HTML `<figure>` element.

### Installation

```bash
pip install --user --upgrade git+https://github.com/mkszk/mdx_figcap.git
```

### Docs

* https://github.com/mkszk/mdx_figcap

### Example

---

![This is an alt text](test.jpg "This is a **caption** with Markdown")

---

#### Input Markdown

````markdown
![This is an alt text](test.jpg "This is a **caption** with Markdown")
````

#### Output HTML

````html
<figure><img alt="This is an alt text" src="../test.jpg"
  title="This is a **caption** with Markdown">
    <figcaption>This is a <strong>caption</strong> with Markdown</figcaption>
</figure>
````




## fontawesome-markdown {: #fontawesome-markdown }

The `fontawesome-markdown` looks for things like `:fa-coffee:`` and replaces them with the Font Awesome icon markup.

### Installation

```bash
pip install --user --upgrade fontawesome-markdown
```

### Docs

* http://bmcorser.github.io/fontawesome-markdown/
* **Code**: https://github.com/bmcorser/fontawesome-markdown

### Example

---

We ♥ :fa-coffee:

---

#### Input Markdown

````markdown
We ♥ :fa-coffee:
````

#### Output HTML

````html
<p>We ♥ <i class="fa fa-coffee"></i></p>
````



## steroids.wikilink

The `steroids.wikilink` extension parses wikilinks in the style of the  [Gollum](https://github.com/gollum/gollum) wiki and the [Github Wiki system](https://help.github.com/articles/about-github-wikis/). It will convert links such as `[[Page name]]` to `[Page name](/Page-name/)`. You can specify the start, end and separator strings.

### Installation

```bash
pip install --user --upgrade git+https://github.com/twardoch/markdown-steroids.git
```

### Docs

* https://github.com/twardoch/markdown-steroids

### Options

```yaml
  steroids.wikilink:
    base_url       : '/'                  # // String to append to beginning or URL.
    end_url        : '/'                  # // String to append to end of URL.
    html_class     : 'wikilink'           # // CSS hook. Leave blank for none.
    space_sep      : '-'                  # // String that replaces the space, "-" by default.
    build_url      : build_url            # // Alternative callable formats URL from label.
```

### Example

---

This is a [[Wiki Link]] of some sorts.

---

#### Input Markdown

````markdown
This is a [[Wiki Link]] of some sorts.
````

#### Output HTML

````html
<p>This is a <a class="wikilink" href="/Wiki-Link/">Wiki Link</a> of some sorts.</p>
````



## steroids.kbd {: #steroids.kbd }

The `steroids.kbd` extension converts syntax for user keyboard entry: `||Cmd+K||` into `<kbd>Cmd+K</kbd>`.

### Installation

```bash
pip install --user --upgrade git+https://github.com/twardoch/markdown-steroids.git
```

### Docs

* https://github.com/twardoch/markdown-steroids

### Options

```yaml
  steroids.kbd:
    repl_mac       : false                # // Replace macOS symbols
    html_class     : 'kbd'                # // CSS hook. Leave blank for none
```

### Example

---

||Cmd+K||

---

#### Input Markdown

````markdown
||Cmd+K||
````

#### Output HTML

````html
<kbd class="kbd">Cmd+K</kbd>
````


## steroids.replimgsrc {: #steroids.replimgsrc }

The `steroids.replimgsrc` extension finds and replaces portions of an image URL.

### Installation

```bash
pip install --user --upgrade git+https://github.com/twardoch/markdown-steroids.git
```

### Docs

* https://github.com/twardoch/markdown-steroids/

### Options

```yaml
  steroids.replimgsrc:
    find           : 'https://github.com/repo/blob/master/images/'
    replace        : '../img/'
```

### Example

---



---

#### Input Markdown

````markdown
````

#### Output HTML

````html
````


## steroids.absimgsrc {: #steroids.absimgsrc }

The `steroids.absimgsrc` replaces relative image URLs with absolute ones.

### Installation

```bash
pip install --user --upgrade git+https://github.com/twardoch/markdown-steroids.git
```

### Docs

* https://github.com/twardoch/markdown-steroids/

### Options

```yaml
  steroids.absimgsrc:
    base_url       : 'https://github.com/repo/blob/master/images/'
    # // Base URL to which the relative paths will be appended
```

### Example

---



---

#### Input Markdown

````markdown
````

#### Output HTML

````html
````




# Other extensions of interest:

* https://github.com/Griffon26/mdx_spantables
* https://github.com/livio/DocDown-Python/
* https://github.com/Wenzil/mdx_bleach
* https://github.com/kernc/mdx_unimoji
* https://github.com/darwindarak/mdx_bib
* https://github.com/kdeldycke/mdx_titlecase
* https://github.com/cprieto/mdx_downheader
* https://github.com/zestedesavoir/Python-ZMarkdown/tree/master-zds/markdown/extensions
* https://github.com/zestedesavoir/Python-ZMarkdown/blob/master-zds/markdown/extensions/french_typography.py
* https://github.com/zestedesavoir/Python-ZMarkdown/blob/master-zds/markdown/extensions/grid_tables.py
* https://github.com/zestedesavoir/Python-ZMarkdown/blob/master-zds/markdown/extensions/header_dec.py
* https://github.com/zestedesavoir/Python-ZMarkdown/blob/master-zds/markdown/extensions/mathjax.py
* https://github.com/idaholab/moose/tree/master/python/MooseDocs
* https://github.com/sander76/svg_animation_plugin/
* https://github.com/andrewlin12/markdown2png/blob/master/src/md2png/__init__.py
* https://github.com/mkdocs/mkdocs/blob/master/mkdocs/relative_path_ext.py
* https://github.com/cpprefjp/markdown_to_html/blob/master/qualified_fenced_code.py
* https://github.com/freenode/cms7/blob/master/cms7/mdext.py
* https://github.com/ckald/pyccoon/blob/master/pyccoon/markdown_extensions.py


# Varia

* https://github.com/jupyter/nbconvert/
* https://github.com/abnowack/ButteredPost/
* https://github.com/rasbt/mlxtend/blob/master/docs/ipynb2markdown.py

# Deprecated

## pymdownx.headeranchor {: #pymdownx.headeranchor }

* Use `toc` with `permalinks` instead!

## fenced_code {: #fenced_code }

* Use `pymdownx.superfences` instead!
* Docs: https://pythonhosted.org/Markdown/extensions/fenced_code_blocks.html

## smart_strong {: #smart_strong }

* Use `pymdownx.betterem` instead!
* Docs: https://pythonhosted.org/Markdown/extensions/smart_strong.html

## smartypants {: #smartypants }

The `smartypants` extension converts ASCII dashes, quotes and ellipses to their HTML entity equivalents.

### Installation

```bash
pip install --user --upgrade hg+https://bitbucket.org/chriskrycho/mdx_smartypants
```

### Docs

* https://bitbucket.org/chriskrycho/mdx_smartypants

### Options

```yaml
  smartypants:
    smarten        : 'default'
```

### Example

---

The "quick brown" fox's tail --- voila...

---

#### Input Markdown

````markdown
The "quick brown" fox's tail --- voila...
````

#### Output HTML

````html
<p>The “quick brown” fox’s tail — voila…</p>
````
