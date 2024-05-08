import os
import subprocess

config.load_autoconfig()

c.colors.webpage.darkmode.enabled = (
    subprocess.run(
        "defaults read -g AppleInterfaceStyle 2>&1", capture_output=True, shell=True
    ).stdout
    == b"Dark\n"
)

c.url.searchengines[
    "rs"
] = f"file://{os.path.expanduser('~')}/.rustup/toolchains/stable-aarch64-apple-darwin/share/doc/rust/html/std/index.html?search={{}}"
