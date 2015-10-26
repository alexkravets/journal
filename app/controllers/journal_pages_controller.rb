class JournalPagesController < ApplicationController
  def show
    @page = JournalPage.not_hidden.find(params[:slug])
  end
end