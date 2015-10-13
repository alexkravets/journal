module Constraints
  class JournalPages

    def self.matches?(request)
      begin
        JournalPage.find(request.params[:slug])

      rescue
        false

      end
    end

  end
end
