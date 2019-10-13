#!/usr/bin/env bash

source $(dirname "$0")/config.sh

clipboard=$(xclip -o -selection clipboard -t image/png 2> /dev/null)

if [[ "target image/png not available" == *"$clipboard"* ]]; then
  echo "No image found on clipboard!"
  exit 1
fi

emojis=(😀 😁 😂 🤣 😃 😄 😅 😆 😉 😊 😋 😎 😍 😘 🥰 😗 😙 😚 ☺ 🙂 🤗 🤩 🤔 🤨 😐 😑 😶 🙄 😏 😣 😥 😮 🤐 😯 😪 😫 😴 😌 😛 😜 😝 🤤 😒 😓 😔 😕 🙃 🤑 😲 ☹ 🙁 😖 😞 😟 😤 😢 😭 😦 😧 😨 😩 🤯 😬 😰 😱 🥵 🥶 😳 🤪 😵 😡 😠 🤬 😷 🤒 🤕 🤢 🤮 🤧 😇 🤠 🤡 🥳 🥴 🥺 🤥 🤫 🤭 🧐 🤓 😈 👿 👹 👺 💀 ☠ 👻 👽 👾 🤖 💩 😺 😸 😹 😻 😼 😽 🙀 😿 😾 👶 👦 👧 👨 👩 👴 👵 👮 🕵 💂 👷 🤴 👸 👳 👲 🧕 🧔 👱 🤵 👰 🤰 🤱 👼 🎅 🤶 🦸 🦹 🧙 🧛 🧜 🧝 🧞 🧟 🙍 🙎 🙅 🙆 💁 🙋 🙇 🤦 🤷 💆 💇 🚶 🏃 💃 🕺 👯 🧖 🧘 🕴 🗣 👤 👥 👫 👬 👭 💏 💑 👪 🤳 💪 🦵 🦶 👈 👉 ☝ 👆 🖕 👇 ✌ 🤞 🖖 🤘 🤙 🖐 ✋ 👌 👍 👎 ✊ 👊 🤛 🤜 🤚 👋 🤟 ✍ 👏 👐 🙌 🤲 🙏 🤝 💅 👂 👃 👣 👀 👁 🧠 🦴 🦷 👅 👄 💋 👓 🕶 🥽 🥼 👔 👕 👖 🧣 🧤 🧥 🧦 👗 👘 👙 👚 👛 👜 👝 🎒 👞 👟 🥾 🥿 👠 👡 👢 👑 👒 🎩 🎓 🧢 ⛑ 💄 💍 🧳 🌂 ☂ 💼 🧵 🧶)

declare name
declare -i opt_quiet
declare -i opt_new_window

while (($#)); do
  case "$1" in
    -e)
      for ((i=0; i<5; i++)); do
        name="${name}${emojis[RANDOM % 256]}"
      done
      ;;
    -q)
      opt_quiet=1
      ;;
    -w)
      opt_new_window=1
      ;;
    *)
      printf "error: unrecognized argument '$1'\n" >&2
      exit 1
      ;;
  esac
  shift
done

if [[ -z "${name}" ]]; then
  name="$(cat /dev/urandom \
    | tr -dc 'a-zA-Z0-9' \
    | fold -w "${FILE_NAME_LENGTH}" \
    | head -n 1)"
fi

xclip -o -selection clipboard -t image/png -o > "$name.png"
upload_dir=$(echo "$UPLOAD_PATH/$name.png" | tr -s /)
echo "$upload_dir"

ftp -n "$HOST" <<END_SCRIPT
  quote USER "$USERNAME"
  quote PASS "$PASSWORD"
  passive
  binary
  put "$name.png" "${upload_dir#/}"
END_SCRIPT

rm "$name.png"

url="$BASE_REDIRECT_URL/${upload_dir#/}"

echo -n $url | xclip -i -selection clipboard

if ((! opt_quiet)); then
  echo "$url"
fi

if ((opt_new_window)); then
  xdg-open "$url"
fi
