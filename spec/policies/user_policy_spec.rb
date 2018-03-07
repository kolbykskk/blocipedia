require 'rails_helper'


describe UserPolicy do
  subject { UserPolicy.new(user, user) }

  context "for a visitor" do
    let(:user) { nil }

    it { should forbid_action(:dashboard) }
  end

  context "for a logged in user" do
    let(:user) { create(:user) }

    it { should permit_action(:dashboard) }
  end

end
