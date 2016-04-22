class AddSportToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :sport, :string
  end
end
