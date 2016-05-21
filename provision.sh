#!/bin/sh -ex

[ -n "$MATCHING_UID" ]

adduser 'alpine-developer' -s '/bin/bash' -D -u "$MATCHING_UID"
addgroup -- 'alpine-developer' 'wheel'

apk --update-cache --progress update --purge
apk \
  add -- \
  'alpine-sdk' \
  'binutils-gold' \
  'build-base' \
  'clang' \
  'less' \
  'libgcc' \
  'libstdc++' \
  'pax-utils'

addgroup -- 'alpine-developer' 'abuild'
# TODO: abuild group not needed?
printf '%s\n' '%wheel ALL=(ALL) NOPASSWD: ALL' >> '/etc/sudoers'