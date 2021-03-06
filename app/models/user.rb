class User < ActiveRecord::Base
  has_many :schedules
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact, presence: true
  validates :email, presence: true, uniqueness:true

  def name
    [first_name, last_name].join(", ")
  end
end
