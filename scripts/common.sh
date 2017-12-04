configure_ssl_verification() {
    skip_ssl_verification=$(jq -r '.source.skip_ssl_verification // "false"' < $1)
    if [ "$skip_ssl_verification" = "true" ]; then
      export GIT_SSL_NO_VERIFY=true
      echo insecure > $HOME/.curlrc
    fi
}

urlencode() {
  echo -n "$1" | jq -s -R -r @uri
}
