#!/usr/bin/env python3
import requests
import time
from cachetools import TTLCache, cached

# Create a cache with a TTL (time-to-live) of 10 seconds
cache = TTLCache(maxsize=100, ttl=10)

# Create a dictionary to keep track of URL access counts
url_access_count = {}

@cached(cache)
def fetch_page(url):
    response = requests.get(url)
    return response.text

def get_page(url: str) -> str:
    # Track the URL access count
    if url not in url_access_count:
        url_access_count[url] = 0
    url_access_count[url] += 1
    
    # Fetch and return the page content
    return fetch_page(url)

# To simulate a slow response, you can use:
# http://slowwly.robertomurray.co.uk

# Example usage:
if __name__ == "__main__":
    url = "http://slowwly.robertomurray.co.uk"
    print(get_page(url))
    print("URL accessed", url_access_count[url], "times")
    time.sleep(5)  # wait for 5 seconds
    print(get_page(url))
    print("URL accessed", url_access_count[url], "times")
    time.sleep(6)  # wait for another 6 seconds
    print(get_page(url))
    print("URL accessed", url_access_count[url], "times")

