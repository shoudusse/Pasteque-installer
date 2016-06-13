# Random uuid generator for db ID
$ < /dev/urandom tr -dc a-f0-9 | head -c${1:-32};echo;