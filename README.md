# README

# Meshitero
<!-- ![meshitero](.images/logo.png) -->

## :fork_and_knife: Description
  - Meshitero(飯テロ)
  - This app is a posting site dedicated to gourmet images. Whether you work in a restaurant or a gourmet lover, why not promote the charm of the restaurant with a single image?(このアプリはグルメ画像専用の投稿サイトです。レストランで働くあなた、またはグルメ好きなあなたが、1枚の画像でお店の魅力をPRしてみませんか？)

## :globe_with_meridians: URL

## :key: Accounts 

## :hand: Usage
  - First, create a user account. If you work at a restaurant, don't forget to enter the restaurant information.（まずはユーザーアカウントを作成してください。レストランで働いている方はレストラン情報の入力もお忘れなく。）
  - You can browse the contents posted by other users on the top page. (TOPページでは他のユーザーが投稿した内容を閲覧することができます。)
  - You can move to the post details page by clicking the posted image and leave a comment. (投稿された画像をクリックすると投稿詳細ページに遷移でき、コメントを残すことができます。)
  - Click the post button to move to the new post form. Please enter the image, comment and tag information. (投稿ボタンをクリックすると、新規投稿フォームに遷移します。画像とコメント、タグの情報を入力してください。)

## :bulb: Solution
  - The purpose of this app is to increase the number of fans in your restaurants without using coupons or discount plans. By communicating the charm of the restaurant with a single image, you can promote the restaurant without someone's ratings and reviews.(クーポンや割引プランを使わずにお店のファンを増やすこと、それがこのアプリの目的です。レストランの魅力を1枚の料理画像で伝えることで、口コミや評価に頼ることなくレストランをPRできます。)

## :page_facing_up: Requirements

  |機能|理由|詳細|
  |:---|:---|:---|
  |新規投稿機能|ユーザーが画像とテキストを投稿することができるようにするため|ログイン状態のユーザーは画像とテキストを新たに投稿することができる|
  |新規投稿画像プレビュー機能|新規投稿する際に画像のプレビュー表示をして投稿した画像の確認ができるようにするため|ログイン状態のユーザーは画像を投稿する際に自分が選択した画像が正しいかどうかをプレビュー表示で確認することができる|
  |投稿一覧表示機能|ユーザーが投稿された画像とテキストを一覧で表示できるようにするため|ログイン状態に関わらず、投稿された画像とテキストが一覧で閲覧できる|
  |投稿内容詳細閲覧機能|ユーザーが投稿されている内容の詳細を閲覧できるようにするため。自分が投稿した内容は編集と削除のアクションをできるようにするため。|ログイン状態のユーザーは全ての投稿の詳細ページを閲覧することができる|
  |投稿編集機能|ユーザーが投稿した内容を更新できるようにするため|ログイン状態のユーザーは自分が投稿した内容のみ編集することができる|
  |投稿削除機能|ユーザーが投稿した内容を削除できるようにするため|ログイン状態のユーザーは自分が投稿した内容のみ削除することができる|
  |同じタグが紐づいている投稿の一覧表示機能|同じタグがついている投稿の一覧を表示するため|同じタグがついている投稿の一覧を表示することで、ユーザーの好きなタグがついている投稿を一覧で表示させることができる|

## :hourglass: Requirements(unimplemented)※今後実装予定の機能です
  |ユーザー登録機能|トップページ閲覧以外のアクションを行うためにはユーザー情報登録を必須にするため|ユーザーのニックネーム、メールアドレス、パスワード、レストラン名（任意）、レストランの住所（任意）、レストランの電話番号（任意）を登録できるようにする|
  |ユーザーログイン機能|ログインしているユーザーのみ投稿・編集・削除を有効にするため|登録済みのユーザーはメールアドレスとパスワードを入力すればログインできるようにする|
  |マイページ表示機能|ユーザーが自分が投稿した内容を一覧で閲覧できるようにするため|ログイン状態のユーザーは自分が投稿した内容が確認できるマイページを閲覧することができる|
  |ユーザー情報編集機能|ユーザーが自分が登録したニックネーム、メールアドレス、パスワード、レストラン名（任意）、レストランの住所（任意）、レストランの電話番号（任意）の内容を変更できるようにするため|マイページを閲覧しているユーザーは自分が登録した内容を変更することができる|
  |コメント投稿機能|ユーザーが自分の投稿や他のユーザーの投稿に対してコメントをつけられるようにするため|投稿詳細ページで投稿の下部にコメント入力フォームを設置し、誰がコメントしたかが分かるようにする|
  |エラーメッセージを日本語化する|エラーの原因をユーザーに分かりやすく表示するため|新規投稿/ログイン/サインアップ画面で誤った情報を入力したときは日本語でエラーメッセージが表示される|

## :wrench: Functions

<!-- ![タグ付け機能]() -->

## :package: Database

### tweets テーブル
| Column   | Type  | Options     |
| -------- | ----- | ----------- |
| message  | text  | null: false |
| hashname | text  | null: false |

### Association
  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tags, through: :tweet_tag_relations
  has_one_attached :image

### tags テーブル
| Column   | Type   | Options                       |
| -------- | ------ | ----------------------------- |
| name     | string | null: false, uniqueness: true |

### Association
  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tweets, through: :tweet_tag_relations

### tweet_tag_relations テーブル
| Column   | Type       | Options                        |
| -------- | ---------  | ------------------------------ |
| tweet    | references | null: false, foreign_key: true |
| tag      | references | null: false, foreign_key: true |

### Association
  belongs_to :tweet
  belongs_to :tag

## :mag: Install

  % git clone https://github.com/yuka-sakamaki/meshitero.git

## :books: Version
- Ruby/Ruby on Rails/JavaScript/MySQL/Github/AWS/Visual Studio Code
* ruby 2.6.5
* Rails 6.0.3.4
* gem 3.0.3
* git version 2.24.3
* mysql  Ver 14.14 Distrib 5.6.50










  