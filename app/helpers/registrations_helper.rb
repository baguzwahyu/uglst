module RegistrationsHelper
  def select_plans_list
    roles = %w{builder supporter participant}
    Role.where(name: roles).map { |role| [role.name.capitalize, role.id] }
  end

  def selected_role
    Role.find_by_name(params['plan'].try(:downcase)).try(:id)
  end
end
