# Bunny-Uploader
Small script for automatically uploading screenshots in the clipboard to [Bunny CDN](https://bunnycdn.com) **Now with 🤴🥶😙🤝👳💑 support**

**Example**: https://i.love.hifumi.io/😫👊👵🙀👄😃.png

Only available for Linux and maybe... Mac? not sure. If you're on Windows just use the almighty [ShareX](https://getsharex.com/), you don't have to mess with silly scripts like these (although ShareX still doesn't support emojis 😉).

## Setup
1. `git clone https://github.com/Xetera/Bunny-Uploader.git`
2. `sudo apt install xclip`
3. `cd Bunny-Uploader`
3. Fill in config.sh
4. For ease of use with [flameshot](https://github.com/lupoDharkael/flameshot), bind `flameshot.sh` to a shortcut of your choice. ...or using whatever other option non-ubuntu people have. <img src="https://i.love.hifumi.io/%F0%9F%98%B8%F0%9F%91%99%F0%9F%91%85%F0%9F%99%8B%F0%9F%91%80%F0%9F%A7%B5.png" width=750> 
5. 🎉 (I hope)

## Setttings
Fill in your settings in config.sh

* BUNNY_STORAGE_NAME
  * name of your storage zone on bunnycdn, you can find this in the Username part of the FTP & API Access page

* BUNNY_UPLOAD_PATH
  * The folder you want your image to be saved under

* BUNNY_AUTH_TOKEN
  * Same thing as your FTP password on the FTP & API Access page

* BUNNY_REDIRECT
  * The base url you want to be redirected ot after you download (this link automatically gets pasted into your clipboard after the upload, much like how ShareX works)

* BUNNY_FILE_NAME_LENGTH
  * The amount of random characters for the  file name to have. By default generates random alphanumeric, lower + capital letters. 


## Options
* `-v` Prints **verbose** output from curl
* `-q` Makes output **quiet**
* `-w` Opens the link in a new **window** or tab after uploading
* `-e` 👌 Gives your file a name with **emojis**, otherwise alphanumeric letters 💯 

The redirect will be in the form of:

##### BUNNY_REDIRECT/filename.png

#### Note:
The total possibility of usable emojis have been reduced as some emojis are made up of other emojis like this one 💆‍♀️ which can look bad on certain devices.

![](https://i.love.hifumi.io/%F0%9F%A4%B1%E2%9B%91%F0%9F%95%B6%F0%9F%98%B1%F0%9F%98%AB%F0%9F%98%AD.png)

#### Another note:
You might have issues copying specific URLs with _certain_ emojis in the format that they appear in and get a weirdly encoded text instead. This only seems to affect a select number of emojis but I'm not sure which.

## Other screenshot tools

To integrate with other screenshot tools, combine the command with:
```sh
screenshot-tool-here && bash $(dirname "$0")/bunny.sh
```
Make sure the screenshot command exits before executing the uploader. The `--raw` option for flameshot is used for this purpose as flameshot does not wait for the screenshot to be taken before exiting the command without it.
