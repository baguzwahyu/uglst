class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    updated = @user.update!(params.require(:profile).permit(:full_name, :nickname))

    if updated
      redirect_to dashboard_path
    end
  end
end
