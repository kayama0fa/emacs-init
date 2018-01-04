# emacs-init

my emacs init.el, inits/, Cask, etc.

## TODO

* emacsの設定整理
    * caskの導入
    * 設定ファイルの分割
    * GitHubに登録、管理
    * .emacsを.emacs.d/init.elに移動
    * .emacs持って帰って、うちで作業かなぁ
    * GitHubの使い方忘れたので、それの再勉強

## 構成

```
~/.emacs.d/
    init.el         --- 親となる設定ファイル
    inits/          --- 分割した設定ファイルの入れ場所
    Cask            --- cask定義ファイル
    .cask/          --- caskロードファイル
```

上記のファイルのうち、 init.el, inits/, Caskがバージョン管理対象
