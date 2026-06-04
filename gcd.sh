#!/bin/sh
if [ $# -ne 2 ]; then   # 引数の数が2でない場合(not equal)
  echo "input 2 argments" 1>&2  # エラーメッセージ
  exit 1    # 終了ステータス
fi
expr $1 + $2 > /dev/null 2>&1  # exprに数字以外を渡すと終了ステータスが2以上になる
if [ $? -ge 2 ]; then   # その場合
  echo "input natural number" 1>&2 # エラーメッセージ
  exit 1    # 終了ステータス
fi
if [ "$1" -le 0 -o "$2" -le 0 ]; then
  echo "input natural number" 1>&2 # エラーメッセージ
  exit 1    # 終了ステータ
fi

a=$1
b=$2

while [ "$b" -ne "0" ];
do 
	p=$(( a % b ))
	a=$b
	b=$p
done

echo "gcd of $1 and $2 is $a" 

