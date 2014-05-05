module RegistrationsHelper
  def select_plans_list
    roles = %w{builder supporter participant}
    Role.where(name: roles).map { |role| [role.name.capitalize, role.id] }
  end

  def selected_role
    role = params[:plan].try(:downcase)
    Role.find_by_name(role).try(:id)
  end
end
