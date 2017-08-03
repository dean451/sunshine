class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.order("created_at desc").limit(4).offset(1)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Image was successfully saved.'
     else
       render action: 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
