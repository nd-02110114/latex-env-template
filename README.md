# latex-env-template

Latexを書く環境のテンプレート

## メモ

### Docker

```bash
$ cd .devcontainer
$ docker build . -t nd02110114/latex-env-template
$ docker push nd02110114/latex-env-template
```

### Lint

`lint` ディレクトリにサンプルの設定ファイルなどをおいてある。英語の場合は、`lint/en`を参考に修正する。

```bash
$ npm install
$ npm run lint
```
