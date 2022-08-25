class RenamebioToBio < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Bio, :bio
    rename_column :users, :PostsCounter, :postsCounter
  end
end
