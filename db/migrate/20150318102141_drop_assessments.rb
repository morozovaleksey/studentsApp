class DropAssessments < ActiveRecord::Migration
  def change
    drop_table :assessments
  end
end
