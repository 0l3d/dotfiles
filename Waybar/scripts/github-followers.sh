#!/bin/bash
curl -sS -H "token" https://api.github.com/users/0l3d | jq ".followers"
