---
    layout: post
    title: "scriptコマンドでTerminalでの作業ログを残す"
    date: 2020-05-18 08:34
    comments: true
    categories:
    - Shell
    - Bashrc
    - Zshrc
---

## 保存先のディレクトリを作っとく
```
$ mkdir ~/OpeLog/
```

## rcファイルとかprofileに下記を記述しとく
```
script -f ~/OpeLog/$(date +%Y%m%d_%H%M%S)_$(whoami)_Operation.log
```
