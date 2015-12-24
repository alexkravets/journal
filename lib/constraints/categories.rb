module Constraints
  class JournalCategories
    def self.matches?(request)
      begin
        if request.path.end_with? "/preview"
          JournalCategory.find(request.params[:slug])
        else
          JournalCategory.not_hidden.find(request.params[:slug])
        end
      rescue
       false
      end
    end
  end
end
