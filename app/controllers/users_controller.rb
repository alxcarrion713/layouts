class UsersController < ApplicationController
  layout "index"

    def index
        @users = User.all
        render layout: "two_column"
    end

    def new
    end

    def create
        a = User.new(user_params)
        if !a.valid?
            flash[:error] = "Fields need to be filled"
        else
            a.save
        end
        redirect_to "/"
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :favorite_language)
    end
end
