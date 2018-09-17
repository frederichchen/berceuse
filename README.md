## Introduction（简介）

This is my .emacs configuration for daily use. Referred to the configuration of [Prelude](http://batsov.com/prelude/) & [Steve Purcell](https://github.com/purcell/emacs.d), I have made some modifications, including replacing paredit-mode with smartparens, ruby-mode with enh-ruby-mode etc. 

这是我本人的 .emacs 文件，在  [Prelude](http://batsov.com/prelude/) 和 [Steve Purcell](https://github.com/purcell/emacs.d) 的基础上做了一些修改，比如用 smartparens 替代了 paredit-mode ，用 enh-ruby-mode 替代了 ruby-mode 等。

For appearance, I use the [molokai theme](https://github.com/hbin/molokai-theme).

在外观方面，我使用了 [molokai主题](https://github.com/hbin/molokai-theme) 。

## Requirements（要求）

Most of the packages are downloaded through [Melpa](http://melpa.org/).

大部分包都是从 [Melpa](http://melpa.org/) 下载的。

I have just tested this on Linux platform. By the way, I use archlinux.

我仅仅在 Linux 环境下测试过这个配置，顺便说一句，我用的是 archlinux 。

## Directories（目录结构）

init.el is used for basic settings and importing other .el files.

init.el 文件用来做一些基础设置和导入其他的 .el 文件。

berceuse-plugins.el is used for customizing the plugins you would like to use. You can comment/uncomment the lines according to your need.

berceuse-plugins.el 里面定义了要下载和启用哪些插件，你可以根据自己的需要来注释掉或取消注释。

core directory is used for core components of berceuse, including package management, basic editor settings etc.

core 目录用于存放 berceuse 的核心组件，包括包管理、编辑器基本配置等。

plugins directory is used for storing every downloaded package. 

plugins 目录用来存放所有下载的包。

lisp directory is used for storing the configurations for each package, in which all files are named as "berceuse-xxx.el".

lisp 目录用来存放每一个包的配置，文件都用"berceuse-xxx.el"的形式来命名。

personal directory is used for storing theme files, you can configure your personal settings e.g font setting here.

personal 目录用于存放个人设置，你可以把你自己的配置例如字体等放在这里。

site-lisp directory is used for storing 3rd-party plugins.

site-lisp 目录用于存放第三方插件。


