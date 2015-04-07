class Student < ActiveRecord::Base
  belongs_to :groups
  belongs_to :assesments

end
