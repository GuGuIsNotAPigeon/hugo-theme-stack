---
title: "使用Hugo搭建一个属于你自己的博客"
description: 
date: 2026-04-30T18:42:46+08:00
image: hugo_01.png
license: false
comments: true
draft: false
categories: 
    - Hugo
    - VS Code
    - git
tags: 
    - 教程
    - 静态网站
    - 开源软件
build:
    list: always    # 更改为“从不”以从列表中隐藏该页面
---
![博客首页展示](index.jpg)

<!-- ![文章内容展示](img1.jpg) -->
# 搭建博客
> [!TIP]
> 因为hugo.Extended效果比hugo强，所以下文统一使用hugo.Extended
## 准备工作
### 安装VS Code
VS Code 是微软官方免费开源的文本编辑器，支持 Windows、macOS 和 Linux 三大平台。

#### 下载与安装 VS Code
打开 [VS Code 下载页面](https://code.visualstudio.com/Download)，根据你使用的操作系统选择合适的安装包

![VS Code下载页面](vscodeDownload.jpg)

打开安装包根据安装提示进行安装

![VS Code安装界面](vscodeInstall.jpg)

#### 配置VS Code

安装完毕之后，在桌面双击打开 Visual Studio Code，分别搜索并安装以下插件：

![汉化插件Chinese](./vscodeChinese.jpg)  ![toml语法高亮插件toml](vscodeToml.jpg)  ![html文件实时预览插件live](./vscodeLiveServer.jpg)

安装完成之后重启 VS Code，此时整个软件界面就会汉化为中文
![汉化后的VS Code](./vscodeChineseImg.jpg)

最后点击`文件`把`自动保存`打开
![自动保存](./autoSave.jpg)

### 安装 Git
> Git 是一个分布式版本控制软件系统，能够管理源代码或数据的版本。它通常用于协作开发软件的程序员控制源代码<br>
> — <cite>摘抄自 [维基百科](https://en.wikipedia.org/wiki/Git)</cite>

#### 下载并安装 Git
打开 [Git 下载页面](https://git-scm.com/install/windows)，选择适合你操作系统的安装包下载

![git下载页面](./gitDownload.jpg)

打开 Git 安装包，点击 "Next" 来到以下界面，按照图示勾选后完成安装

![git安装图示](./gitInstall.jpg)

### 配置 GitHub
#### 注册 GitHub 账号
打开 [GitHub 主页](https://github.com)，点击 "Sign up"，根据你的真实信息填写，完成注册

![Github主页](./githubSignUp.jpg)  ![Github注册页面](./githubSignUp1.jpg)

#### 新建项目
[来到 GitHub 主页](https://github.com)，点击 "New" [新建一个空仓库](https://github.com/new)，"Repository name" 填写「你的 GitHub 用户名.github.io」，"Description" 填写你对该项目的描述，同时勾选 "Add a README file"

![新建空仓库](./newRepositories.jpg)  ![](./createNewRepository.jpg)

#### 配置 SSH 密钥
在开始菜单中搜索 "Git Bash" 并打开，或者在桌面空白处右键点击，选择 "Open Git Bash Here"

![右键桌面空白处](./desktopGitBash.jpg)

运行以下命令（将 `your_email@example.com` 替换为你的邮箱地址），如果询问是否确认，直接回车即可：
```
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id*.pub
```

把第二条命令输出的文本复制下来，打开 [SSH 密钥设置页面](https://github.com/settings/ssh/new)，在 "Title" 里填写一个名称（如 "我的工作电脑"），"Key type" 保持默认不变，将复制的公钥文本粘贴到 "Key" 框中
> [!IMPORTANT]
> 密钥最后面不能有空格！

![新建ssh密钥](./newSSH-key.jpg)

最后在终端测试 SSH 连通性，出现 `xxx! You've successfully authenticated, but GitHub does not provide shell access.` 即表示连接成功

![测试ssh连通性](./sshTest.jpg)

## 安装 Hugo
### Windows 系统安装 Hugo
#### 使用微软官方的 Windows 软件包管理器 winget

* **安装 Hugo Extended**
```
winget install Hugo.Hugo.Extended
```
* **卸载 Hugo Extended**
```
winget uninstall --name "Hugo (Extended)"
```
#### 使用 GitHub 上已编译好的 [二进制文件](https://github.com/gohugoio/hugo/releases/latest)
下载 `hugo_extended_x.xxx.x_windows-amd64.zip`，解压后 [配置环境变量](https://zhuanlan.zhihu.com/p/646247339)

![Windows操作系统所需软件包](./hugoExtendedDownload.jpg)

### Linux 系统安装 Hugo
#### 使用包管理器安装

* **Ubuntu/Debian 系统**
    * 使用 apt 包管理器安装 Hugo Extended
    ```bash
    sudo apt-get update
    sudo apt-get install hugo
    ```

* **Fedora 系统**
    * 使用 dnf 包管理器安装
    ```bash
    sudo dnf install hugo
    ```

* **Arch Linux 系统**
    * 使用 pacman 包管理器安装
    ```bash
    sudo pacman -S hugo
    ```

#### 使用编译好的二进制文件安装
> [!TIP]
> 这种方法可以获取最新版本的 Hugo，特别是 Extended 版本

1. 打开 [Hugo Releases 页面](https://github.com/gohugoio/hugo/releases/latest)，下载适合你系统的文件：
   * 64 位系统：下载 `hugo_extended_x.xxx.x_linux-amd64.tar.gz`
   * 32 位系统：下载 `hugo_extended_x.xxx.x_linux-386.tar.gz`
   * ARM 架构：下载对应的 `hugo_extended_x.xxx.x_linux-arm64.tar.gz`

2. 打开终端，进入下载文件的目录：
```bash
cd 文件所在路径
```

3. 解压文件：
```bash
tar -zxvf hugo_extended_x.xxx.x_linux-amd64.tar.gz
```

4. 将 Hugo 可执行文件移动到系统路径：
```bash
sudo mv hugo /usr/local/bin/
```

5. 验证是否安装成功：
```bash
hugo version
```
如果输出类似于 `hugo v0.160.1-d6bc8165e62b29d7d70ede01ed01d0f88de327e6+extended xxx/amd64 BuildDate=2026-04-08T14:02:42Z VendorInfo=gohugoio` 即表示安装成功

## 编辑项目
### 进入项目
* 创建一个空白的英文文件夹
* 打开 VS Code，点击「打开文件夹...」，选择你刚才创建的文件夹

![VS Code 打开文件夹](./vscodeOpenFolder.jpg)

按下快捷键 `Ctrl + J` 打开终端，克隆 [我的项目](https://github.com/GuGuIsNotAPigeon/hugo-theme-stack)[^1]
[^1]: 该项目是基于 Jimmy 大佬设计的 Stack 主题用 AI 二改的

> [!TIP]
> 国内用户优先使用第二条命令

**Windows 用户**
```
git clone https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git .\
git clone https://gh-proxy.org/https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git .\
```
**Linux/macOS 用户**
```
git clone https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git ./
git clone https://gh-proxy.org/https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git ./
```

![克隆项目](./gitClone.jpg)
### 修改项目
* 在左侧的资源管理器中打开 `config\_default\languages.toml`，将 `title` 后面的内容修改为你的昵称，`subtitle` 后填写副标题
* 打开 `config\_default\params.toml`，在 `[sidebar]` 下的 `avatar` 中修改你的头像链接
* 打开 `config\_default\hugo.toml`，把`baseURL = "https://guguisnotapigeon.github.io/"`改成`https://github用户名.github.io`

![languages.toml](./languagesToml.jpg)  ![params.toml](./paramsToml.jpg)  ![hugo.toml](./hugoToml.jpg)

* 其他文件的修改可查看原作者的 [教程](https://stack.cai.im/zh/guide/)，需要根据实际情况进行调整

![Stack官方教程](./stackWeb.jpg)

> [!TIP]
> 无论是文字还是链接，都需要在英文双引号内修改

* 在终端运行以下命令，按住 `Ctrl` 键并单击 `http://localhost:xxxx` 即可在浏览器中预览网站：
```
hugo serve -D
```

![hugo serve -D](./openLocalhost.jpg)
### 添加文章
> [!TIP]
> 文章目录是为了更好地分类文章，推荐使用英文作为目录名称

* Windows 用户在终端运行以下脚本：
```
.\newPost.bat
```
* Linux/macOS 用户运行以下命令：
```
chmod +x ./newPost.sh
./newPost.sh
```

![newPost](./newPost.jpg)

打开对应目录的 `index.zh.md`，修改以下内容：
* `title`：文章标题
* `description`：文章描述
* `image`：文章封面图片地址（可使用相对路径）
* `comments`：开关评论区（开：`true`，关：`false`）

> [!TIP]
> 请将 `draft: true` 改为 `draft: false`

![index.zh.md首段](./indexMd.jpg)

文章内容编写可查看原作者的 [Markdown 语法指南](https://demo.stack.cai.im/zh/p/markdown-%E8%AF%AD%E6%B3%95%E6%8C%87%E5%8D%97/)

![Markdown 语法指南](./markdownWeb.jpg)
> [!TIP]
> 运行 `hugo serve -D` 命令可实时查看文章修改情况

## 部署网站
### 生成静态网页
文章写完之后，在项目根目录运行以下命令生成静态网页：
```
hugo
```
此时 `public` 文件夹中会出现许多文件
![public文件夹](./publicDir.jpg)

接着运行以下命令：
```
cd public
git init
git config --global --add safe.directory 你项目的绝对路径/public
git remote add origin https://github.com/你的GitHub用户名/用户名.github.io.git
git checkout -b main
git pull origin main
git status
git add .
git config --global user.email "你的GitHub绑定的邮箱地址"
git config --global user.name "GitHub用户名"
git commit -m "你的提交信息"
git push origin main
```

### 推送项目
打开你的 GitHub 仓库，点击「Settings」→「Pages」，在「Branch」中将「None」更改为「main」，点击「Save」
![Github Pages](./githubPages.jpg)

等待 GitHub 部署完毕，之后就可以通过以下地址访问你的博客[^2]
![My Blog](./blogHome.jpg)

[^2]: 地址为 https://你的GitHub用户名.github.io
> [!NOTE]小笔记
> 后续推送项目可运行`gitPush.bat`