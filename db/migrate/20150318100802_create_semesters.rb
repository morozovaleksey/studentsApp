class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.integer :semester_number
      t.timestamps null: false
    end
  end
end
