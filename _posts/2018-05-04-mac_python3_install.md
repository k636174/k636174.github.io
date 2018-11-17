---
layout: post
title: Python3をMacにインストール
permalink: /mac_python3_install
tags:
- プログラミング
- Python3
---

![top_img](/assets/images/mac_python3.png)

開発用に自分のMacBookProにpython3をインストールした時のメモ。  
PHP以外の言語使うのご無沙汰なので思い出せるかしら。。。

とりあえずMacにはPython2.7.10が入ってるっぽい。。。

```
k636174@judgement-2(13:57:16) ~
% python -V                                                                 [~]
Python 2.7.10
k636174@judgement-2(13:57:20) ~
%
```
エラーで怒られた。
brew upgrade python しろだって。。。

```
k636174@judgement-2(13:57:20) ~
% brew install python3   
--%<--省略--%<----%<--省略--%<--
Error: python 2.7.14 is already installed
To upgrade to 3.6.5, run `brew upgrade python`
```
upgrade pythonで上手く行った。
今回はバージョン切り替えたりする必要も無いと思うのでこれで良いや（←適当

```
k636174@judgement-2(13:58:07) ~
% brew upgrade python                                                       [~]
==> Upgrading 1 outdated
--%<--省略--%<----%<--省略--%<--
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python/libexec/bin

If you need Homebrew's Python 2.7 run
  brew install python@2

Pip, setuptools, and wheel have been installed. To update them run
  pip3 install --upgrade pip setuptools wheel

You can install Python packages with
  pip3 install
They will install into the site-package directory
  /usr/local/lib/python3.6/site-packages

See: https://docs.brew.sh/Homebrew-and-Python
==> Summary
  /usr/local/Cellar/python/3.6.5: 9,140 files, 154.6MB, built in 5 minutes 25 seconds
k636174@judgement-2(14:04:06) ~
%
```
パスとか諸々調整して無事にpythonが入った。

```
k636174@judgement-2(14:05:02) ~
% vi .zshrc                                                                                                                                                                  [~]
k636174@judgement-2(14:06:02) ~
% zsh                                                                                                                                                                        [~]
k636174@judgement-2(14:06:16) ~
% python3 -V                                                                                                                                                                 [~]
Python 3.6.5
k636174@judgement-2(14:09:21) ~
%       
```
