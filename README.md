# コーヒーメモアプリ  
<br>
<br>
Ruby on Rails チュートリアルに沿って作成中  
<br>
<br>
<br>

## 制作背景・目的  
<br>
自分が自宅でコーヒを飲むことが多く、今までに飲んだコーヒ豆をわかりやすく記録したいと思ったこと。  
<br>
<br>
さらに他の人がどんな豆を飲んでいるのか知りたい、同じ思いの人いるはずだと思い、作成に至りました。  
<br>
<br>
新たなコミュニティの作成が目的です。  
<br>
<br>
<br>

## アプリケーション概要  
<br>
<br>
_コーヒー豆メモアプリにあるような機能を投稿として記録できる_ アプリケーション。  
イメージ画像  
<img width="400" alt="トップページ" src="https://github.com/Juniquey/my_app/assets/107200906/41cd7502-0dac-439e-87a4-38618fdd744c">  
<br>
<br>
商品名・煎り度・豆の産地などを記録できる。  
イメージ画像  
<img width="400" alt="投稿ページ" src="https://github.com/Juniquey/my_app/assets/107200906/b176f33c-69ef-4166-be01-2c1559ba5fa3">  
<br>
<br>
投稿詳細ページ  
イメージ画像  
<img width="400" alt="投稿詳細ページ" src="https://github.com/Juniquey/my_app/assets/107200906/14004912-6576-4a02-82d9-a7abace2e27a">  
<br>
<br>
<br>

## 開発環境  
<br>
* Visual Studio Code  
<br>
* バックエンド　Ruby 3.1.4
* フレームワーク　Ruby on Rails 7.0.4
* フロントエンド　HTML/scss/JavaScript/Bootstrap
* デプロイ　render(未完成のため停止中)
<br>
<br>
<br>

実装予定
* MySQL
* Docker
* AWS
* CircleCI
<br>
<br>
<br>

## 工夫した点
<br>
完成後に記入します。
<br>
<br>

## 苦労した点
<br>
完成後に記入します。
<br>
<br>
<br>

## 今後の目標・実装予定  
<br>

### 目標  
UU _1000_ 人  
<br>
<br>

### 実装予定  
<br>
アプリ機能  
* PDF出力(未定)
* カフェ検索カテゴリー
* コーヒー器具投稿カテゴリー
* コラムカテゴリー
etc.  
<br>
<br>
今後導入したい環境
* CircleCI(CI/CDパイプライン)の導入
コードがpushされるたびにテストが自動的に実行されるようにして、mainブランチにコードがマージされた際にはrenderにデプロイが実行されるように設定する  
* Dockerの導入
開発環境でDockerとdocker-composeを導入してみる  
* インフラにAWSを使用(デプロイ)
インフラをrenderからAWSに変更する（EC2やS3やRDS等を導入する。独自ドメインや常時SSL化にも対応する）  
