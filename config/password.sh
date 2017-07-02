#! /bin/bash
PASSWORD=${PASSWORD:-"password"}
PASSWORD_FILE=${PASSWORD_FILE:"/tmp/password.txt"}

echo "${PASSWORD}" > "${PASSWORD_FILE}"
tr --delete '\n' <"${PASSWORD_FILE}" >.strippedpassword.txt && mv .strippedpassword.txt "${PASSWORD_FILE}"
kubectl create secret generic mysql-pass --from-file="${PASSWORD_FILE}"
