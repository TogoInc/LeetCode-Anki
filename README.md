# `LeetCode-Anki`: `pipenv`'ed and Firefox port

## Quickstart

_On any platform, using Python_

```sh
# Get a local copy of Leetcode-Anki. Ensure you have Firefox installed.
git clone https://github.com/hiAndrewQuinn/LeetCode-Anki.git 
cd LeetCode-Anki

# Install any pipenv dependencies from the Pipfile,
pipenv install
# then enter its virtual environment.
pipenv shell

# Run the program!
python main.py
```

![image](https://user-images.githubusercontent.com/53230903/179350779-b1a0b0ea-d488-406f-9540-8f8be43e160f.png)


The **original used Google Chrome** for its webdriver; this one **requires Firefox**.

More importantly, this version has been moved onto `pipenv`. The build determinism means this **should work equally well on any OS**, so long as you actually use the `pipenv` correctly. So let's go ahead and do this.


## Some caveats to note

- You need to log in **on the LeetCode page itself** when prompted. Using 3rd-party authenticators like GitHub, Google, etc. **will not work**.
- This will *only* get you cards for LeetCode problems *you have already completed* on the site. You can't use this to cram problems you haven't solved yet, in other words.

# `Leetcode-Anki`: Original README.md, in Chinese

## 介绍 _Introduction_

在刷LeetCode的过程中时常会遇到与之前类似的题目但是却忘记解题思路的情况。[Anki](https://apps.ankiweb.net/) 是一个基于遗忘曲线的全平台记忆工具，支持Mac，Linux， Windows， iOS和Android平台。Anki是一个优秀的记忆工具，但是在使用需要手动制卡，这个过程非常繁琐且耗时。

_When brushing up on LeetCode, you will often encounter a problem that is similar to a previous one, but you have forgetten the solution. [Anki](https://apps.ankiweb.net/) is a cross-platform memory aid based on [the forgetting curve](https://www.wikiwand.com/en/Forgetting_curve) and supports Mac, Linux, Windows, iOS and Android._

> Invest some time to automate or simplify a process to save more time in the future.

**本项目旨Chrome在抓取LeetCode已AC的题目，并自动生成Anki卡组帮助记忆。**

_**This project uses Chrome to capture LeetCode `ac`cepted questions and automatically generates an Anki deck to help memorize the solutions.**_

抓取的数据包括：

1. 题目标题，难度，描述。
2. 官方题解（Premium的题解需要订阅才能抓取）。
3. 用户AC的提交代码。

_The data captured includes:_

1. _Question title, difficulty, and description._
2. _Official question solutions (Premium solutions require subscription to capture)._
3. _The submitted code of user AC._

## DEMO

|            正面            |           背面           |
| :------------------------: | :----------------------: |
| ![front](./demo/front.JPG) | ![back](./demo/back.JPG) |

示例[卡组](https://github.com/Peng-YM/LeetCode-Anki/blob/master/data/LeetCode.apkg?raw=true) _Example [Deck](https://github.com/Peng-YM/LeetCode-Anki/blob/master/data/LeetCode.apkg?raw=true)_

## 使用 _Usage)

首先Clone仓库并安装Python依赖

_First Clone the repository and install the Python dependencies._

```bash
git clone https://github.com/Peng-YM/LeetCode-Anki.git
cd LeetCode-Anki
pip3 install -r requirements.txt
```

运行爬虫并输出Anki卡组到`./data/LeetCode.apkg` （由`project.conf`指定）。

_Run the crawler and export the Anki deck to `. /data/LeetCode.apkg` (specified by `project.conf`)._


```bash
python3 main.py
```

增加对Leetcode.cn的支持

_Add support for Leetcode.cn:_

```bash
python3 main_cn.py
```

首次运行需要获取cookie，运行`main.py`会打开一个Chrome窗口, 手动填写用户名和密码登陆一次即可。

_The first time you run it you will need to get a cookie, run `main.py` and a Chrome window will open, **manually** fill in the username and password to log in once._

> ⚠️ 注意：
> 1. 如果需要重新浏览器登陆，只需要删除目录下的`cookie.dat`即可。
> 2. 如果浏览器的驱动过期（目前为V86.0），请前往[下载Chrome的Selenium驱动](https://chromedriver.chromium.org/downloads) 并替换`vendor`的旧驱动。


> _⚠️ Caution._
> 1. _If you need to re-browser login, just delete `cookie.dat` from the directory._
> 2. _If the browser driver is out of date (currently V86.0), please go to [Download Selenium driver for Chrome](https://chromedriver.chromium.org/downloads) and replace the old driver for `vendor`._


愉快使用Anki复习做过的题目吧。

_Enjoy using Anki to review the topics you have done._


## 自定义 _Customization_

如果你不喜欢默认生成的Anki卡片样式，你可以修改`project.conf`里面的以下三个参数，自定义生成的Anki卡片。

_If you don't like the default generated Anki card style, you can modify the following three parameters in `project.conf` to customize the generated Anki card._

```properties
[DB]
path = ./data
debug = False

[Anki]
front = ./templates/front-side.html
back = ./templates/back-side.html
css = ./templates/style.css
output = ./data/LeetCode.apkg
```

- `front`: 卡片正面的格式。_The format of the card front._
- `back`: 卡片背面的格式。_The format on the back of the card._
- `css`: _The css style of the card._

## LICENSE

本项目基于GPL V3开源协议。

_This project is based on the GPL V3 open source license._

## Acknowledgements

本项目基于众多优秀的开源项目：

_This project is based on a number of excellent open source projects:_

- [genanki: A Library for Generating Anki Decks](https://github.com/kerrickstaley/genanki)

- [Python Markdown: Python implementation of John Gruber's Markdown](https://github.com/Python-Markdown/markdown)
