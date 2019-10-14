# Github Upload

## Static configuration

```yaml
- uses: klakegg/github-upload@v[VERSION]
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    file: dist/project.zip
```

```yaml
- uses: klakegg/github-upload@v[VERSION]
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    file: dist/project.zip
    name: project.zip
    label: Complete project package
    type: application/zip
```

## Scripted configuration

```yaml
- uses: klakegg/github-upload@v[VERSION]
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    script:
      upload \
        -f dist/project.zip \
        -n project-${TAG}.zip
```

```yaml
- uses: klakegg/github-upload@v[VERSION]
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  with:
    path: .github/uploads.sh
```

``` shell
#!/bin/sh

folder=dist

upload \
  -f ${folder}/project.zip \
  -n project-${TAG}.zip
```

## Command: upload

```shell
upload \
  -f "target/distribution.zip" \
  -n "distribution-${TAG}.zip" \
  -l "Distribution (zip)" \
  -t "application/zip"
```

* `-f` - File to upload. (Mandatory)
* `-n` - Filename when uploaded.
* `-l` - Label replacing filename on release page.
* `-t` - Content type of the file.


## Variables

* `TAG`
* `UPLOAD_URL`