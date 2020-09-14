class PostsController < ApplicationController
  layout "index"
    def index
        @user =  User.user_all
        @posts = Post.all
        render layout: "three_column"
    end

    def create
        post = Post.new( post_params )
        if !post.valid?
            flash[:error] = "Field must be filled in"
        else
            post.save
        end
        redirect_to "/posts"
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end