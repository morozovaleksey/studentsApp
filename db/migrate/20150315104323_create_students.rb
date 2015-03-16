class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :group
      t.date :date_of_birth
      t.string :email
      t.string :ip_address
      t.timestamps
    end
  end
end
