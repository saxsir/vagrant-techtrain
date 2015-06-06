vagrant-techtrain
=================

## 目的
- リモートサーバーのテスト
- 同じ環境の仮想マシンをローカルに作成

## 使い方

### リモートサーバーのセットアップ
1. rootログイン
2. リポジトリをクローン
3. puppetマニフェストを適用    # rootログインはできなくなるので、接続を切る前にsshできるか確認する

### ローカル開発環境のセットアップ
1. リポジトリをクローン
2. vagrant up

### サーバーのテスト

#### 仮想マシンのテスト

    # 各サーバーに公開鍵ログインできるようにしておく

    $ cat ~/.ssh/config
```
# 手元の設定を晒すとこんな感じ
Host app.tech-train
  HostName 192.168.56.121
  User techtrain
  IdentityFile ~/.ssh/id_rsa_techtrain
Host ci.tech-train
  HostName 192.168.56.122
  User techtrain
  IdentityFile ~/.ssh/id_rsa_techtrain
```

    $ cp config.sample.yml config.yml
    $ vim config.yml

```
:local_hosts:
  - :name: app.tech-train
    :roles:
      - app
  - :name: ci.tech-train
    :roles:
      - app
      - ci
```

    $ bundle exec rake spec

#### リモート環境のテスト

    # 公開鍵でログインできるように設定しておく
    $ vim config.yml
    $ bundle exec rake spec_remote
