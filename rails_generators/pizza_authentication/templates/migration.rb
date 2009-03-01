class Create<%= user_plural_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= user_plural_name %> do |t|

      # Required database fields
      t.string    :login,                 :null => false
      t.string    :email,                 :null => false
      t.string    :crypted_password,      :null => false
      t.string    :password_salt,         :null => false
      t.string    :persistence_token,     :null => false

      # Optional tokens
      # t.string    :single_access_token,   :null => false # or: rss_feed_token
      # t.string    :perishable_token,      :null => false # or: pw_reset_token, activation_token

      # Magic columns
      t.integer   :login_count,           :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_logint_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      # Magic states
      # t.boolean   :active,                :null => false, :default => true
      # t.boolean   :approved,              :null => false, :default => false
      # t.boolean   :confirmed,             :null => false, :default => false

      t.timestamps
    end

    add_index :<%= user_plural_name %>, :login, :unique => true
    add_index :<%= user_plural_name %>, :email, :unique => true
    add_index :<%= user_plural_name %>, :persistence_token
  end
  
  def self.down
    remove_index :<%= user_plural_name %>, :login
    remove_index :<%= user_plural_name %>, :email
    remove_index :<%= user_plural_name %>, :persistence_token
    drop_table   :<%= user_plural_name %>
  end
end
