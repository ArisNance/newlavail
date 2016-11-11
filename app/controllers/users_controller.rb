class UsersController < ApplicationController
    def show
        @user = current_user.blogs.find_by(id: params[:id])
        @blogs = current_user.blogs
    end
end
