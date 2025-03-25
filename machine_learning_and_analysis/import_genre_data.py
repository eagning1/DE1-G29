import requests

# URL of the file to download
url = "https://www.ifs.tuwien.ac.at/mir/msd/partitions/msd-MAGD-genreAssignment.cls"

# Download the file
response = requests.get(url)

# Check if the download was successful
if response.status_code == 200:
    # Write the content to a text file
    with open("genre_assignment.txt", "w", encoding="utf-8") as file:
        file.write(response.text)
    print("File successfully downloaded and saved as genre_assignment.txt")
else:
    print(f"Failed to download the file. Status code: {response.status_code}")