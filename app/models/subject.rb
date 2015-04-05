class Subject < ActiveRecord::Base
  belongs_to :semesters
  belongs_to :assesments
end
