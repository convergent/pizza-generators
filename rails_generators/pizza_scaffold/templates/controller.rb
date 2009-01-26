class <%= plural_class_name %>Controller < ResourceController::Base

  <%- if controller_actions.size < 3 -%>
  actions <%= controller_actions.map(&:to_sym).map(&:inspect).join(', ') %>
  <%- elsif controller_actions.size < 7  -%>
  actions :all, :except => [ <%= not_used_actions.map(&:to_sym).map(&:inspect).join(', ') %> ]
  <%- end -%>

  <%= controller_methods :actions %>

end
