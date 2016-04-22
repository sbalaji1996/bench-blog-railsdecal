class AddLikeToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :like, :integer
  end
end
