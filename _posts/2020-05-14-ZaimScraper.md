---
    layout: post
    title: "家計簿アプリの情報をMariaDBに入れてカッチョ良く表示する"
    date: 2020-05-14
    permalink: /zaim_scraper
    tags:
    - Docker
    - Selenium
    - Zaim
    - 家計簿
    - Python
    - MariaDB
    image: /assets/images/20200514_thumbnail.png
---

## 概要
![thumbnail](/assets/images/20200514_thumbnail.png "thumbnail")
普段、Zaimのプレミアムプラン使って家計簿つけてます。  

ただ、年金ネットや確定拠出年金などは資産から除外したかったり、この口座は資産扱いしない。。。などなど色々自分好みの家計分析をしたかったので、これまではCSVを定期的に手動でダウンロードしてエクセルでグラフ化したりしてました。  

しかし、1MByteほどあるCSVを毎回手動でエクセルに落とし込むのも面倒になってきたので自動化してみました。  

また、手元のMacbookやWindows端末など色んな環境で見たりしたいのでDocker Composeで諸々まとめてポータビリティも確保してます。

## 仕組み
1. コマンド一発打ったらZaimにログイン。
1. 今月分の口座残高推移をスクレイピングしてMariaDBに格納。
1. 過去全ての履歴が記載あれたCSVをダウンロードしてMariaDBへ格納。
1. 取得したCSVはバックアップとしてそのまま放置。（ディスク容量逼迫してきたら考える実務でやるとダメなダメなパターン）

![概要図](/assets/images/20200514_container_overview.png "概要図")
※ 今回はZaimへ余計な負荷を掛けない為に、ホストOS側からコンテナ内のスクリプトを手動で起動する方針にしました。

## Todo
 * 気が向いたらスクリプトとか、docker-compose.ymlを追記する。
 * AWSの勉強がてら、オンプレで作ったこの環境をAWSに移行する。