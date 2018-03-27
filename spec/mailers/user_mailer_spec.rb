require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do
  #  let(:mail) { UserMailer.account_activation }

    before :each do
      @user = FactoryGirl.create(:user)
    end

    it 'renders the headers' do
      mail = UserMailer.account_activation(@user)
      expect(mail.subject).to eq('Account Activation')
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(['shohei@example.com'])
    end

    it 'renders the body' do
      mail = UserMailer.account_activation(@user)
      expect(mail.body.encoded).to match("Hello")
    end
  end

  describe 'password_reset' do
    # let(:mail) { UserMailer.password_reset }

    # it "renders the headers" do
    #  expect(mail.subject).to eq("Password reset")
    #  expect(mail.to).to eq(["to@example.org"])
    #  expect(mail.from).to eq(["from@example.com"])
    # end

    #it "renders the body" do
    #  expect(mail.body.encoded).to match("Hi")
    #end
  end

end
