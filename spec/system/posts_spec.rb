require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end

  context "お題が投稿できる時" do
    it "ログインしたユーザーは投稿できる" do
    # ログインする
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード（半角英数混合6文字以上）", with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # トップページに出題するボタンがあることを確認する
    expect(page).to have_content("出題する")
    # お題投稿ページに遷移する
    visit new_post_path
    # フォームを入力する
    select '文章問題', from: 'post[genre_id]'
    fill_in 'post[title]', with: @post.title
    fill_in 'post[sentence]', with: @post.sentence
    # 出題するボタンをクリックするとPostモデルのカウントが1つ上がる
    expect {
      find('input[name="commit"]') .click
    }.to change { Post.count }.by(1)
    # トップページへ遷移したことを確認する
    visit root_path
    # トップページに先ほどのお題が投稿されているか確認する
    expect(page).to have_content(@post.title)
    end
  end
end
