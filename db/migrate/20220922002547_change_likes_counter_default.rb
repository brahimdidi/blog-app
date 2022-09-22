class ChangeLikesCounterDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:posts, :likesCounter, 0)
  end
end
