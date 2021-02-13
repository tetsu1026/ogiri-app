require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context "新規登録" do
    describe "新規登録できる時" do
      it "正しい情報が登録できれば新規登録ができてトップページに遷移する" do
        # トップページに移動する
        visit root_path
        # トップページに新規登録へ遷移のボタンがあることを確認する
        expect(page).to have_content("新規登録")
        # 新規登録ページへ移動する
        visit new_user_registration_path
        # ユーザー情報を入力する
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード（半角英数混合6文字以上）", with: @user.password, match: :first
        fill_in "パスワード再入力", with: @user.password_confirmation, match: :first
        image_path = Rails.root.join("public/images/test_image.png")
        attach_file("user[image]", image_path, make_visible: true)
        fill_in "nickname", with: @user.nickname
        fill_in "プロフィール（自分を一言で表現してください）", with: @user.profile
        # 新規登録ボタンをクリックするとユーザーカウントが1上がる
        expect{
          find('input[name="commit"]').click
        }.to change { User.count }.by(1)
        # トップページへ遷移したことを確認する
        expect(current_path).to eq(root_path)
        # トップページに新規登録ボタンやログインボタンがないことを確認する
        expect(page).to have_no_content("ログイン")
        expect(page).to have_no_content("新規登録")
      end
    end
     
    context "新規登録できない時" do
      it "誤った情報では登録できないで新規登録ページに戻ってくる" do
        # トップページに移動する
        visit root_path
        # トップページに新規登録ボタンがあることを確認する
        expect(page).to have_content("新規登録")
        # 新規登録ページに移動する
        visit new_user_registration_path
        # ユーザー情報を登録する
        fill_in "メールアドレス", with: ""
        fill_in "パスワード（半角英数混合6文字以上）", with: "", match: :first
        fill_in "パスワード再入力", with: "", match: :first
        fill_in "nickname", with: ""
        fill_in "プロフィール（自分を一言で表現してください）", with: ""
        # 新規登録ボタンをクリックするとユーザーカウントが上がらないことを確認する
        expect{
          find('input[name="commit"]').click
        }.to change { User.count }.by(0)
        # 新規登録ページに戻されることを確認する
        expect(current_path).to eq('/users')
      end
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "ログインができる時" do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページに遷移する
      visit new_user_session_path
      # 正しい情報を入力する
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード（半角英数混合6文字以上）", with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページに、ログアウトボタンと出題するボタンがあることを確認する
      expect(page).to have_content("ログアウト")
      expect(page).to have_content("出題する")
      # トップページに新規登録ボタンやログインボタンがないことを確認する
      expect(page).to have_no_content("ログイン")
      expect(page).to have_no_content("新規登録")
    end
  end
end
