class AddYoutubeVidIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :youtube_vid_id, :string, default: ""
  end
end
