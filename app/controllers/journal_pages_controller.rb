class JournalPagesController < ApplicationController
  before_action :authenticate_admin!, only: %w( preview )

  def show
    @page = JournalPage.not_hidden.find(params[:slug])
  end

  def preview
    @page = JournalPage.find(params[:slug])
    render "journal_pages/show"
  end
end
