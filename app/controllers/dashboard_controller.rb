class DashboardController < ApplicationController
  def show
    case @context = dashboard_context
    when :show_own_profile
      puts 'Show own profile'
      @user = current_user
      render 'dashboard/private'
    when :show_other_public_profile
      puts 'Show other public profile...'
      @user = User.find_by_id(params[:id])
      render 'dashboard/public'
    when :require_signin
      redirect_to new_user_session_path, notice: 'Sign up to create your own dashboard.'
    end
  end

  def dashboard_context
    if current_user
      # signed-in
      if params[:id].blank? || current_user.id.to_s == params[:id]
        # we are signed in and want to see our own profile
        # we're looking at ourself
        :show_own_profile
      else
        # we are signed in and want to see someone else's profile
        # we're looking at someone else
        :show_other_public_profile
      end
    else
      # not signed in
      if params[:id].blank?
        # we're not signed in and we didn't specify a profile
        # prompt to sign in
        :require_signin
      else
        # we're not logged in and we specified a profile
        # try to lookup a user for the :id
        :show_other_public_profile
      end
    end
  end
end
