class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @blogs = Blog.order(:title)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
  end

  def create
    fields = blog_params
    @blog = Blog.create!(uuid: Blog.uuid,
      user: current_user,
      title: fields[:title],
      description: fields[:description]
    )
    redirect_to(@blog)
  end

  def edit
    # Form for modifying blog
    @blog = users_blog(params[:id])

    if @blog.nil?
      flash[:notice] = 'Selected blog not found for current user.'
      redirect_to :index
    else
      render :edit
    end
  end

  def update
    @blog = users_blog(params[:id])

    if @blog.nil?
      flash[:notice] = 'Selected blog not found for current user.'
      redirect_to :index
    elsif @blog.update(blog_params)
      redirect_to(@blog)
    else
      render :edit
    end
  end

  private
  def users_blog blog_id
    Blog.where(id: blog_id, user_id: current_user.id).first
  end

  def blog_params
    params.require(:blog).permit(:title, :description).to_hash.transform_keys(&:to_sym)
  end
end
