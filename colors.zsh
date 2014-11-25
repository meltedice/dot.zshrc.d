# -*- coding: utf-8 -*-


## terminal configuration
#
#LSCOLORS  is for : BSD : ?
#LS_COLORS is for : GNU : Ubuntu / emacs
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  ## set BackSpace control character
  #stty erase
  ;;
cons25)
  #unset LANG
  #export LSCOLORS=ExFxCxdxBxegedabagacad
  #export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  #zstyle ':completion:*' list-colors \
  #  'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
dumb)
  ## for emacs shell-mode
  #export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  export  LS_COLORS='di=01:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  ;;
esac

case "${TERM}" in
kterm*|xterm*)
  # this doesn't work 
  #export LSCOLORS=exfxcxdxbxegedabagacad
  # this works but no expected one
  #export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  #export  LS_COLORS='di=1;94:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  export  LS_COLORS='di=1;94:ln=1;96:so=32:pi=33:ex=31:bd=33:cd=1;33:su=41;30:sg=46;30:tw=1;31:ow=43;30'
  #zstyle ':completion:*' list-colors \
  #  'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac



## PROMPT colors
# 0   to restore default color
# 1   for brighter colors
# 4   for underlined text
# 5   for flashing text
# 30  for black foreground
# 31  for red foreground
# 32  for green foreground
# 33  for yellow (or brown) foreground
# 34  for blue foreground
# 35  for purple foreground
# 36  for cyan foreground
# 37  for white (or gray) foreground
# 40  for black background
# 41  for red background
# 42  for green background
# 43  for yellow (or brown) background
# 44  for blue background
# 45  for purple background
# 46  for cyan background
# 47  for white (or gray) background
#
## sample
#
#local GREEN=$'%{\e[1;32m%}'
#local BLUE=$'%{\e[1;34m%}'
#local DEFAULT=$'%{\e[1;m%}'
#
#PROMPT=$BLUE'[${USER}@${HOSTNAME}] %(!.#.$) '$DEFAULT
#PROMPT=$GREEN'[%~]'$DEFAULT
#setopt PROMPT_SUBST




#LSCOLORS  for BSD ls
#ex:
#  export LSCOLORS=ExFxCxdxBxegedabagacad
#setting order:
#  directory symboliclink socket fifo executable block-special setuid-executable setgid-executable other-dirctory-with-stickybit other-dirctory-without-sticybit
#  --
#  01: ディレクトリ前景色
#  02: ディレクトリ背景色
#  03: シンボリックリンク前景色
#  04: シンボリックリンク背景色
#  05: ソケットファイル前景色
#  06: ソケットファイル背景色
#  07: FIFOファイル前景色
#  08: FIFOファイル背景色
#  09: 実行ファイル前景色
#  10: 実行ファイル背景色
#  11: ブロックスペシャルファイル前景色
#  12: ブロックスペシャルファイル背景色
#  13: キャラクタスペシャルファイル前景色
#  14: キャラクタスペシャルファイル背景色
#  15: setuidつき実行ファイル前景色
#  16: setuidつき実行ファイル背景色
#  17: setgidつき実行ファイル前景色
#  18: setgidつき実行ファイル背景色
#  19: スティッキビットありother書き込み権限つきディレクトリ前景色
#  20: スティッキビットありother書き込み権限つきディレクトリ背景色
#  21: スティッキビットなしother書き込み権限つきディレクトリ前景色
#  22: スティッキビットなしother書き込み権限つきディレクトリ背景色
#color and effect:
#  a: 黒 black
#  b: 赤 red
#  c: 緑 green
#  d: 茶 brown
#  e: 青 blue
#  f: マゼンタ mazenda
#  g: シアン cyan
#  h: 白 white
#  A: 黒(太字)
#  B: 赤(太字)
#  C: 緑(太字)
#  D: 茶(太字)
#  E: 青(太字)
#  F: マゼンタ(太字)
#  G: シアン(太字)
#  H: 白(太字)
#  x: デフォルト色 default


#LS_COLORS for GNU ls
#ex:
#  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#settings:
#  di  directory
#  ln  symboliclink
#  so  socket
#  ex  executable
#  bd  block special
#  cd  charactor special
#  su  setuid executable
#  tw  other dirctory with stickybit
#  ow  other dirctory without sticybit
#default settings:
#  no   0      Normal (non-filename) text
#  fi   0      Regular file
#  di   01;34  Directory
#  ln   01;36  Symbolic link
#  pi   33     Named pipe (FIFO)
#  so   01;35  Socket
#  do   01;35  Door
#  bd   01;33  Block device
#  cd   01;32  Character device
#  ex   01;32  Executable file
#  mi   (none) Missing file (defaults to fi)
#  or   (none) Orphaned symbolic link (defaults to ln)
#  lc   ^[[    Left code
#  rc   m      Right code
#  ec   (none) End code (replaces lc+no+rc)
# --
#  di: ディレクトリ
#  ln: シンボリックリンク
#  so: ソケットファイル
#  pi: FIFOファイル
#  ex: 実行ファイル
#  bd: ブロックスペシャルファイル
#  cd: キャラクタスペシャルファイル
#  su: setuidつき実行ファイル
#  sg: setgidつき実行ファイル
#  tw: スティッキビットありother書き込み権限つきディレクトリ
#  ow: スティッキビットなしother書き込み権限つきディレクトリ
#ext:
#  "*.c=34"  :  can change color for c source file
#color and effect:
#   0  Default Colour
#   1  Bold
#   4  Underlined
#   5  Flashing Text
#   7  Reverse Field
#  31  Red
#  32  Green
#  33  Orange
#  34  Blue
#  35  Purple
#  36  Cyan
#  37  Grey
#  40  Black Background
#  41  Red Background
#  42  Green Background
#  43  Orange Background
#  44  Blue Background
#  45  Purple Background
#  46  Cyan Background
#  47  Grey Background
#  90  Dark Grey
#  91  Light Red
#  92  Light Green
#  93  Yellow
#  94  Light Blue
#  95  Light Purple
#  96  Turquoise
# 100  Dark Grey Background
# 101  Light Red Background
# 102  Light Green Background
# 103  Yellow Background
# 104  Light Blue Background
# 105  Light Purple Background
# 106  Turquoise Background 
# --
#  00: なにもしない
#  01: 太字化
#  04: 下線
#  05: 点滅
#  07: 前背色反転
#  08: 表示しない
#  22: ノーマル化
#  24: 下線なし
#  25: 点滅なし
#  27: 前背色反転なし
#  30: 黒(前景色)
#  31: 赤(前景色)
#  32: 緑(前景色)
#  33: 茶(前景色)
#  34: 青(前景色)
#  35: マゼンタ(前景色)
#  36: シアン(前景色)
#  37: 白(前景色)
#  39: デフォルト(前景色)
#  40: 黒(背景色)
#  41: 赤(背景色)
#  42: 緑(背景色)
#  43: 茶(背景色)
#  44: 青(背景色)
#  45: マゼンタ(背景色)
#  46: シアン(背景色)
#  47: 白(背景色)
#  49: デフォルト(背景色)
