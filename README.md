# 📝 LaTeX Template for Notes, Theses, and Documents 📄

[![Latest Release](https://img.shields.io/github/v/release/francescoabrami/TexPlate)](https://github.com/francescoabrami/TexPlate/releases/latest)

Welcome! This repository provides a powerful, automated template for creating professional-looking documents with LaTeX. It's designed for students, academics, and anyone wanting to write beautifully typeset notes, articles, or even a full thesis, without getting bogged down by the setup.

The system automatically compiles your LaTeX code into a PDF every time you push changes and creates a new release with your document.

---

### 📂 Repository Structure

The repository is organized to be clean and intuitive:

```
.
├── .github/workflows/   # Automation magic lives here (GitHub Actions)
│   └── compile.yml
├── code/                # Store code snippets to include in your document (e.g., MATLAB, Python)
│   └── ex.m
├── images/              # Put all your images here (JPG, PNG)
│   ├── PoliTO.jpg
│   └── test.jpeg
├── sections/            # The core of your document. Each .tex file is a part of it.
│   ├── 01-Section.tex
│   ├── 02-Section.tex
│   └── preamble.tex     # Global settings, packages, and custom commands
└── main.tex             # The main file that pieces everything together
```

---

### 🚀 How to Use This Repository

#### Step 1: Get the Code

**Fork this repository** to your own GitHub account. This creates a personal copy you can freely modify.

#### Step 2: Add Your Content

1.  **Write in `/sections`:** Create new `.tex` files inside the `sections` directory. Use a naming convention like `03-MyNewChapter.tex` to keep things organized.
2.  **Add Images:** Place your `.jpg` or `.png` images in the `/images` directory.
3.  **Include Code:** Add any source code files to the `/code` directory.

#### Step 3: Assemble Your Document

Open `main.tex`. This file controls the final document. To add the new sections you created, use the `\input{}` command.

```latex
% In main.tex

\begin{document}

\input{sections/01-Section}
\input{sections/02-Section}
\input{sections/03-MyNewChapter} % <-- Add your new section here

\end{document}
```

---

### ⚙️ The Automation: How It Works

This repository uses **GitHub Actions** to create a fully automated CI/CD pipeline for your document.

1.  **Trigger:** Every time you `git push` your changes to the `main` branch, the workflow starts automatically.
2.  **Compilation:** A Docker container (`xu-cheng/texlive-historic-alpine`) is launched. This container has a specific version of TeX Live, ensuring your document compiles the same way, every time.
3.  **Build:** The `latexmk` command compiles `main.tex` into a PDF. It's smart enough to run multiple times if needed to get all references and table of contents right.
4.  **Release:**
    *   The workflow automatically creates a **new GitHub Release**.
    *   The compiled PDF is attached to this release.
    *   The **release notes are automatically populated from your commit message**, providing context for the changes.

You can find all your compiled PDFs under the **Releases** tab on your repository's main page.

---

### 🔧 Advanced Configuration

You can customize the release behavior by editing the `.github/workflows/latex.yml` file.

#### Customizing the PDF Filename

By default, the released PDF is named `DOCUMENT.pdf`. You can change this by modifying the `env` section in the workflow file:

```yaml
# In .github/workflows/compile.yml

env:
  PDF_NAME: "My-Thesis-Title.pdf" # Change this to your desired filename
```

#### Customizing the Release Message

The release message is generated from the **title and body of your latest commit**. To create a detailed release note, write a descriptive commit message:

```bash
git commit -m "feat: Add chapter on Quantum Mechanics" -m "This chapter covers the foundational principles and includes new diagrams for wave functions."
```
*   The first line (`feat: ...`) becomes the release title.
*   The second line (`This chapter ...`) becomes the body text.

---

### 🔗 Get a Link to Your Latest Document

You can easily share a link that always points to the PDF from your **latest release**. This is perfect for sharing your work without having to update the link every time you make a change.

Use the following URL format:

`https://github.com/<YOUR_USERNAME>/<YOUR_REPO_NAME>/releases/latest/download/<PDF_FILENAME>`

**Example:**
If your username is `robert`, your repo is `LaTeX-Templates`, and your PDF is named `DOCUMENT.pdf`, the link would be:

`https://github.com/robert/LaTeX-Templates/releases/latest/download/DOCUMENT.pdf`

---

### ⚠️ Common Compilation Errors & Versioning

The workflow is designed to be robust, but LaTeX can be picky. Here are common issues and how to solve them.

#### 1. `LaTeX Error: File 'images/test.heic' not found.`
*   **Cause:** You are trying to include an image format that LaTeX doesn't support natively, like `.heic` or `.webp`.
*   **Solution:** **Convert your images to `.jpg` or `.png`** before adding them to the `/images` directory. Tools like ImageMagick are great for this.

#### 2. `pdfTeX error: reading JPEG image failed (no JPEG header found)`
*   **Cause:** The image file is corrupted, not a real JPEG, or was simply renamed to `.jpg` without being properly converted.
*   **Solution:** Open the image on your computer to check if it's valid. If not, re-export or re-convert it from the original source.

#### 3. `Package pgfplots Warning: ... Consider writing \pgfplotsset{compat=1.18}`
*   **Cause:** This is a warning, not an error. The `pgfplots` package wants you to specify which version's behavior you are targeting to ensure future updates don't break your plots.
*   **Solution:** Add `\pgfplotsset{compat=1.18}` (or the version suggested) to your `sections/preamble.tex` file.

#### Version Pinning with `xu-cheng/texlive-historic-alpine`

This workflow uses a specific **yearly version** of TeX Live (e.g., `2023`). This is a critical feature! It prevents your document from breaking when new, potentially incompatible versions of LaTeX packages are released.

If you need a feature from a newer or older TeX Live, you can change the version in `.github/workflows/latex.yml`:
```yaml
# In .github/workflows/latex.yml

env:
  TEXLIVE_VERSION: 2023 # Change this to your desired year
```
Just be aware that changing this may introduce compilation differences.

### 🤝 Contributing

Found a way to improve this template? Feel free to open an issue or submit a pull request!
