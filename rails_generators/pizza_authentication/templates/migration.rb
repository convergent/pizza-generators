class Create<%= user_plural_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= user_plural_name %> do |t|

      # Required database fields
      t.string    :login,                 :null => false
      t.string    :crypted_password,      :null => false
      t.string    :password_salt,         :null => false
      t.string    :persistence_token,     :null => false

      # Optional tokens, see Authlogic README for more details.
      # t.string    :single_access_token,   :null => false # or: rss_feed_token
      # t.string    :perishable_token,      :null => false # or: pw_reset_token, activation_token

      # Magic columns
      t.integer   :login_count,           :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_logint_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      # For activating an account, optional
      t.boolean   :active,                :null => false, :default => true

      t.timestamps
    end
  end
  
  def self.down
    drop_table :<%= user_plural_name %>
  end
end
