class Services
  class ApiTokenManager
    class << self
      def token_with_credits(minimal_credits)
        available_token = ApiToken.where("credits >= #{minimal_credits}").order(:credits).first
        return nil if available_token.nil?

        available_token.update(credits: (available_token.credits - minimal_credits))
        available_token.value
      end
    end
  end
end
