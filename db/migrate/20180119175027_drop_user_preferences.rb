class DropUserPreferences < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_preferences
  end
end
