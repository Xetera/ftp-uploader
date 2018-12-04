# Bunny-Uploader
Small script for automatically uploading screenshots in the clipboard to bunny CDN

#### Now with 🤴🥶😙🤝👳💑 support 

Only available for linux and maybe mac? not sure. If you're on Windows just use [ShareX](https://getsharex.com/) you don't have to mess with silly scripts like these.

For ease of use with [flameshot](https://github.com/lupoDharkael/flameshot), bind `flameshot.sh` to a shortcut of your choice.

## Setting up
Fill in your settings in config.sh

* BUNNY_STORAGE_NAME
  * name of your storage zone on bunnycdn, you can find this in the Username part of the FTP & API Access page

* BUNNY_UPLOAD_PATH
  * The folder you want your image to be saved under

* BUNNY_AUTH_TOKEN
  * Same thing as your FTP password on the FTP & API Acces page

* BUNNY_REDIRECT
  * The base url you want to be redirected after

* BUNNY_FILE_NAME_LENGTH
  * The amount of random characters for the  file name to have. By default generates random alphanumeric, lower + capital letters. 


## Options
* `-v` Prints **verbose** output from curl
* `-q` Makes output **quiet**
* `-w` Opens the link in a new **window** or tab after uploading
* `-e` 👌 Gives your file a name with **emojis**, otherwise alphanumeric letter 💯 

The redirect will be in the form of:

##### BUNNY_REDIRECT/BUNNY_UPLOAD_PATH/filename.png

#### Note:
The total possibility of usable emojis have been reduced as certain emojis are made up of other emojis like this one 💆‍♀️ which can look bad on certain devices

![](https://i.love.hifumi.io/%F0%9F%A4%B1%E2%9B%91%F0%9F%95%B6%F0%9F%98%B1%F0%9F%98%AB%F0%9F%98%AD.png)

#### Another note:
You might have issues copying certain URLs with _certain_ emojis in the format that they appear in and get a weirdly encoded text instead. This only seems to affect certain emojis but I'm not sure which.

## Other screenshot tools

To integrate with other screenshot tools, combine the command with:
```sh
screenshot-tool-here && bash $(dirname "$0")/bunny.sh
```
Make sure the screenshot command exits before executing the uploader. The `--raw` option for flameshot is used for this purpose as flameshot does not wait for the screenshot to be taken before exiting the command without it.
