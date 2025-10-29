"""
Python utilities file loaded by t_init script.
Provides commonly used libraries and helper functions for interactive Python sessions.
"""

# Standard library imports
import re
import os
import sys
import requests
import json
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

# Utility functions
def pretty_print(obj: Any) -> None:
    """Pretty print JSON-serializable objects."""
    print(json.dumps(obj, indent=2, default=str))

def read_file(file_path: str) -> str:
    """Read file contents."""
    return Path(file_path).read_text()

def write_file(file_path: str, content: str) -> None:
    """Write content to file."""
    Path(file_path).write_text(content)

# Print welcome message
print("=" * 50)
print("Python Utils Loaded")
print("=" * 50)
print("Available imports:")
print("  - re (regular expressions)")
print("  - os, sys, json")
print("  - Path (from pathlib)")
print("  - requests (HTTP library)" if requests else "  - requests (not installed)")
print("\nUtility functions:")
print("  - pretty_print(obj): Pretty print JSON objects")
print("  - read_file(path): Read file contents")
print("  - write_file(path, content): Write to file")
print("=" * 50)
