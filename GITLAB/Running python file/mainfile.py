# web_scraper.py
import requests
from bs4 import BeautifulSoup

def fetch_page_title(url):
    try:
        response = requests.get(url)
        response.raise_for_status()  # Check if the request was successful
        soup = BeautifulSoup(response.text, 'html.parser')
        return soup.title.string
    except Exception as e:
        return f"An error occurred: {e}"

if __name__ == "__main__":
    url = "https://www.youtube.com"
    title = fetch_page_title(url)
    print(f"Title of the page: {title}")
