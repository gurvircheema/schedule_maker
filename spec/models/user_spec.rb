require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without first_name" do
    expect(build(:user, first_name: nil)).not_to be_valid
  end
end
