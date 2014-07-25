class AddInfoFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :blurb, :text
    add_column :users, :github_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :image_url, :string
    add_column :users, :webpage, :string
    add_column :users, :cohort, :string
    add_column :users, :is_admin, :boolean
    add_column :users, :extra, :string
  end
end
