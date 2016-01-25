class Schedule < ActiveRecord::Base
  belongs_to :user

  validates :week, presence: true
  validates :weekday, presence: true

  def self.by_number(number)
    where("week LIKE ?", "#{number}")
  end

end
