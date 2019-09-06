class PostsController < ApplicationController
    
    def index
        @posts = Post.all 
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(posts_params)
        redirect_to post_path(@post)
    end

    def update
        #byebug
        @post = Post.find(params[:id])
        @post_likes = params[:post][:likes].to_i
        @post_likes_add_one = @post_likes + 1
        @post.likes = @post_likes_add_one
        @post.save
        redirect_to post_path(@post)
    end

    private
    def posts_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes)
    end
end