module ProfilesHelper
  def user_group_table_role_style(role)
    case role
    when 'participant'
      'label-success'
    else
      'label-warning'
    end
  end
end
