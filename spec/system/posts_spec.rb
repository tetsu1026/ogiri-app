require 'rails_helper'

RSpec.describe "出題する", type: :system do
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

  context "お題投稿ができない時" do
    it "ログインしていないと出題ページに遷移できない" do
    # トップページに遷移する
    visit root_path
    # 出題ページへのリンクがない
    expect(page).to have_no_content("出題する")
    end
  end
end

RSpec.describe "編集する", type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end
  context "お題が編集できる時" do
    it "ログインしたユーザーは自分が投稿したお題を編集できる" do
    # 投稿1のユーザーでログインする
    visit new_user_session_path
    fill_in "メールアドレス", with: @post1.user.email
    fill_in "パスワード（半角英数混合6文字以上）", with: @post1.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 投稿1のお題詳細ページに遷移する
    visit post_path(@post1)
    # 投稿1に編集ボタンがあることを確認する
    expect(page).to have_content("編集する")
    # 編集ページに遷移する
    visit edit_post_path(@post1)
    # すでに投稿済みの内容がフォームに入っているか確認する
    expect(
      find('#post_genre_id').value
    ).to eq"#{@post1.genre_id}"
    expect(
      find('#post_title').value
    ).to eq(@post1.title)
    expect(
      find('#post_sentence').value
    ).to eq(@post1.sentence)
    # 投稿内容を編集する
    fill_in "post[title]", with: "#{@post1.title}+編集したタイトル"
    fill_in "post[sentence]", with: "#{@post1.sentence}+編集した投稿者の回答"
    # 編集してもPostカウントが変わらないことを確認
    expect {
      find('input[name="commit"]') .click
    }.to change { Post.count }.by(0)
    # お題詳細ページに遷移したことを確認
    visit post_path(@post1)
    # 先ほどの変更内容があるか確認
    expect(page).to have_content("#{@post1.title}+編集したタイトル")
    expect(page).to have_content("#{@post1.sentence}+編集した投稿者の回答")
    end
  end
end