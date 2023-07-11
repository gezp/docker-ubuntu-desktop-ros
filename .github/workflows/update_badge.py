import requests
import json
import os


def get_metadata(repo, tag):
    get_info_url = "https://hub.docker.com/v2/repositories/%s/tags/%s" % (repo, tag)
    info_response = requests.get(get_info_url)
    return info_response.json()


def save_badge_config(tag, label, value):
    badge_config = {
        "schemaVersion": 1,
        "label": label,
        "message": value,
        "color": "blue",
    }
    repo_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "../..")
    config_path = os.path.join(
        repo_dir, "doc", "badges", label.replace(" ", "-") + "-" + tag + ".json"
    )
    with open(config_path, "w") as f:
        b = json.dumps(badge_config)
        f.write(b)


def formatSize(size):
    if size > (1 << 30):
        size_str = "%.2f GB" % (size / (1 << 30))
    elif size > (1 << 20):
        size_str = "%.2f MB" % (size / (1 << 20))
    else:
        size_str = "%.2f KB" % (size / (1 << 10))
    return size_str


if __name__ == "__main__":
    tags = [
        "galactic",
        "humble",
        "rolling",
        "humble-gazebo-fortress",
        "humble-gazebo-garden",
        "galactic-ignition-edifice",
        "humble-ignition-fortress",
    ]
    for tag in tags:
        metadata = get_metadata("gezp/ubuntu-desktop-ros", tag)
        build_date = metadata["tag_last_pushed"].split("T")[0]
        image_size = formatSize(metadata["full_size"])
        save_badge_config(tag, "build date", build_date)
        save_badge_config(tag, "image size", image_size)
