class JournalPostsController < ApplicationController
  before_action :authenticate_admin_user!, only: %w( preview )

  def index
    @page = params[:page].try(:to_i) || 1
    @perPage = 15

    if @page == 1
      @featured = JournalPost.not_hidden.published.featured
    end

    @posts = JournalPost.not_hidden.published.not_featured.page(@page).per(@perPage)
  end

  def show
    @post = published_post_by_int_id
    render @post.template_name || "show"
  end

  def preview
    @post = post_by_int_id
    render @post.template_name || "show"
  end

  def redirect
    @post = published_post_by_int_id
    redirect_to show_journal_post_path(@post.hex, @post.slug)
  end

  private

  def int_id
    params[:hex].to_i(16)
  end

  def published_post_by_int_id
    JournalPost.not_hidden.published.find_by(int_id: int_id)
  end

  def post_by_int_id
    JournalPost.find_by(int_id: int_id)
  end
end
