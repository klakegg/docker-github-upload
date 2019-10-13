# Github Upload

```yaml
- name: Upload assets
  uses: docker://klakegg/github-upload:0.8.0
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

`.github/publish.sh`

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