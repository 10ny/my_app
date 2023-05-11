# コーヒーメモアプリ  
Ruby on Rails チュートリアルに沿って作成中  



## 制作背景・目的  

自分が自宅でコーヒを飲むことが多く、今までに飲んだコーヒ豆をわかりやすく記録したいと思ったこと。  

さらに他の人がどんな豆を飲んでいるのか知りたい、同じ思いの人いるはずだと思い、作成に至りました。  

新たなコミュニティの作成が目的です。  



## アプリケーション概要  

_コーヒー豆メモアプリにあるような機能を投稿として記録できる_ アプリケーション。  
イメージ画像  
<img width="400" alt="トップページ" src="https://github.com/Juniquey/my_app/assets/107200906/41cd7502-0dac-439e-87a4-38618fdd744c">  

商品名・煎り度・豆の産地などを記録できる。  
イメージ画像  
<img width="400" alt="投稿ページ" src="https://github.com/Juniquey/my_app/assets/107200906/b176f33c-69ef-4166-be01-2c1559ba5fa3">  

投稿詳細ページ  
イメージ画像  
<img width="400" alt="投稿詳細ページ" src="https://github.com/Juniquey/my_app/assets/107200906/c26b7536-3ccf-4698-ae44-122083bb4472">  



## 開発環境  

* Visual Studio Code  

* バックエンド　Ruby 3.1.4
* フレームワーク　Ruby on Rails 7.0.4
* フロントエンド　HTML/scss/JavaScript/Bootstrap
* デプロイ　render(未完成のため停止中)



実装予定
* MySQL
* Docker
* AWS
* CircleCI



## 工夫した点

完成後に記入します。


## 苦労した点

完成後に記入します。



## 今後の目標・実装予定  

### 目標  
UU _1000_ 人  


### 実装予定  

アプリ機能  
* PDF出力(未定)
* カフェ検索カテゴリー
* コーヒー器具投稿カテゴリー
* コラムカテゴリー
etc.  

今後導入したい環境
* CircleCI(CI/CDパイプライン)の導入
コードがpushされるたびにテストが自動的に実行されるようにして、mainブランチにコードがマージされた際にはrenderにデプロイが実行されるように設定する  
* Dockerの導入
開発環境でDockerとdocker-composeを導入してみる  
* インフラにAWSを使用(デプロイ)
インフラをrenderからAWSに変更する（EC2やS3やRDS等を導入する。独自ドメインや常時SSL化にも対応する）  
