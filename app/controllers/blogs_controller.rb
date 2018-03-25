class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(:title)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
  end

  def create
    # How do I set the 
    @blog = Blog.create! uuid: Blog.uuid,
      user: current_user,
      title: params.require(:blog).require(:title),
      description: params.require(:blog).permit(:description)

    redirect_to(@blog)
  end

  def edit
    # Form for modifying blog
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to(@blog)
    else
      render :edit
    end
  end
end
