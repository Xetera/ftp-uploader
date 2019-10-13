# Ftp-Uploader
Small script for automatically uploading screenshots in the clipboard to FTP servers **Now with 🤴🥶😙🤝👳💑 support**

**Example**: https://mamamoo.xetera.dev/😫👊👵🙀👄😃.png

Only available for Linux and maybe... Mac? not sure. If you're on Windows just use the almighty [ShareX](https://getsharex.com/), you don't have to mess with silly scripts like these (although ShareX still doesn't support emojis 😉).

### Supports [Bunny CDN](https://bunnycdn.com)

## Setup
1. `git clone https://github.com/Xetera/Ftp-Uploader.git`
2. `sudo apt install xclip`
3. `cd Ftp-Uploader`
3. Fill in config.sh
4. For ease of use with [flameshot](https://github.com/lupoDharkael/flameshot), bind `flameshot.sh` to a shortcut of your choice. ...or using whatever other option non-ubuntu people have. <img src="https://mamamoo.xetera.dev/%F0%9F%98%B8%F0%9F%91%99%F0%9F%91%85%F0%9F%99%8B%F0%9F%91%80%F0%9F%A7%B5.png" width=750> 
5. 🎉 (I hope)

## Setttings
Fill in your settings in config.sh

* USERNAME
  * FTP username **OR** for Bunny CDN, the name of your storage zone, you can find this in the Username part of the FTP & API Access page
  
* PASSWORD
  * FTP password **OR** your API key for Bunny CDN

* BASE_REDIRECT_URL
  * The base url you want to be redirected ot after you download (this link automatically gets pasted into your clipboard after the upload, much like how ShareX works)

* FILE_NAME_LENGTH
  * The amount of random characters for the  file name to have. By default generates random alphanumeric, lower + capital letters. 

* UPLOAD_PATH
	* The folder that you want the image to be uploaded to (root by default)


## Options
* `-q` Makes output **quiet**
* `-w` Opens the link in a new **window** or tab after uploading
* `-e` 👌 Gives your file a name with **emojis**, otherwise alphanumeric letters 💯 

The redirect will be in the form of:

##### BASE_REDIRECT_URL/filename.png

#### Note:
The total possibility of usable emojis have been reduced as some emojis are made up of other emojis like this one 💆‍♀️ which can look bad on certain devices.

![](https://mamamoo.xetera.dev/%F0%9F%A4%B1%E2%9B%91%F0%9F%95%B6%F0%9F%98%B1%F0%9F%98%AB%F0%9F%98%AD.png)

### Important:
Copying urls with emojis in Google Chrome (and possibly others) will give you weirdly encoded urls, I don't know how you can get around this as of now.

## Other screenshot tools

To integrate with other screenshot tools, combine the command with:
```sh
screenshot-tool-here && bash $(dirname "$0")/bunny.sh
```
Make sure the screenshot command exits before executing the uploader. The `--raw` option for flameshot is used for this purpose as flameshot does not wait for the screenshot to be taken before exiting the command without it.
