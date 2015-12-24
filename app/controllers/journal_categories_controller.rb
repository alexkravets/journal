class JournalCategoriesController < ApplicationController
  before_action :set_params

  def show
    @category = JournalCategory.not_hidden.find(@slug)
    @posts = posts
  end

  def preview
    @category = JournalCategory.find(@slug)
    @posts = posts
    render "show"
  end

  private

  def posts
    @category.posts.not_hidden.published.page(@page).per(@perPage)
  end

  def set_params
    @slug = params[:slug]
    @page = params[:page].try(:to_i) || 1
    @perPage = 15
  end
end
