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
    fields = params.require(:blog).permit(:title, :description)
    @blog = Blog.create! uuid: Blog.uuid,
      user: User.find_by(userid: 'gwade'),
      title: fields[:title],
      description: fields[:description]

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
