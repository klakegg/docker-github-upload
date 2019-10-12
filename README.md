# Github Upload

```yaml
- name: Upload assets
  uses: docker://klakegg/github-upload:0.8.0
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

* `-f` - File to upload.
* `-n` - Filename when uploaded.
* `-l` - Label replacing filename on release page. (Optional)
* `-t` - Content type of the file. (Optional)
