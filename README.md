# Github Upload


## Static configuration


### Single file

```yaml
- uses: klakegg/github-upload@v0.8.2
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    file: dist/project.zip
```

```yaml
- uses: klakegg/github-upload@v0.8.2
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    file: dist/project.zip
    name: project-${TAG}.zip
    label: Complete project package
    type: application/zip
```


### Multiple files

```yaml
- uses: klakegg/github-upload@v0.8.2
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    files: dist/*.zip
```


## Scripted configuration

```yaml
- uses: klakegg/github-upload@v0.8.2
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    script:
      upload \
        -f dist/project.zip \
        -n project-${TAG}.zip
```

```yaml
- uses: klakegg/github-upload@v0.8.2
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    script_path: .github/uploads.sh
```

``` shell
#!/bin/sh

folder=dist

upload \
  -f ${folder}/project.zip \
  -n project-${TAG}.zip
```


## Command: upload

The `upload` command may be used in the script to perform the upload of an asset.

Example of use:

```shell
upload \
  -f "target/distribution.zip" \
  -n "distribution-${TAG}.zip" \
  -l "Distribution (zip)" \
  -t "application/zip"
```

Arguments:

* `-f` - File to upload. (Mandatory)
* `-n` - Filename when uploaded.
* `-l` - Label replacing filename on release page.
* `-t` - Content type of the file.


## Variables

The following extra variables are made available during execution:

* `TAG` - Git tag extracted from the provided `GITHUB_REF`, e.g. `v1.0`.
* `UPLOAD_URL` - URL used to upload assets.
