require 'rails_helper'

describe ChargesControllerPolicy do
  subject { ChargesControllerPolicy.new(user, user) }

  context "for a visitor" do
    let(:user) { nil }

    it { should forbid_action(:new) }
    it { should forbid_action(:create) }
  end

  context "for a logged in user who is standard" do
    let(:user) { create(:user, role: "standard") }

    it { should permit_action(:new) }
    it { should permit_action(:create) }
  end

  context "for a logged in user who is premium" do
    let(:user) { create(:user, role: "premium") }

    it { should forbid_action(:new) }
    it { should forbid_action(:create) }
  end

end
