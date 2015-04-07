class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.references :semester
      t.string :subject_name
      t.timestamps null: false
    end
  end
end
