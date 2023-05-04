"""
Module for identify the Server by name.
"""
from os import uname
from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello_from_server():
    """
    This Function return a Servername as http response.
    :return: A String with the Server Name
    """
    return f'Hello from {uname()[1]}.'
