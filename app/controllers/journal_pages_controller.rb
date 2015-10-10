class JournalPagesController < ApplicationController
  def show
    @page = JournalPage.find(params[:slug])
  end
end