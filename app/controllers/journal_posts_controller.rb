class JournalPostsController < ApplicationController
  before_filter :set_all_posts, only: %w( index show )
  before_action :authenticate_admin_user!, only: %w( preview )

  def show
    @post = published_post_by_int_id
  end

  def redirect
    @post = published_post_by_int_id
    redirect_to show_journal_post_path(@post.hex, @post.slug)
  end

  def preview
    @post  = post_by_int_id
    @posts = JournalPost.not_hidden
    render "journal_posts/show"
  end

  private

  def set_all_posts
    @posts = JournalPost.not_hidden
  end

  def int_id
    params[:hex].to_i(16)
  end

  def published_post_by_int_id
    JournalPost.not_hidden.find_by(int_id: int_id)
  end

  def post_by_int_id
    JournalPost.find_by(int_id: int_id)
  end
end
