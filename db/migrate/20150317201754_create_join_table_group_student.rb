class CreateJoinTableGroupStudent < ActiveRecord::Migration
  def change
    create_join_table :groups, :students do |t|
      t.index :group_id
      t.index :student_id
    end
  end
end
