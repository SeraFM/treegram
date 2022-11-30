class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |f|
      f.column :follower, :integer
      f.column :followee, :integer
      f.timestamps
    end
  end
end
