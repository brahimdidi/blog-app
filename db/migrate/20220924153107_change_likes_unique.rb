class ChangeLikesUnique < ActiveRecord::Migration[7.0]
  def change
    change_table :likes do |t|
      t.index [:user_id, :post_id], unique: true
    end
  end
end
