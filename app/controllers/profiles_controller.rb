class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
    case @context = dashboard_context
    when :show_own_profile
      @user = current_user
      render :show
    when :show_other_public_profile
      @user = User.find_by_id(params[:id])
      #render 'dashboard/public'
    when :require_signin
      redirect_to new_user_session_path, notice: 'Sign up to create your own dashboard.'
    end
  end

  def new
    @profile = Profile.new
  end

  def edit

  end

  def create
    @profile = current_user.create_profile(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to user_profile_path(current_user), notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to user_profile_path(current_user), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_profile
    @profile = if current_user.profile.nil?
                 current_user.build_profile
               else
                 current_user.profile
               end
  end

  def profile_params
    params.require(:profile).permit(:full_name, :nickname)
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
