class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :photo, 'https://thumbs.dreamstime.com/b/default-profile-picture-avatar-photo-placeholder-vector-illustration-default-profile-picture-avatar-photo-placeholder-vector-189495158.jpg')
  end
end
