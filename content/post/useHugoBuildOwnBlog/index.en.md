---
title: "Build Your Own Blog with Hugo"
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
    - Tutorial
    - Static Site
    - Open Source
build:
    list: always
---
![Blog Home Page](index.jpg)

<!-- ![Article Content](img1.jpg) -->
# Building a Blog
> [!TIP]
> Since Hugo.Extended has more features than standard Hugo, we will use Hugo.Extended throughout this guide.

## Prerequisites
### Install VS Code
VS Code is Microsoft's free and open-source text editor, supporting Windows, macOS, and Linux.

#### Download and Install VS Code
Open the [VS Code download page](https://code.visualstudio.com/Download) and choose the appropriate installer for your operating system.

![VS Code Download Page](vscodeDownload.jpg)

Run the installer and follow the installation prompts.

![VS Code Installation](vscodeInstall.jpg)

#### Configure VS Code
After installation, open Visual Studio Code from the desktop and search for and install the following plugins:

![Chinese Language Pack](./vscodeChinese.jpg)  ![TOML Syntax Highlighting](./vscodeToml.jpg)  ![HTML Live Preview](./vscodeLiveServer.jpg)

Restart VS Code after installation, and the entire software interface will be in Chinese.

![VS Code after Chinese](./vscodeChineseImg.jpg)

Finally, click "File" and enable "Auto Save".

![Auto Save](./autoSave.jpg)

### Install Git
> Git is a distributed version control system that can manage source code or data versions. It is commonly used by software developers for source code control in collaborative development<br>
> — <cite>Excerpt from [Wikipedia](https://en.wikipedia.org/wiki/Git)</cite>

#### Download and Install Git
Open the [Git download page](https://git-scm.com/install/windows) and download the appropriate installer for your operating system.

![Git Download Page](./gitDownload.jpg)

Run the Git installer, click "Next" to reach the following screen, check the options as shown and complete the installation.

![Git Installation](./gitInstall.jpg)

### Configure GitHub
#### Register a GitHub Account
Open [GitHub's homepage](https://github.com), click "Sign up", fill in your information to complete registration.

![GitHub Homepage](./githubSignUp.jpg)  ![GitHub Sign Up](./githubSignUp1.jpg)

#### Create a New Repository
Go to [GitHub's homepage](https://github.com), click "New" to [create a new repository](https://github.com/new), fill in "Repository name" with "your-github-username.github.io", fill in "Description" with a description for your project, and check "Add a README file".

![Create New Repository](./newRepositories.jpg)  ![](./createNewRepository.jpg)

#### Configure SSH Key
Search for "Git Bash" in the Start menu and open it, or right-click on the desktop and select "Open Git Bash Here".

![Open Git Bash on Desktop](./desktopGitBash.jpg)

Run the following commands (replace `your_email@example.com` with your email address), press Enter when prompted:
```
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id*.pub
```

Copy the output from the second command, open the [SSH key settings page](https://github.com/settings/ssh/new), fill in a name in "Title" (e.g., "My Work Computer"), keep "Key type" as default, and paste the copied public key into the "Key" field.
> [!IMPORTANT]
> Make sure there are no trailing spaces in the key!

![Create SSH Key](./newSSH-key.jpg)

Finally, test SSH connectivity in the terminal. If you see `xxx! You've successfully authenticated, but GitHub does not provide shell access.`, the connection is successful.

![Test SSH Connection](./sshTest.jpg)

## Install Hugo
### Install Hugo on Windows
#### Using Microsoft's Windows Package Manager winget

* **Install Hugo Extended**
```
winget install Hugo.Hugo.Extended
```
* **Uninstall Hugo Extended**
```
winget uninstall --name "Hugo (Extended)"
```
#### Using Pre-compiled Binaries from GitHub
Download `hugo_extended_x.xxx.x_windows-amd64.zip` from [GitHub](https://github.com/gohugoio/hugo/releases/latest), extract it, and [configure environment variables](https://zhuanlan.zhihu.com/p/646247339)

![Hugo Extended Download](./hugoExtendedDownload.jpg)

### Install Hugo on Linux
#### Using Package Managers

* **Ubuntu/Debian Systems**
    * Install Hugo Extended using apt
    ```bash
    sudo apt-get update
    sudo apt-get install hugo
    ```

* **Fedora Systems**
    * Install using dnf
    ```bash
    sudo dnf install hugo
    ```

* **Arch Linux Systems**
    * Install using pacman
    ```bash
    sudo pacman -S hugo
    ```

#### Using Pre-compiled Binaries
> [!TIP]
> This method can get the latest version of Hugo, especially the Extended version

1. Open the [Hugo Releases page](https://github.com/gohugoio/hugo/releases/latest) and download the file suitable for your system:
   * 64-bit systems: download `hugo_extended_x.xxx.x_linux-amd64.tar.gz`
   * 32-bit systems: download `hugo_extended_x.xxx.x_linux-386.tar.gz`
   * ARM architecture: download the corresponding `hugo_extended_x.xxx.x_linux-arm64.tar.gz`

2. Open the terminal and navigate to the downloaded file's directory:
```bash
cd /path/to/downloaded/file
```

3. Extract the file:
```bash
tar -zxvf hugo_extended_x.xxx.x_linux-amd64.tar.gz
```

4. Move the Hugo executable to the system path:
```bash
sudo mv hugo /usr/local/bin/
```

5. Verify the installation:
```bash
hugo version
```
If the output is similar to `hugo v0.160.1-d6bc8165e62b29d7d70ede01ed01d0f88de327e6+extended xxx/amd64 BuildDate=2026-04-08T14:02:42Z VendorInfo=gohugoio`, the installation is successful.

## Edit the Project
### Enter the Project
* Create a new empty folder with an English name
* Open VS Code, click "Open Folder...", and select the folder you just created

![VS Code Open Folder](./vscodeOpenFolder.jpg)

Press `Ctrl + J` to open the terminal, and clone [my project](https://github.com/GuGuIsNotAPigeon/hugo-theme-stack)[^1]
[^1]: This project is based on Jimmy's Stack theme, modified by AI.

> [!TIP]
> Chinese users should prioritize using the second command

**Windows Users**
```
git clone https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git .\
git clone https://gh-proxy.org/https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git .\
```
**Linux/macOS Users**
```
git clone https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git ./
git clone https://gh-proxy.org/https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git ./
```

![Clone Project](./gitClone.jpg)

### Modify the Project
* In the Explorer on the left, open `config\_default\languages.toml`, change the content after `title` to your nickname, and fill in the subtitle after `subtitle`
* Open `config\_default\params.toml`, modify your avatar link under `[sidebar]` -> `avatar`
* Open `config\_default\hugo.toml`, change `baseURL = "https://guguisnotapigeon.github.io/"` to `https://your-github-username.github.io`

![languages.toml](./languagesToml.jpg)  ![params.toml](./paramsToml.jpg)  ![hugo.toml](./hugoToml.jpg)

* For modifying other files, see the original author's [tutorial](https://stack.cai.im/en/guide/), and make adjustments based on your actual situation

![Stack Official Tutorial](./stackWeb.jpg)

> [!TIP]
> Whether text or links, they must be modified within English double quotes

* Run the following command in the terminal, hold `Ctrl` and click `http://localhost:xxxx` to preview the website in the browser:
```
hugo serve -D
```

![hugo serve -D](./openLocalhost.jpg)

### Add Articles
> [!TIP]
> Article directories are for better categorizing articles. It is recommended to use English as the directory name.

* Windows users run the following script in the terminal:
```
.\newPost.bat
```
* Linux/macOS users run the following command:
```
chmod +x ./newPost.sh
./newPost.sh
```

![newPost](./newPost.jpg)

Open `index.md` in the corresponding directory and modify the following:
* `title`: Article title
* `description`: Article description
* `image`: Article cover image path (can use relative path)
* `comments`: Toggle comment section (on: `true`, off: `false`)

> [!TIP]
> Please change `draft: true` to `draft: false`

![index.md First Paragraph](./indexMd.jpg)

For article content writing, see the original author's [Markdown syntax guide](https://demo.stack.cai.im/en/p/markdown-syntax/)

![Markdown Syntax Guide](./markdownWeb.jpg)
> [!TIP]
> Running `hugo serve -D` allows you to view article modifications in real-time

## Deploy the Website
### Generate Static Pages
After writing the article, run the following command in the project root to generate static pages:
```
hugo
```

Many files will appear in the `public` folder.

![public folder](./publicDir.jpg)

Then run the following commands:
```
cd public
git init
git config --global --add safe.directory /absolute/path/to/your/project/public
git remote add origin https://github.com/your-github-username/your-github-username.github.io.git
git checkout -b main
git pull origin main
git status
git add .
git config --global user.email "your-github-email@example.com"
git config --global user.name "your-github-username"
git commit -m "Your commit message"
git push origin main
```

### Push the Project
Open your GitHub repository, click "Settings" → "Pages", change "Branch" from "None" to "main", and click "Save"

![GitHub Pages](./githubPages.jpg)

Wait for GitHub to finish deploying. After that, you can access your blog at the following address[^2]

![My Blog](./blogHome.jpg)

[^2]: Address is https://your-github-username.github.io
> [!NOTE] Quick Note
> For subsequent pushes, you can run `gitPush.bat`

Run the installer and follow the installation prompts.

![VS Code Installation](vscodeInstall.jpg)

#### Configure VS Code
After installation, open Visual Studio Code from the desktop and search for and install the following plugins:

![Chinese Language Pack](./vscodeChinese.jpg)  ![TOML Syntax Highlighting](./vscodeToml.jpg)  ![HTML Live Preview](./vscodeLiveServer.jpg)

Restart VS Code after installation, and the entire software interface will be in Chinese.

![VS Code after Chinese](./vscodeChineseImg.jpg)

### Install Git
> Git is a distributed version control system that can manage source code or data versions. It is commonly used by software developers for source code control in collaborative development<br>
> — <cite>Excerpt from [Wikipedia](https://en.wikipedia.org/wiki/Git)</cite>

#### Download and Install Git
Open the [Git download page](https://git-scm.com/install/windows) and download the appropriate installer for your operating system.

![Git Download Page](./gitDownload.jpg)

Run the Git installer, click "Next" to reach the following screen, check the options as shown and complete the installation.

![Git Installation](./gitInstall.jpg)

### Configure GitHub
#### Register a GitHub Account
Open [GitHub's homepage](https://github.com), click "Sign up", fill in your information to complete registration.

![GitHub Homepage](./githubSignUp.jpg)  ![GitHub Sign Up](./githubSignUp1.jpg)

#### Create a New Repository
Go to [GitHub's homepage](https://github.com), click "New" to [create a new repository](https://github.com/new), fill in "Repository name" with "your-github-username.github.io", fill in "Description" with a description for your project, and check "Add a README file".

![Create New Repository](./newRepositories.jpg)  ![](./createNewRepository.jpg)

#### Configure SSH Key
Search for "Git Bash" in the Start menu and open it, or right-click on the desktop and select "Open Git Bash Here".

![Open Git Bash on Desktop](./desktopGitBash.jpg)

Run the following commands (replace `your_email@example.com` with your email address), press Enter when prompted:
```
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id*.pub
```

Copy the output from the second command, open the [SSH key settings page](https://github.com/settings/ssh/new), fill in a name in "Title" (e.g., "My Work Computer"), keep "Key type" as default, and paste the copied public key into the "Key" field.
> [!IMPORTANT]
> Make sure there are no trailing spaces in the key!

![Create SSH Key](./newSSH-key.jpg)

Finally, test SSH connectivity in the terminal. If you see `xxx! You've successfully authenticated, but GitHub does not provide shell access.`, the connection is successful.

![Test SSH Connection](./sshTest.jpg)

## Install Hugo
### Install Hugo on Windows
#### Using Microsoft's Windows Package Manager winget

* **Install Hugo Extended**
```
winget install Hugo.Hugo.Extended
```
* **Uninstall Hugo Extended**
```
winget uninstall --name "Hugo (Extended)"
```
#### Using Pre-compiled Binaries from GitHub
Download `hugo_extended_x.xxx.x_windows-amd64.zip` from [GitHub](https://github.com/gohugoio/hugo/releases/latest), extract it, and [configure environment variables](https://zhuanlan.zhihu.com/p/646247339)

![Hugo Extended Download](./hugoExtendedDownload.jpg)

### Install Hugo on Linux
#### Using Package Managers

* **Ubuntu/Debian Systems**
    * Install Hugo Extended using apt
    ```bash
    sudo apt-get update
    sudo apt-get install hugo
    ```

* **Fedora Systems**
    * Install using dnf
    ```bash
    sudo dnf install hugo
    ```

* **Arch Linux Systems**
    * Install using pacman
    ```bash
    sudo pacman -S hugo
    ```

#### Using Pre-compiled Binaries
> [!TIP]
> This method can get the latest version of Hugo, especially the Extended version

1. Open the [Hugo Releases page](https://github.com/gohugoio/hugo/releases/latest) and download the file suitable for your system:
   * 64-bit systems: download `hugo_extended_x.xxx.x_linux-amd64.tar.gz`
   * 32-bit systems: download `hugo_extended_x.xxx.x_linux-386.tar.gz`
   * ARM architecture: download the corresponding `hugo_extended_x.xxx.x_linux-arm64.tar.gz`

2. Open the terminal and navigate to the downloaded file's directory:
```bash
cd /path/to/downloaded/file
```

3. Extract the file:
```bash
tar -zxvf hugo_extended_x.xxx.x_linux-amd64.tar.gz
```

4. Move the Hugo executable to the system path:
```bash
sudo mv hugo /usr/local/bin/
```

5. Verify the installation:
```bash
hugo version
```
If the output is similar to `hugo v0.160.1-d6bc8165e62b29d7d70ede01ed01d0f88de327e6+extended xxx/amd64 BuildDate=2026-04-08T14:02:42Z VendorInfo=gohugoio`, the installation is successful.

## Edit the Project
### Enter the Project
* Create a new empty folder with an English name
* Open VS Code, click "Open Folder...", and select the folder you just created

![VS Code Open Folder](./vscodeOpenFolder.jpg)

Press `Ctrl + J` to open the terminal, and clone [my project](https://github.com/GuGuIsNotAPigeon/hugo-theme-stack)[^1]
[^1]: This project is based on Jimmy's Stack theme, modified by AI.

> [!TIP]
> Chinese users should prioritize using the second command

**Windows Users**
```
git clone https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git .\
git clone https://gh-proxy.org/https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git .\
```
**Linux/macOS Users**
```
git clone https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git ./
git clone https://gh-proxy.org/https://github.com/GuGuIsNotAPigeon/hugo-theme-stack.git ./
```

### Modify the Project
* In the Explorer on the left, open `config\_default\languages.toml`, change the content after `title` to your nickname, and fill in the subtitle after `subtitle`
* Open `config\_default\params.toml`, modify your avatar link under `[sidebar]` -> `avatar`
* For modifying other files, see the original author's [tutorial](https://stack.cai.im/en/guide/), and make adjustments based on your actual situation

> [!TIP]
> Whether text or links, they must be modified within English double quotes

* Run the following command in the terminal, hold `Ctrl` and click `http://localhost:xxxx` to preview the website in the browser:
```
hugo serve -D
```

### Add Articles
> [!TIP]
> Article directories are for better categorizing articles. It is recommended to use English as the directory name.

* Windows users run the following script in the terminal:
```
.\newPost.bat
```
* Linux/macOS users run the following command:
```
chmod +x ./newPost.sh
./newPost.sh
```

Open `index.md` in the corresponding directory and modify the following:
* `title`: Article title
* `description`: Article description
* `image`: Article cover image path (can use relative path)
* `comments`: Toggle comment section (on: `true`, off: `false`)

> [!TIP]
> Please change `draft: true` to `draft: false`

For article content writing, see the original author's [Markdown syntax guide](https://demo.stack.cai.im/en/p/markdown-syntax/)
> [!TIP]
> Running `hugo serve -D` allows you to view article modifications in real-time

## Deploy the Website
### Generate Static Pages
After writing the article, run the following command in the project root to generate static pages:
```
hugo
```

Many files will appear in the `public` folder. Then run the following commands:
```
cd public
git init
git config --global --add safe.directory /absolute/path/to/your/project/public
git remote add origin https://github.com/your-github-username/your-github-username.github.io.git
git checkout -b main
git pull origin main
git status
git add .
git config --global user.email "your-github-email@example.com"
git config --global user.name "your-github-username"
git commit -m "Your commit message"
git push origin main
```

### Push the Project
Open your GitHub repository, click "Settings" → "Pages", change "Branch" from "None" to "main", and click "Save"

Wait for GitHub to finish deploying. After that, you can access your blog at the following address[^2]:
[^2]: Address is https://your-github-username.github.io