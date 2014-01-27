class AddColumnsToUsers < ActiveRecord::Migration
  def change




    add_column :users, :username, :string

    add_column :users, :password, :string
    add_column :users, :usertype, :string
    add_column :users, :block, :integer
    add_column :users, :sendEmail, :integer
    add_column :users, :gid, :integer
    add_column :users, :registerDate, :datetime
    add_column :users, :lastvisitDate, :datetime
    add_column :users, :activation, :string
    add_column :users, :params, :text
    add_column :users, :fb_author, :string
    add_column :users, :ntlparam, :text

  end
end
