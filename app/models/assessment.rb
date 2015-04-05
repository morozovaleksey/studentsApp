class Assessment < ActiveRecord::Base
  has_many :students
  has_many :subjects
end
