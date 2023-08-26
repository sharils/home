import subprocess

config.load_autoconfig()

c.colors.webpage.darkmode.enabled = (
    subprocess.run(
        'defaults read -g AppleInterfaceStyle 2>&1', capture_output=True, shell=True
    ).stdout
    == b'Dark\n'
)
