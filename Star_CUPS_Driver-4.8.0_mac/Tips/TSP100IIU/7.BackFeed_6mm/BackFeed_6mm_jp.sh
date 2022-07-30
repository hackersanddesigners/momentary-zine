#!/bin/sh
#
# TSP100IIU用 Back Feed 6mm 設定スクリプト
#
# 利用方法:
#
# 1) TSP100IIUをデフォルトプリンタにしてください。
# 2) ホームフォルダに本スクリプト(BackFeed_6mm_jp.sh)とBackFeed_6mm.datをコピーしてください。
# 3) Finderから"Applications"-"Accessories"内のTerminalを起動し
#    "./BackFeed_6mm_jp.sh"と入力し、Enterキーを押してください。
#
lpr -o raw BackFeed_6mm.dat
#
#
# 参考:
# 利用されるTSP100IIUをデフォルトプリンタに設定できない場合には、
# 下記の操作を行ってください。
#
# 1) 以下のコマンドを使用し、プリンタキューの一覧と、現在のデフォルトプリンタの
#    キュー名が表示されます。
#
#    $ lpstat -p -d
#
#    実行結果例)
#       star-no-power-mac-g4:~ star$ lpstat -p -d       
#       printer TSP100IIU__STR_T_001_ is idle.  enabled since Jan 01 00:00
#       system default destination: TSP100IIU__STR_T_001_
#
#    上記の例の "TSP100IIU__STR_T_001_"がプリンタキュー名です。
#
# 2) 以下のコマンドを使用し、指定したプリンタキューに対し、設定を行います。
#    "Printer-queue"には、1)で表示されたプリンタキュー名から入力してください。
#
#    $ lpr -o raw BackFeed_6mm.dat -P "Printer-queue name"
#
#    実行例)
#       star-no-power-mac-g4:~ star$ lpr -o raw BackFeed_6mm.dat -P TSP100IIU__STR_T_001_
#
# 2010/02/19 Star Micronics co.,ltd.