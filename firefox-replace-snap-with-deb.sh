# If you run into issues with Firefox complaining about a "missing"
# profile, and you're on Ubuntu Linux, you're most likely going to
# have to replace the Firefox snap package with the apt package.
# This is a short script compiled from
#
#    https://www.omgubuntu.co.uk/2022/04/how-to-install-firefox-deb-apt-ubuntu-22-04
#
# that will do that for you.

# MUST RUN AS SUDO.

# Add the official Mozilla PPA.
sudo add-apt-repository ppa:mozillateam/ppa

# Set up preferences for APT so it preferentially goes after this PPA.
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

killall firefox

sudo snap remove firefox

sudo apt update
sudo apt install firefox
