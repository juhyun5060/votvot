class ToptensController < ApplicationController
  before_action :authenticate_user!

  def index
    Post.find_each do |post|
      @like = post.likes.count
      puts Post.order(:@like).limit(5)
    end
    # puts Post.order(:Post.likes.count)
    # @post = Post.find_by
    # puts @post.likes.count
    # @post = Post.order(:)
  end
end
