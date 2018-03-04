# Concourse勉強会用リポジトリ

## Concourse

Mac, LinuxにDocker-CE等がインストール済み

### 起動

dockerバージョンの場合/etc/hostsに以下を追記しておく

```
127.0.0.1 concourse-web
```

以下で起動

```sh
$ cd path/to/project
$ ./setup.sh #key生成
$ docker-compose up # -d optionだと何故かworkerが起動しない。。
```

Web UIよりflyバイナリをダウンロードして、
```sh
$ sudo mv /Downloads/fly
$ sudo chmod 0755 /usr/local/bin/fly
```

## flyコマンド

#### login

```sh
$ fly --target learning login --concourse-url http://localhost:8080
```

起動したConcourseへの認証とエイリアスの設定。

以後、```--target （-t）learning```はこのConcourseに対して何かする場合は必須になります。

#### set-pipeline

```sh
$ fly -t learning set-pipeline -p hello-world -c ./pipelines/hello.yml
```
