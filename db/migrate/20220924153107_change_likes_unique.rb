class ChangeLikesUnique < ActiveRecord::Migration[7.0]
  def change
    change_table :likes do |t|
      t.index %i[user_id post_id], unique: true
    end
  end
end
