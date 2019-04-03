class PostsController < ApplicationController

    def new 
        @post = Post.new
    end
    
    def create
        render plain: params[:post].inspect
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "Post was successfully created"
            redirect_to posts_show(@post)
        else 
            render 'new'
        end
    end

    private
        def post_params
            params.require(:post).permit(:title, :description)
        end

end