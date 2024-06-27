#!/usr/bin/env python3

import requests 

url = requests.get("https://www.google.com")

if x.status_code == 200:
    print("Ok")
else:
    print("Error!")