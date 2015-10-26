class JournalPostsController < ApplicationController
  before_filter :set_all_posts, only: %w(index show)


  def show
    @post = post_by_int_id
  end


  def redirect
    @post = post_by_int_id
    redirect_to journal_post_path(@post.hex, @post.slug)
  end


  private

    def set_all_posts
      @posts = JournalPost.not_hidden
    end

    def post_by_int_id
      int_id = params[:hex].to_i(16)
      JournalPost.not_hidden.find_by(int_id: int_id)
    end

end