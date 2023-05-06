"""This module contains the image generation API."""

import os
import sys
import urllib.request

from error_handling import exception_response

sys.path.append(os.path.join(os.path.dirname(__file__), "libs"))

import openai

openai.api_key = os.getenv("api_key")
__size = int(os.getenv("image_size") or 512)


def get_query() -> str:
    """Join the arguments into a query string."""
    return " ".join(sys.argv[1:])


def prepare_file_name(prompt: str) -> str:
    """Prepares the file name."""
    return (
        prompt.replace(" ", "_")
        .replace(",", "")
        .replace(".", "")
        .replace('"', "")
        .replace(":", "")
        .replace("'", "")
        .replace("/", "")
        .replace("\\", "")
    )


def make_request(prompt: str, size: int) -> str:
    """Makes the request to the OpenAI API."""
    file_path = f"{os.path.expanduser('~')}/ChatFred_{prepare_file_name(prompt)}.png"

    try:
        response = openai.Image.create(prompt=prompt, n=1, size=f"{size}x{size}")
        urllib.request.urlretrieve(response["data"][0]["url"], file_path)  # nosec
        return file_path

    except Exception as exception:  # pylint: disable=broad-except
        return exception_response(exception)


__response = make_request(get_query(), __size)
sys.stdout.write(__response)
