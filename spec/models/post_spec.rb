require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe "お題の投稿" do
    context "投稿できる時" do
      it "ジャンル、お題、投稿者の回答があれば投稿できる" do
        @post.image = nil 
        expect(@post).to be_valid
      end
      it "ジャンル、画像、投稿者の回答があれば投稿できる" do
        @post.title = nil 
        expect(@post).to be_valid
      end
    end

    context "投稿できない時" do
      it "画像とお題どちらかがないと投稿できない" do
        @post.image = nil
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it "ジャンルの選択がされてうないと投稿できない" do
        @post.genre_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Genre Select")
      end
      it "お題作成者の回答がないと投稿できない" do
        @post.sentence = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Sentence can't be blank")
      end
    end
  end
end
