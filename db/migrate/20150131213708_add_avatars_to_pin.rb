class AddAvatarsToPin < ActiveRecord::Migration
  def change
    add_column :pins, :avatars, :json
  end
end
