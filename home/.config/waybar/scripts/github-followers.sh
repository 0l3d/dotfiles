#!/bin/bash
curl -sS -H "Authorization: bearer YOURKEY" https://api.github.com/users/username | jq ".followers"
