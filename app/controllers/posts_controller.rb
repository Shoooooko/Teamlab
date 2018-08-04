class PostsController < ApplicationController
  def index
    @post=Posts.all
  end
end
