module Constraints
  class JournalPosts
    def self.matches?(request)
      int_id = request.params[:hex].to_i(16)
      JournalPost.not_hidden.published.where(int_id: int_id).size > 0
    end
  end
end
