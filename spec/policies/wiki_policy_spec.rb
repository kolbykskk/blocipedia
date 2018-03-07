require 'rails_helper'

describe WikiPolicy do
  subject { WikiPolicy.new(user, wiki) }

  context "for a visitor" do
    let(:user) { nil }
    let(:wiki) { create(:wiki) }

    it { should forbid_action(:destroy) }
    it { should permit_action(:show) }
    it { should permit_action(:index) }
    it { should forbid_action(:new) }
    it { should forbid_action(:create) }
    it { should forbid_action(:edit) }
    it { should forbid_action(:update) }
  end

  context "for standard role who owns the wiki" do
    let(:user) { create(:user, role: "standard") }
    let(:wiki) { create(:wiki, user: user) }

    it { should permit_action(:destroy) }
    it { should permit_action(:show) }
    it { should permit_action(:index) }
    it { should permit_action(:new) }
    it { should permit_action(:create) }
    it { should permit_action(:edit) }
    it { should permit_action(:update) }
  end

  context "for standard role who doesn't own the wiki" do
    let(:user) { create(:user, role: "standard") }
    let(:wiki) { create(:wiki) }

    it { should forbid_action(:destroy) }
    it { should permit_action(:show) }
    it { should permit_action(:index) }
    it { should permit_action(:new) }
    it { should permit_action(:create) }
    it { should permit_action(:edit) }
    it { should permit_action(:update) }
  end

  context "for admin who doesn't own the wiki" do
    let(:user) { create(:user, role: "admin") }
    let(:wiki) { create(:wiki) }

    it { should permit_action(:destroy) }
    it { should permit_action(:show) }
    it { should permit_action(:index) }
    it { should permit_action(:new) }
    it { should permit_action(:create) }
    it { should permit_action(:edit) }
    it { should permit_action(:update) }
  end
end
