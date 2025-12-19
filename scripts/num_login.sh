#!/bin/bash
# num of logins of a specified user

echo -n "User name: "
read user

times=$(who | grep $user| wc -l)

echo "User $user has $times logins(s)"

exit 0
