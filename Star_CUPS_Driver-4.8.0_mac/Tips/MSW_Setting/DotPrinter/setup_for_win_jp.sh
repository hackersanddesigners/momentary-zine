#!/bin/sh
#
# SP700 Windows設定用スクリプト
#
# このスクリプトを用いると、SP700のメモリスイッチを
# Windowsでの利用に合わせた設定に変更できます。
#
# 利用方法:
#
# 1) SP700をデフォルトプリンタにしてください。
# 2) ホームフォルダに本スクリプト(setup_for_win_jp.sh)とwin.datをコピーしてください。
# 3) Finderから"Applications"-"Utilities"内のTerminalを起動し
#    "./setup_for_win.sh"と入力し、Enterキーを押してください。
# 4) 実行後、プリンタが自己印字を行います。
#    印刷結果の"-- Memory Switch --"の中で、 <4>行の左から8番目と9番目が
#    0となっているか、<4>の行が存在しないことを確認してください。
#    
#    例)
#        <4> 0000000000000000 0000
#
lpr -o raw Enable.dat
#
#
# 参考:
# 利用されるSP700をデフォルトプリンタに設定できない場合には、
# 下記の操作を行ってください。
#
# 1) 以下のコマンドにより、プリンタキューの一覧と、現在のデフォルトプリンタの
#    キュー名が表示されます。
#
#    $ lpstat -p -d
#
#    実行結果例)
#       star-no-power-mac-g4:‾ star$ lpstat -p -d       
#       printer Star_SP712__STR_001_ is idle.  enabled since Jan 01 00:00
#       system default destination: TSP743II__STR_T_001_
#
#    上記の例の "Star_SP712__STR_001_" がプリンタキュー名です。
#
# 2) 以下のコマンドにより、指定したプリンタキューに対し、設定を行います。
#    "Printer-queue"には、1)で表示されたプリンタキュー名から入力してください。
#
#    $ lpr -o raw Enable.dat -P "Printer-queue name"
#
#    実行例)
#       star-no-power-mac-g4:‾ star$ lpr -o raw Enable.dat -P Star_SP712__STR_001_
#
# 2016/05/20 Star Micronics co.,ltd.