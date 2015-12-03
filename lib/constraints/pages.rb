module Constraints
  class JournalPages
    def self.matches?(request)
      begin
        if request.path.end_with? "/preview"
          JournalPage.find(request.params[:slug])
        else
          JournalPage.not_hidden.find(request.params[:slug])
        end
      rescue
       false
      end
    end
  end
end
