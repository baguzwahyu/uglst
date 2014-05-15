module ProfilesHelper
  def user_group_table_role_style(role)
    case role
    when 'participant'
      'label-success'
    else
      'label-warning'
    end
  end

  def user_group_summary
    ug_membership_count = current_user.user_groups.count

    html = content_tag(:h2) do
      "You are currently participating in #{pluralize(ug_membership_count, 'user-group')}."
    end
  end
end
