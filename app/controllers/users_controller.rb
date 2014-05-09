class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    updated = @user.update!(params.require(:user).permit(:full_name, :short_name))

    if updated
      redirect_to dashboard_path
    end
  end
end
