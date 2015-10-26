module Constraints
  class JournalPages

    def self.matches?(request)
      begin
        JournalPage.not_hidden.find(request.params[:slug])

      rescue
        false

      end
    end

  end
end