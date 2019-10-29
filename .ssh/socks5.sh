#!/bin/sh
ssh -o ProxyCommand="nc -x 127.0.0.1:1080 %h %p" "$@"
