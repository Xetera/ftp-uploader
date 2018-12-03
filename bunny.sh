#!bin/bash
source config.sh

name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $BUNNY_FILE_NAME_LENGTH | head -n 1)

clipboard=$(xclip -o -selection clipboard -t image/png 2> /dev/null)

if [[ "target image/png not available" == *"$clipboard"* ]]; then
  echo "No image found on clipboard!"
  echo "$clipboard"
  exit 1
fi

# out=$(xclip -o -selection clipboard -t image/png | curl -X PUT --header "Content-Type: image/png" --header "AccessKey: $BUNNY_AUTH_TOKEN"  "https://storage.bunnycdn.com/$BUNNY_STORAGE_NAME/$BUNNY_UPLOAD_PATH/$name.png" -v --data-binary @-)

url="$BUNNY_REDIRECT/$BUNNY_UPLOAD_PATH/$name.png"

echo $url | xclip -i -selection clipboard

if [[ "$@" == *"-v"* ]]; then
  echo "$out"
fi

if [[ "$@" != *"-q"* ]]; then
  echo "$url"
fi

if [[ "$@" == *"-w"* ]]; then
  xdg-open "$url"
fi