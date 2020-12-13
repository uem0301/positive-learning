require 'rails_helper'
describe User do
  describe '#create' do

    # #nameが空では登録できないこと
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end

    # #emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
    end

    # #passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include(I18n.t('errors.messages.blank'))
    end

    # nameとemail、passwordが存在すれば登録できること
    it "is invalid with a name, email, password" do
      user = build(:user)
      expect(user).to be_valid
    end

    # passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password:"aaaaaa")
      expect(user).to be_valid
    end

    # passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has more than 5 characters " do
      user = User.new(password: 'a' * 5)
      user.valid?
      expect(user.errors[:password]).to include(I18n.t('errors.messages.too_short', count: 6))
    end

    # 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include(I18n.t('errors.messages.taken'))
    end
  end
end