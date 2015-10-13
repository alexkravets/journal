class JournalPostsController < ApplicationController
  def index
    @posts = JournalPost.not_hidden
  end


  def show
    @post = post_by_int_id
  end


  def redirect
    @post = post_by_int_id
    redirect_to journal_post_path(@post.hex, @post.slug)
  end


  private

    def post_by_int_id
      int_id = params[:hex].to_i
      JournalPost.not_hidden.find_by(int_id: int_id)
    end

end