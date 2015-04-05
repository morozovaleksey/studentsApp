class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.references :student
      t.references :subject
      t.integer :assessment
    end
  end
end
