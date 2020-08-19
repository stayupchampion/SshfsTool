<p align="center">
  <img src="https://github.com/stayupchampion/SshfsTool/blob/master/SshfsTool/Assets.xcassets/AppIcon.appiconset/SshTool_512x2.png?raw=true" width=240 />
</p>
<p align="center">
	<a href="https://github.com/stayupchampion/SshfsTool/blob/master/LICENSE">
		<img src="https://img.shields.io/github/license/stayupchampion/SshfsTool"/>
    </a>
</p>






# SshfsTool

## 项目简介

SshfsTool 是一款 Mac 端的挂载远程目录的状态栏工具App，可以基于 ssh 协议将远程的目录挂载到本地。实现在本地像浏览文件夹一样以GUI的形式访问远程服务器的文件系统(尽管远程服务器没有GUI界面~)



## 功能特性

- 在应用的偏好设置中设置登录信息后，每次需要挂载远程目录时，点菜单栏的"连接"即可
- 挂载完成后，如果出现突然断网、或合盖休眠断网，在网络重新可用的时候会自动重连
- 不需要挂载时，点菜单栏的"断开"即可断开断开连接

### 登录信息

- 用户名：远程主机的用户名
- 主机：IP地址 / 域名 / 主机地址在本机的别名(在`~/.ssh/config`中定义)
- 远程目录：想要挂载的远程目录
- 本地目录：必须是本地的空文件夹，挂载后文件夹作为一个磁盘映像存在



## 环境依赖

需要本地环境变量支持`sshfs`命令

- 下载 sshfs 模块：

	```shell
	brew install sshfs
	```



## 安装

打开 dmg 文件，将 .app 文件拖动到 ~/Application



## 目录结构描述

```shell
.
├── LICENSE
├── SshfsTool
│   ├── AppDelegate.h
│   ├── AppDelegate.m # 实现主要逻辑
│   ├── Assets.xcassets # app 的图片资源
│   ├── Base.lproj
│   │   └── Main.storyboard
│   ├── Info.plist
│   ├── SshfsTool.entitlements
│   ├── WXSetVC.h
│   ├── WXSetVC.m # 偏好设置面板
│   └── main.m
└── SshfsTool.xcodeproj
```



## 版本内容更新

### v0.1.0_alpha

- 实现基本的连接挂载、断开连接功能



## 常见问题

<details>
<summary>使用第三方工具Bartender后状态栏图标不可见？</summary><br>
    <pre><p>1. 在Bartender的偏好设置中设置SshfsTool为始终可见。</p></pre>
    <pre><p>2. 有可能是执行本应用时使用root权限，但是bartender是用户权限运行的。<br>	此情况通过设置Sshfs.app的权限为777来解决。</p></pre>
    <pre><p>3. 如果显示Bartender无法控制应用程序SshfsTool。<br>	先退出Bartender，按住cmd键同时拖动状态栏上显示出来的SshfsTool图标到一个合适的地方。<br>	再重启Bartender，之后Bartender就会放弃对Sshfs的控制。</p></pre>
    <pre><p><a href="https://www.macbartender.com/help/knowledge-base.html">更多来自Bartender官方的帮助</a></p></pre>
</details>


## 参与贡献方式

- 任何问题欢迎在[Issues](https://github.com/stayupchampion/SshfsTool/issues)中反馈
- 如果想直接参与项目，欢迎来提[PR](https://github.com/stayupchampion/SshfsTool/pulls)~



## 协议

[MIT](https://github.com/stayupchampion/SshfsTool/blob/master/LICENSE) &copy; wanx