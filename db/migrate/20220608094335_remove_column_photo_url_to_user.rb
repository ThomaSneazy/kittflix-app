class RemoveColumnPhotoUrlToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :photo_url
  end
end
