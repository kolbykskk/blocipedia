require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :wiki }
end
