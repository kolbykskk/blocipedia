require 'rails_helper'


describe UserPolicy do
  subject { UserPolicy.new(user, user) }

  context "for a visitor" do
    let(:user) { nil }

    it { should forbid_action(:dashboard) }
    it { should forbid_action(:downgrade) }
  end

  context "for a logged in user who is standard" do
    let(:user) { create(:user, role: "standard") }

    it { should permit_action(:dashboard) }
    it { should forbid_action(:downgrade) }
  end

  context "for a logged in user who is premium" do
    let(:user) { create(:user, role: "premium") }

    it { should permit_action(:dashboard) }
    it { should permit_action(:downgrade) }
  end

end
