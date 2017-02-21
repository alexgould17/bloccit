class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.length.times do |i|
      @posts[i].title = 'SPAM' if i%5 == 0
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
