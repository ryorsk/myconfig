#!/bin/sh
# config/ 以下のドットファイルを $HOME にシンボリックリンクする。
# macOS (BSD ln) / Linux (GNU coreutils, uutils coreutils) のどちらでも動くよう、
# ln は POSIX で定義された -s だけを使う（-F は BSD 独自で Linux には無い）。
set -eu

repo_dir=$(cd "$(dirname "$0")" && pwd)
config_dir="$repo_dir/config"

git -C "$repo_dir" pull --ff-only origin main || echo "warning: git pull に失敗しました。手元の内容でリンクします" >&2

for src in "$config_dir"/.[!.]* "$config_dir"/..?*; do
    [ -e "$src" ] || continue
    name=$(basename "$src")
    case $name in
        *.elc|.git|.DS_Store) continue ;;
    esac
    dest="$HOME/$name"

    # 既にこのリポジトリへのリンクなら何もしない
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "skip:   $dest (リンク済み)"
        continue
    fi

    # 既存のファイル・リンクは上書きせずバックアップする
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
        mv "$dest" "$backup"
        echo "backup: $dest -> $backup"
    fi

    ln -s "$src" "$dest"
    echo "link:   $dest -> $src"
done
