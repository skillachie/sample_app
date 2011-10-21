class UsersController < ApplicationController
  
 def show
	@user = User.find(params[:id])
	@title = @user.name
 end


  def new
	@title ="Sign Up"
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	if @user.save
	sign_in @user
	flash[:success]= "Welcome to the Sample App!"
	redirect_to @user	
	else
	@title = "Sign Up"
	@user.password = @user.password_confirmation = nil
	render 'new'
  	end
  end
end
