class Services
  class ApiTokenManager
    class << self
      def token_with_credits(minimal_credits)
        avaliable_token = ApiToken.where("credits >= #{minimal_credits}").order(:credits).first
        return nil if avaliable_token.nil?

        avaliable_token.update(credits: (avaliable_token.credits - minimal_credits))
        avaliable_token.token
      end
    end
  end
end
