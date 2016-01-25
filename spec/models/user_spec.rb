require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without first_name" do
    expect(build(:user, first_name: nil)).not_to be_valid
  end

  it "is invalid without last_name" do
    expect(build(:user, last_name: nil)).not_to be_valid
  end

  it "is invalid without contact" do
    expect(build(:user, contact: nil)).not_to be_valid
  end

  it "is invalid without email" do
    expect(build(:user, email: nil)).not_to be_valid
  end

  # it "has many schedules" do
    
  #   t = User.reflect_on_association(:schedule)
  #   expect(t.macro).to eq(:has_many)
  #   # expect(User.reflect_on_association(:schedule).macro).to eq(has_many)
  # end

end
