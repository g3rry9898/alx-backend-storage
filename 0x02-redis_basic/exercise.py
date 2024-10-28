#!/usr/bin/env python3
"""
Cache class using Redis
"""

import redis
import uuid
from typing import Union

class Cache:
    """Cache class to interact with Redis."""
    
    def __init__(self):
        """Initialize the Cache class."""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        Store the input data in Redis using a random key and return the key.

        Args:
            data (Union[str, bytes, int, float]): The data to store in Redis.

        Returns:
            str: The key under which the data is stored.
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

if __name__ == "__main__":
    cache = Cache()
    key = cache.store("example data")
    print(f"Data stored with key: {key}")

