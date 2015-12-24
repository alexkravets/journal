class JournalPagesController < ApplicationController
  before_action :authenticate_admin_user!, only: %w( preview )

  def show
    @page = JournalPage.not_hidden.find(params[:slug])
    render @page.template_name || "show"
  end

  def preview
    @page = JournalPage.find(params[:slug])
    render @page.template_name || "show"
  end
end
