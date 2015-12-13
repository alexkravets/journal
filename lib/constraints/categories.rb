module Constraints
  class JournalCategories
    def self.matches?(request)
      begin
        JournalCategory.find(request.params[:slug])
      rescue
       false
      end
    end
  end
end
