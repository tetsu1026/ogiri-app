require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
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
    
    end
  end
end
