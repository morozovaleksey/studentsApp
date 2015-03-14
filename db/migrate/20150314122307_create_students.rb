class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :group
      t.string :group
      t.datetime :date_of_birth
      t.string :email
      t.timestamps null: false
    end
  end
end
