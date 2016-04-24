class PostsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create 
     @post = Post.create(post_params)
      @post.user = current_user
      @post.like = 0;
      if @post.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def destroy
   @post = Post.find(params[:id])
    if @post.destroy
     redirect_to root_path
    else
      :back
    end
  end

  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
  

  def like_post
    @post = Post.find(params[:id])
    @post.like += 1
    #current_user.posts_liked << @post.id
    if @post.save
      redirect_to post_path(params[:id])
    end
  end

=begin
  def unlike_post
    @post = Post.find(params[:id])
    @post.like -= 1
    current_user.posts_liked.delete(@post.id)
    if @post.save
      redirect_to post_path(params[:id])
    end
  end
=end

  private

  def post_params
  	params.require(:post).permit(:title, :text, :sport)
  end

end
