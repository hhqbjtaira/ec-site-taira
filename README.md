# 通販サイト ポートフォリオ
***
## URL
https://ec-1-14.herokuapp.com
***
## ログイン方法
* ゲストログインからログインできます
* 会員登録をするとログインできます
## 概要
* 通販サイトです
* 家具や文房具の購入のためのミュレーションができるサイトです
* 実際に決済を行う事はできません
## 工夫した点
1. 商品検索画面でカテゴリでの検索、キーワードのみでの検索、またはその両方で検索ができるように工夫しました。
2. 会員登録をしなくても見やすいようにゲストログイン機能をつけました
## 画面紹介
* 商品検索画面
<img width="1236" alt="スクリーンショット 2022-01-19 8 05 14" src="https://user-images.githubusercontent.com/89443713/150032971-b1577451-1320-4f06-af53-abed6dff7482.png">
## 設計
* ER図
<img width="1401" alt="スクリーンショット 2022-01-19 8 14 13" src="https://user-images.githubusercontent.com/89443713/150033876-66dc41a2-81fc-43c7-9349-9bc21bcedc80.png">

## 機能
* 商品検索画面(検索ロジック)
* HerokuとCarrierWaveを連携
* ユーザーにプロフィール画像を設定
* ゲストログイン
* 認可処理機能
* ログイン、ログアウト処理
* ログイン画面
* ユーザー情報修正画面
* ユーザー情報画面
* ユーザー情報更新
* TOPページ画面
* ユーザー退会
* 商品詳細画面
* Seed User関連
* 注文詳細画面
* ユーザー登録画面、登録処理
* カート機能
* 注文履歴
* 注文キャンセル機能
* DB構築 Migration Products関連
* DB構築 Migration ユーザー関連
* DB構築 Migration 注文関連
* Validation User関連
* セキュアなパスワード実装
* Linter導入
* Linter警告文の対処
* Bootstrap導入
* htmlファイルの共通化
* エラーメッセージの表示
* エラーメッセージの日本語化
* ヘッダー修正
* テストデータ作成
  * Order Model Spec
  * Static Pages Controller Request Spec

## 改善、気になっている点
* 見た目の改善の必要性
* リファクタリングが不十分
* テストが少ない(Rspec)
## 技術・環境

* フロントエンド
** Bootstrap '~> 5.0.2'
  * SCSS

* バックエンド
  * Ruby '2.7.1'
  * Rails '~> 6.0.4', '>= 6.0.4.1'

* インフラ
  * heroku
  * MySQL2 '>= 0.4.4'
  * AWS(S3)

* 開発環境
  * Docker
