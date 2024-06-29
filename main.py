#!/usr/bin/env python3

import requests

try:
    response = requests.get("https://www.google.com")
    if response.status_code == 200:
        print("Ok")
    else:
        print("Error!")
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
