# Markdown Rundown

**Markdown Rundown** is a comprehensive summary of Markdown formatting styles, a live demonstration and testbed for various Python Markdown extensions, and a showcase of the [MkDocs](http://www.mkdocs.org/) static site generator.

This project is curated by [Adam Twardoch](http://github.com/twardoch).

## What is "Markdown Rundown"?

This project serves multiple purposes:

*   **A Reference Guide:** It provides a detailed overview of common Markdown syntax and, more importantly, a deep dive into numerous [Python Markdown](https://pythonhosted.org/Markdown/) extensions.
*   **A Testbed:** It acts as a practical environment for experimenting with and understanding how different Markdown extensions behave and integrate.
*   **An MkDocs Showcase:** The project itself is an MkDocs site, demonstrating how to structure, configure, and build a documentation website using Markdown. The live site can be viewed at [https://twardoch.github.io/markdown-rundown/](https://twardoch.github.io/markdown-rundown/).

## Who is it for?

This project is valuable for:

*   **Developers:** Who need to write documentation in Markdown and want to leverage advanced formatting options through extensions.
*   **Technical Writers:** Looking for a robust platform for creating and maintaining documentation.
*   **Markdown Users:** Anyone who wants to explore the capabilities of Markdown beyond its basic syntax.
*   **MkDocs Users:** Those who want to see a real-world example of an MkDocs setup with numerous extensions.

## Why is it useful?

*   **Centralized Information:** Consolidates information about many Python Markdown extensions in one place.
*   **Practical Examples:** Shows input Markdown and output HTML for many extensions, making it easy to understand their effects.
*   **Working Configuration:** Provides a complete, working MkDocs setup (`mkdocs.yml`, `pymdown.yml`) that can be used as a template.
*   **Live Demo:** The [hosted MkDocs site](https://twardoch.github.io/markdown-rundown/) allows users to see the rendered output immediately.

## Getting Started

### Viewing the Documentation

The easiest way to use Markdown Rundown is to browse the live site:
[https://twardoch.github.io/markdown-rundown/](https://twardoch.github.io/markdown-rundown/)

### Local Setup

To explore the code, experiment with extensions, or build the site locally:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/twardoch/markdown-rundown.git
    cd markdown-rundown
    ```

2.  **Install dependencies:**
    The project uses Python and several packages listed in `py-requirements.txt`. It's recommended to use a virtual environment.
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows: venv\Scripts\activate
    pip install -r py-requirements.txt
    ```
    This will install MkDocs, Python Markdown, and all the extensions showcased.

3.  **Build the MkDocs site:**
    You can build the site using the provided script:
    ```bash
    ./tools/build-mkdocs.command
    ```
    Alternatively, if you have MkDocs installed and in your PATH, you can use standard MkDocs commands:
    ```bash
    mkdocs build
    ```
    The static site will be generated in the `docs/` directory. To serve the site locally for development:
    ```bash
    mkdocs serve
    ```
    This will start a local web server (usually at `http://127.0.0.1:8000/`).

### Using Extensions Programmatically

The `src/Extensions.md` file (and its rendered version on the site) provides examples of how to use many of the showcased Python Markdown extensions programmatically within your own Python projects. Typically, this involves:

```python
import markdown

markdown_string = "Your **Markdown** text here."
extensions_list = [
    'extension_name',
    # ... other extensions
]
extension_configs_dict = {
    'extension_name': {
        'param1': 'value1',
    }
}

html = markdown.markdown(
    markdown_string,
    extensions=extensions_list,
    extension_configs=extension_configs_dict
)

print(html)
```
Refer to `src/Extensions.md` for specific extension names and configuration options.

## Technical Details

### Project Structure

*   `.gitignore`: Specifies intentionally untracked files that Git should ignore.
*   `LICENSE`: The license for the project.
*   `README.md`: This file.
*   `docs/`: Contains the generated static HTML site built by MkDocs. **Do not edit files here directly.**
*   `extensions.md`: A top-level file, seems to be a placeholder or older content. The primary extension documentation is in `src/Extensions.md`.
*   `mkdocs.yml`: The main configuration file for MkDocs. It defines:
    *   Site metadata (name, author, URL).
    *   Navigation structure (`pages`).
    *   Theme (Material for MkDocs).
    *   A comprehensive list of Markdown extensions to be used and their specific configurations.
*   `py-requirements.txt`: Lists Python package dependencies.
*   `pymdown.yml`: Configuration file specifically for Pymdown Extensions. While `mkdocs.yml` also configures extensions, this file provides a way to manage Pymdown-specific settings. It's important to see how these two files interact; typically, `mkdocs.yml` settings might take precedence when MkDocs processes the files.
*   `src/`: Contains the raw Markdown source files for the documentation website.
    *   `src/index.md`: The homepage content.
    *   `src/Extensions.md`: The detailed documentation for various Python Markdown extensions. This is the core content of the "rundown." It includes installation instructions, usage examples (Python and CLI), options, and input/output samples for each extension.
    *   `src/Home.md`: Appears to be an older or auxiliary content page.
*   `tools/`: Contains helper scripts.
    *   `build-mkdocs.command`: A script to build the MkDocs site.
    *   `build-pymdown.command`: A script likely intended for testing or building with Pymdown-CLI directly (though MkDocs handles extension processing for the site).
    *   `install-macos.command`: Likely a script for macOS-specific setup or tool installation.
    *   `fix_subl.command`: Purpose unclear without further inspection, possibly a local utility for the author.

### Markdown Extensions Rundown (`src/Extensions.md`)

The heart of this project is the extensive documentation of Python Markdown extensions found in `src/Extensions.md`. This file (rendered as a page on the MkDocs site) covers a wide array of extensions, including:

*   Standard extensions (Tables, Footnotes, Admonition, etc.)
*   Pymdown Extensions (BetterEm, MagicLink, Mark, SuperFences, etc.)
*   Other third-party extensions (PyEmbed, Markdown Include, Sections, Outline, Cite, Collapse, Figcaption, FontAwesome, custom KBD/Wikilink steroids, and many more).

For each extension, it typically provides:
*   Installation instructions (`pip install ...`)
*   Links to official documentation
*   Configuration options (often in YAML format for `mkdocs.yml` or `pymdown.yml`)
*   Example Markdown input
*   Corresponding HTML output

This makes it an invaluable resource for understanding what extensions are available and how to use them.

### Coding and Contribution

This project is primarily a documentation and example site.

**Coding Style:**
*   **Markdown:** Follow standard Markdown best practices. Observe the formatting used in existing `src/` files for consistency.
*   **YAML:** `mkdocs.yml` and `pymdown.yml` should be well-formed YAML.
*   **Python (for extension examples):** Follow standard Python coding conventions (PEP 8).

**Contributing:**
While there isn't a formal `CONTRIBUTING.md`, general open-source contribution practices apply:
1.  **Fork the repository.**
2.  **Create a new branch** for your changes (e.g., `feature/add-new-extension` or `fix/typo-in-tables-doc`).
3.  **Make your changes.**
    *   If adding or updating information about a Markdown extension, edit `src/Extensions.md`. Ensure you provide clear examples, input, and output.
    *   If modifying site configuration, update `mkdocs.yml` or `pymdown.yml` as needed.
4.  **Test your changes locally** by building and serving the MkDocs site (`mkdocs serve`) to ensure everything renders correctly.
5.  **Commit your changes** with clear and descriptive messages.
6.  **Push your branch** to your fork.
7.  **Submit a pull request** to the main repository.

Please ensure that any additions or modifications are well-documented and align with the project's goal of providing a clear and useful rundown of Markdown capabilities.

## Author's Other Projects

Here are other projects related to Markdown and MkDocs by Adam Twardoch:

*   [https://twardoch.github.io/markdown-steroids/](https://twardoch.github.io/markdown-steroids/) — Some extensions for Python Markdown [git](https://github.com/twardoch/markdown-steroids)
*   [https://twardoch.github.io/markdown-utils/](https://twardoch.github.io/markdown-utils/) — various utilities for working with Markdown-based documents [git](https://github.com/twardoch/markdown-utils)
*   [https://twardoch.github.io/mkdocs-combine/](https://twardoch.github.io/mkdocs-combine/) — convert an MkDocs Markdown source site to a single Markdown document [git](https://github.com/twardoch/mkdocs-combine)
*   [https://github.com/twardoch/noto-mkdocs-theme/tree/rework](https://github.com/twardoch/noto-mkdocs-theme/tree/rework) — great Material Design-inspired theme for MkDocs [git](https://github.com/twardoch/noto-mkdocs-theme)
*   [https://twardoch.github.io/clinker-mktheme/](https://twardoch.github.io/clinker-mktheme/) — great theme for MkDocs [git](https://github.com/twardoch/clinker-mktheme)

---

This README aims to be a comprehensive guide. For the most detailed and interactive experience, please visit the [live MkDocs site](https://twardoch.github.io/markdown-rundown/).
