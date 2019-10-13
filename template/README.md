# Github Upload

```yaml
- uses: klakegg/github-upload@v[VERSION]
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

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
