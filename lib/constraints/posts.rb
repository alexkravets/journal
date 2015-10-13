module Constraints
  class JournalPosts

    def self.matches?(request)
      int_id = request.params[:hex].to_i
      JournalPost.not_hidden.where(int_id: int_id).size > 0
    end

  end
end
