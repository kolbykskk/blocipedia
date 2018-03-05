require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  # Validation tests for name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }

  # Validation tests for email
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value("user@blocipedia.com").for(:email) }
  it { is_expected.to_not allow_value("not-an-email").for(:email) }

  # Validation tests for password
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: user.name, email: user.email, password: user.password, password_confirmation: user.password_confirmation)
    end
  end
end
