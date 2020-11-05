[![Travis CI Build Status](https://travis-ci.com/calekochenour/python-formatter-env.svg?branch=main)](https://travis-ci.com/calekochenour/python-formatter-env)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/32r7s2skrgm9ubva?svg=true)](https://ci.appveyor.com/project/calekochenour/python-formatter-env)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4245337.svg)](https://doi.org/10.5281/zenodo.4245337)
[![Launch Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/calekochenour/python-formatter-env/main)
[![BSD 3-Clause License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# Python Formatter Conda Environment

This repository contains a Conda environment to format Python scripts and Jupyter Notebooks.

## Examples

There are two example files (one Jupyter Notebook, one Python script) available to demonstrate the effects of the formatters used in this environment. The structure from the repository root is as follows:

```
└── 01-code-scripts
    ├── example.ipynb
    └── example.py
```

### Python Script

There are two ways to run the formatter on the `example.py` script. For both methods, first launch Binder:

[![Launch Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/calekochenour/python-formatter-env/main)

Open the `example.py` script and observe the contents. The `example_function()` was created with line lengths that exceeded the maximum of 79, as defined in the `pyproject.toml` file. Within Binder, click on `New` and select `Terminal`. This is where you have a choice to format the script. Within the terminal, run either of the following commands:

```bash
make initialize
```

or

```bash
make format
```

The first choice will set up `black` and `flake8` pre-commit hooks and then run the hooks on the script. This option takes longer. The second option runs `black` on the script without the addition of pre-commit hooks. Either choice runs the formatter. You can then refresh the page containing the `example.py` script to observe the changes.

Refer to the `Makefile` for information about the recipes, and refer to the `.pre-commit-config.yaml` and `pyproject.toml` files for formatter configurations.

### Jupyter Notebook

The `example.ipynb` Notebook demonstrates the functionality of the `nb_black` Jupyter extension. More information about the extension can be found on the extension's [Github page](https://github.com/dnanhkhoa/nb_black).

First launch Binder:

[![Launch Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/calekochenour/python-formatter-env/main)

Within Binder, open the `example.ipynb` file. Run the first code cell, which loads the `nb_black` extension. Observe the format of the `example_function()` code in the second cell, and then run the second cell to see how `nb_black` reformats the code.

**Note:** By default the `nb_black` extension uses a maximum line length of 88 characters. You can adjust the line length if you have the Conda environment installed on your local machine.

To adjust the maximum line length, first locate the `lab_black.py` file within the Conda environment build on your local computer:

* `~\miniconda3\envs\python-formatter\Lib\site-packages\lab_black.py`

The initial part of the path (`~\miniconda3`) may differ, depending on the local Conda installation. The name of the environment (`python-formatter`) may also differ if you changed the name within the `environment.yml` file.

Within the `lab_black.py` file (starting at or around line 25), replace

```python
if sys.version_info >= (3, 6, 0):
    from black import format_str, FileMode

    def _format_code(code):
        return format_str(src_contents=code, mode=FileMode())
```

with

```python
if sys.version_info >= (3, 6, 0):
    from black import format_str, FileMode, TargetVersion

    def _format_code(code):
        mode = FileMode(target_versions={TargetVersion.PY38}, line_length=79)
        return format_str(src_contents=code, mode=mode)
```

This changes the `line_length` parameter to 79. You can also change and/or add target versions (`PY36`, `PY37`, `PY38`) by changing the `target_versions` parameter (currently set to `{TargetVersion.PY38}`).

## Contents

### `01-code-scripts/`

Contains all example Python scripts and Jupyter Notebook files.

### `environment.yml`

Contains information to create the Conda environment required to format Python Scripts and Jupyter Notebooks.  
