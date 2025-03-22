# Managing Dependencies with UV  

**UV** is a fast Python package manager designed for efficient dependency management. This guide covers how to set up and use **UV** in the *Py Launch Blueprint* project.  

## Installing UV  

To install UV, run:  

```bash
pip install uv
```  

## Adding Dependencies  

To install a package and add it to your project, use:  

```bash
uv pip install <package-name>
```  

For example, to install the `requests` library:  

```bash
uv pip install requests
```  

## Installing All Dependencies  

To install all dependencies listed in `pyproject.toml`, run:  

```bash
uv pip install
```  

## Updating Dependencies  

To update all installed dependencies to their latest versions:  

```bash
uv pip install --upgrade
```  

To update a specific package:  

```bash
uv pip install --upgrade <package-name>
```  

## Removing Dependencies  

To uninstall a package:  

```bash
uv pip uninstall <package-name>
```  

## Freezing Dependencies  

To generate a `requirements.lock` file with the exact versions of installed dependencies, run:  

```bash
uv pip freeze > requirements.lock
```  

## Additional Resources  

For more details, check the [official UV documentation](https://github.com/astral-sh/uv).  

