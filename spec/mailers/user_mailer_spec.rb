require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do

    before :each do
      @user = FactoryGirl.create(:user)
    end

    it 'renders the headers' do
      mail = UserMailer.account_activation(@user)
      expect(mail.subject).to eq('Account Activation')
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(['gktyj889@yahoo.co.jp'])
    end

    it 'renders the body' do
      mail = UserMailer.account_activation(@user)
      expect(mail.body.encoded).to match("Hello")
    end
  end

  describe 'password_reset' do

    before :each do
      @user = FactoryGirl.create(:user)
    end

    it 'renders the headers' do
      @user.reset_token = User.new_token
      mail = UserMailer.password_reset(@user)
      expect(mail.subject).to eq('Password reset')
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(['gktyj889@yahoo.co.jp'])
    end

    it 'renders the body' do
      @user.reset_token = User.new_token
      mail = UserMailer.password_reset(@user)
      expect(mail.body.encoded).to match('Hello')
    end
  end

end
