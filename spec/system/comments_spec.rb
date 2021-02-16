require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
   @post = FactoryBot.create(:post)
   @post.image = nil
   @comment = Faker::Lorem.sentence
  end

  it "ログインしたユーザーはお題詳細ページから回答できる" do
    # ログインする
    visit new_user_session_path
    fill_in "メールアドレス", with: @post.user.email
    fill_in "パスワード（半角英数混合6文字以上）", with: @post.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # お題詳細ページに遷移する
    visit post_path(@post)
    # フォームにメッセージを入力する
    fill_in "comment_message" , with: @comment
    # 回答を送信するとコメントモデルのカウントが1つ上がる
    expect{
      find('input[name="commit"]').click
    }.to change {Comment.count}.by(1)
    # 詳細ページにリダイレクトされることを確認
    expect(current_path).to eq(post_path(@post))
    # 詳細ページに先ほどの回答があったことを確認
    expect(page).to have_content @comment
  end
end
