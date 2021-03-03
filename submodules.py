from typing import Iterator, Union, Dict
from pathlib import Path
import subprocess


def get_submoodules(file: Union[Path, str]) -> Iterator[Dict[str, str]]:
    with open(file) as f:
        lines = f.readlines()

    n = 0
    while n <= len(lines) - 1:
        if "[submodule " in lines[n]:
            path = lines[n+1].split("=")[-1].strip()
            url = lines[n+2].split("=")[-1].strip()
            name = path.split("/")[-1].strip()
            
            branch_line = lines[n+3] if len(lines) > n + 3 else ""
            if "branch" in branch_line:
                branch = branch_line.split("=")[-1].strip()
            else:
                branch = ""

            submodule = {
                "name": name,
                "path": path,
                "url": url,
                "branch": branch
            }
            n += 4 if branch else 3
            yield submodule
        else:
            n += 1

PATH = Path(".gitmodules")

def empty_folder(folder_path: Union[Path, str]) -> bool:
    Path(folder_path).mkdir(parents=True, exist_ok=True)
    return True if not any(Path(folder_path).iterdir()) else False

for submodule in get_submoodules(PATH):
    if empty_folder(submodule["path"]):
        print("Getting {name}\n  Clonning {url}\n  Into {path}\n".format(**submodule))
        subprocess.run(["git", "clone", submodule["url"], submodule["path"]])
