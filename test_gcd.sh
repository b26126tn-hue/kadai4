#!/bin/sh
tmp=/tmp/$$
echo "input 2 argments" > $tmp-args 
echo "input natural number" > $tmp-nat  
ERROR_EXIT () {
echo "$1" >&2   
rm -f $tmp-*   
exit 1   
}


# テスト開始
# test1: 引数の数が足りない
./gcd.sh 2> $tmp-ans && ERROR_EXIT "error in test1-1" # エラーメッセージを関数に渡す
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test1-2"
# test2: 文字または整数でない入力
./gcd.sh abc 5 2> $tmp-ans && ERROR_EXIT "error in test2-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-2"
./gcd.sh 3.14 5 2> $tmp-ans && ERROR_EXIT "error in test2-3"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-4"

# test3: 0または負の値の入力
./gcd.sh 0 5 2> $tmp-ans && ERROR_EXIT "error in test3-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test3-2"
./gcd.sh -3 5 2> $tmp-ans && ERROR_EXIT "error in test3-3"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test3-4"

echo "All tests passed."
