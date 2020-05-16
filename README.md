
```
cp sample-values. values.yml
```

```
kapp deploy -a concourse --diff-changes \
  -f <(ytt --ignore-unknown-comments \
    -f config \
    -f overlays/concourse-web-external-url.yml \
    -f overlays/concourse-local-user.yml \
    -f overlays/concourse-web-tls.yml \
    -f overlays/concourse-web-ingress.yml \
    -f values.yml \
    $@)
```