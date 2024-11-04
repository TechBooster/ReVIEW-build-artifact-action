
# ReVIEW-build-artifact-action
PDF / EPUB / HTML building action due to Re:VIEW( and Review-Template Repository)
English is below.

## 2021年11月26日以降の実行でエラーがでたら

`TechBooster/ReVIEW-build-artifact-action@master` をRe:VIEW 5.3にアップデートしました。
引き続きRe:VIEW 4.0を使いたい場合、Actionsは `TechBooster/ReVIEW-build-artifact-action@master` のかわりに `TechBooster/ReVIEW-build-artifact-action@v0.9.0` を指定してください。 

## 概要

[Re:VIEW](https://github.com/kmuto/review)リポジトリをビルドしてPDFやEPUBを出力するための[GitHub Action](https://github.com/features/actions)です。

Re:VIEWファイルからPDFをビルドしてArtifactsとして保存できます。

このReVIEW-build-artifact-actionと[ReVIEW-Template](https://github.com/TechBooster/ReVIEW-Template)を使えば、簡単にRe:VIEWをビルドできるようになっています。もちろんRe:VIEWビルドができるリポジトリであればテンプレートを使っていなくても成果物を生成でき、PDFがダウンロードできます。

開発途中であるため、PDF/EPUB/HTMLのうち**PDF**での出力のみ対応しています。

＜動作イメージ図＞

## 利用方法
PDFなどの出力ファイルの生成は `.github/workflows/` にあるYAMLファイルで設定します。TechBoosterの[ReVIEW-Template](https://github.com/TechBooster/ReVIEW-Template/)にある[.github/workflows/on_push.yml](https://github.com/TechBooster/ReVIEW-Template/blob/master/.github/workflows/on_push.yml)は実際に動作している設定なのでやりたいことの参考になるはずです。

### PDFをビルドしてArtifactsとしてアップロードする（Re:VIEW-Templateの場合）

```yaml
name: Build Re:VIEW to make distribution file
# The workflow is triggered on pushes to the repository.
on: [push]

jobs:
  build:
    name: 
    runs-on: ubuntu-latest
    steps:

    # GitHubリポジトリの内容をActionsで利用するDocker上にチェックアウト
    # https://github.com/actions/checkout はGitHub公式Actionです。
    - name: checkout source
      uses: actions/checkout@v2

    # Re:VIEWファイルをビルドする
    - name: Build distribution file
      uses: TechBooster/ReVIEW-build-artifact-action@master

    # 生成したPDFファイルをアップロードする
    - name: Upload distribution file to github artifacts
      uses: actions/upload-artifact@v2
      with:
        name: Output documents
        path: ./articles/*.pdf
```

### PDFをビルドしてArtifactsとしてアップロードする（Re:VIEW-Templateを使っていない場合）


TODO


### 設定できるパラメータ

設定できるパラメータは次の３つで、いずれも省略可能です（必須ではありません）。現時点では `target_dir` 以外のパラメータをサポートしていません。

|  パラメータ  |  説明  | 利用例 |
| :---- | :---- | :---- |
|  `target_dir`  |  ビルド対象があるディレクトリ（未指定の場合は `./` を利用する） | あとで書く | 
|  `config_file`  |  Configファイル名を指定する（未指定の場合は `config.yml` を利用する） | あとで書く |
| `format` | 出力フォーマットを（PDF,EPUB,HTML）から指定 | 未サポート。今後実装されます |
