class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(:title)
  end
end
