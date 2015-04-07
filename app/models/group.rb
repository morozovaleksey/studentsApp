class Group < ActiveRecord::Base
  has_many :students
  # belongs_to :assesments
end
