require 'rails_helper'

RSpec.describe Schedule, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:schedule)).to be_valid
  end

  describe Schedule do
    it "is invalid without a week number" do
      expect(build(:schedule, week: nil)).not_to be_valid
      #expect(schedule.errors[:week]).to include("can't be blank")
    end

    it "is invalid without a weekday" do
      expect(build(:schedule, weekday: nil)).not_to be_valid
    end

    describe "filter by week" do
      before :each do
        @aeron = create(:schedule, week: 1)
        @garry = create(:schedule, week: 1)
        @hersh = create(:schedule, week: 2)
      end

      context "matching weeks" do
        it "should return correct array of schedules by week" do
          expect(Schedule.by_number(1)).to eq [@aeron, @garry]
        end
      end

      context "non matching weeks" do 
        it "should not return incorrect array by weeks" do
          expect(Schedule.by_number(1)).not_to include [@hersh]
        end
      end
    end
  end
end
