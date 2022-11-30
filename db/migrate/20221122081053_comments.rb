class Comments < ActiveRecord::Migration
  def change
   create_table :comments do |c|
     c.column :user_id, :int
     c.column :photo_id, :int
     c.column :content, :text
     c.timestamps
   end
 end
end

