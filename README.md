# mitar

## ots

```
python -m venv venv
venv/bin/pip install opentimestamps-client
```

or

```
nix-shell -p opentimestamps-client
```

verify

```
ots --no-bitcoin verify commit_hash.txt.ots
```
