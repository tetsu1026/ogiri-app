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
        # トップページにログアウトと出題するボタンがあることを確認する
        expect(page).to have_content("ログアウト")
        expect(page).to have_content("出題する")
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
  context "ログインできない時" do
    it '保存されているユーザーの情報と合致しないとログインができない' do
    # トップページに移動する
    visit root_path
    # トップページにログインボタンがあることを確認する
    expect(page).to have_content('ログイン')
    # ログインページに遷移する
    visit new_user_session_path
    # ユーザー情報を入力する
    fill_in "メールアドレス", with: ""
    fill_in "パスワード（半角英数混合6文字以上）", with: ""
    # ログインボタンを押す
    find('input[name="commit"]').click
    # ログインページへ戻されることを確認する
    expect(current_path).to eq("/users/sign_in") 
    end
  end
end

RSpec.describe "編集する", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  context "ユーザー情報が編集できる時" do
    it "ログインしたユーザーは自分のプロフィールを編集できる" do
    # ユーザー1でログインする
    visit new_user_session_path
    fill_in "メールアドレス", with: @user1.email
    fill_in "パスワード（半角英数混合6文字以上）", with: @user1.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # マイページに遷移する
    visit user_path(@user1)
    # マイページに編集するボタンがあることを確認する
    expect(page).to have_content("ユーザー情報編集")
    # 編集ページに遷移する
    visit edit_user_registration_path(@user1)
    # すでにユーザー情報が入っているかを確認する
    expect(
      find('#user_email').value
    ).to eq"#{@user1.email}"
    expect(
      find('#user_nickname').value
    ).to eq(@user1.nickname)
    expect(
      find('#user_profile').value
    ).to eq(@user1.profile)
    # プロフィール内容を変更する
    fill_in "user[email]", with: "#{@user1.email}test"
    fill_in "user[nickname]", with: "#{@user1.nickname}+編集したニックネーム"
    fill_in "user[profile]", with: "#{@user1.profile}+編集したプロフィール"
    # 編集してもユーザーカウントが上がらないことを確認する
    expect {
      find('input[name="commit"]').click
    }.to change {User.count}.by(0)
    # マイページに遷移したことを確認する
    visit user_path(@user1)
    # 先ほどの変更内容があるか確認する
    expect(page).to have_content("#{@user1.nickname}+編集したニックネーム")
    expect(page).to have_content("#{@user1.profile}+編集したプロフィール")
    end 
  end
  context "ユーザー情報が編集できない時" do
    it "ログインしたユーザーは自分以外のマイページは編集できない" do
    # ユーザー1でログインする
    visit new_user_session_path
    fill_in "メールアドレス", with: @user1.email
    fill_in "パスワード（半角英数混合6文字以上）", with: @user1.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # ユーザー2のマイページに遷移する
    visit user_path(@user2)
    # ユーザー2のマイページに編集ボタンがないことを確認する
    expect(page).to have_no_content("ユーザー情報編集")
    end
  end
end

RSpec.describe "退会する", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
  end

  context "ユーザーが退会できる時" do
    it "ログインしたユーザーは本人だった場合退会ができる" do
    # ログインする
    visit new_user_session_path
    fill_in "メールアドレス", with: @user1.email
    fill_in "パスワード（半角英数混合6文字以上）", with: @user1.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # マイページに遷移する
    visit user_path(@user1)
    # マイページに編集するボタンがあることを確認する
    expect(page).to have_content("ユーザー情報編集")
    # 編集ページに遷移する
    visit edit_user_registration_path(@user1)
    # 編集ページに退会ボタンがあることを確認する
    expect(page).to have_content("退会する")
    # 退会するとレコードカウントが1つ下がることを確認する
    expect{
      find_link("退会する", href: user_path(@user1)).click
    }.to change {User.count}.by(-1)
    end
  end
end