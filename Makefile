all: version.txt build push

version.txt:
	curl -s https://pypi.org/pypi/Red-DiscordBot/json | jq -r '.releases | keys | .[]' | sort -t "." -k1,1n -k2,2n -k3,3n | tail -n 1 > version.txt

build: version.txt
	podman build --build-arg RED_VERS=$(file < version.txt) -t quay.io/toshibhtr/red-discordbot:$(file < version.txt) .

push: build
	podman push quay.io/toshibhtr/red-discordbot:$(file < version.txt)
