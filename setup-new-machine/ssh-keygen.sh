#!/usr/bin/env bash

# https://docs.github.com/articles/generating-an-ssh-key/

function ssh-keygen-ed25519 {
    # -t sets key type (ed25519)
    # -a sets KDF rounds (default for ed25519 is 16)
    # -C sets public key comment
    # NOTE: use -f to override the default key filename
    #       e.g. -f ~/.ssh/work_key_ed25519
    # NOTE: -o is assumed when using ed25519
    ssh-keygen -t ed25519 -a 64 -C "$1"
}

function ssh-keygen-rsa {
    # -t sets key type (RSA)
    # -o use OpenSSH format
    # -b set key size
    # -a sets KDF rounds
    # -C sets public key comment
    # NOTE: use -f to override the default key filename
    #       e.g. -f ~/.ssh/work_key_RSA_
    ssh-keygen -t rsa -o -b 4096 -a 64 -C "$1"
}

