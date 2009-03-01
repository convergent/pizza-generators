Factory.sequence :<%= user_singular_name %>_login do |n|
  "user#{n unless n == 1}"
end

Factory.define :<%= user_singular_name %> do |f|
  f.login                   { Factory.next(:<%= user_singular_name %>_login) }
  f.password                { |o| o.login.gsub(/W+/, "_") }
  f.password_confirmation   { |o| o.password }
  f.email                   { |o| o.login.gsub(/W+/, "_") + "@test.com" }
end

# Create factories for additional roles like this:
# 
# Factory.sequence :admin_login do |n|
#   "admin#{n unless n == 1}"
# end
#
# Factory.define :admin, :class => <%= user_class_name %> do |f|
#   f.login                   { Factory.next(:admin_login) }
#   f.password                { |o| o.login.gsub(/W+/, "_") }
#   f.password_confirmation   { |o| o.password }
#   f.email                   { |o| o.login.gsub(/W+/, "_") + "@test.com" }
#   f.admin                   true
# end
