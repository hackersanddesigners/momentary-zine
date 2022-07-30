#!/bin/sh
#
# TSP650/TSP700II Linux設定用スクリプト
#
# このスクリプトを用いると、TSP650/TSP700IIのメモリスイッチを
# Linuxでの利用に合わせた設定に変更できます。
#
# 利用方法:
#
# 1) TSP650, TSP700IIをデフォルトプリンタにしてください。
# 2) ホームフォルダに本スクリプト(setup_for_linux_jp.sh)とlinux.datをコピーしてください。
# 3) Terminalを起動し "./setup_for_linux_jp.sh"と入力し、Enterキーを押してください。
# 4) 実行後、プリンタが自己印字を行います。
#    印刷結果の"-- Memory Switch --"の中で、 <C>行の左から三番目が
#    1となっていることを確認してください。
#    
#    例)
#        <C> 0010000000000000 0200
#
lpr -o raw linux.dat
#
#
# 参考:
# 利用されるTSP650/TSP700IIをデフォルトプリンタに設定できない場合には、
# 下記の操作を行ってください。
#
# 1) 以下のコマンドを使用し、プリンタキューの一覧と、現在のデフォルトプリンタの
#    キュー名が表示されます。
#
#    $ lpstat -p -d
#
#    実行結果例)
#       star-no-power-mac-g4:~ star$ lpstat -p -d       
#       printer TSP651__STR_T_001_ is idle.  enabled since Jan 01 00:00
#       printer TSP743II__STR_T_001_ is idle.  enabled since Jan 01 00:00
#       system default destination: TSP743II__STR_T_001_
#
#    上記の例の "TSP651__STR_T_001_"、"TSP743II_STR_T_001_" がプリンタキュー名です。
#
# 2) 以下のコマンドを使用し、指定したプリンタキューに対し、設定を行います。
#    "Printer-queue"には、1)で表示されたプリンタキュー名から入力してください。
#
#    $ lpr -o raw linux.dat -P "Printer-queue name"
#
#    実行例)
#       star-no-power-mac-g4:~ star$ lpr -o raw linux.dat -P TSP651__STR_T_001_
#
# 2008/03/27 Star Micronics co.,ltd.