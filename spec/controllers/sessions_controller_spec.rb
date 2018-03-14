require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user, role: "premium") }

  describe "PUT #downgrade" do
    it "downgrades the user to standard" do
      current_user = sign_in(user)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      put :downgrade
      expect(user.reload.standard?).to be_truthy
    end
  end
end
