class EditUsers < ActiveRecord::Migration
  def change
    rename_column :users, :extra, :title
    rename_column :users, :cohort, :track
  end
end
