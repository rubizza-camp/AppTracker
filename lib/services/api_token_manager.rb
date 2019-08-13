class Services
  class ApiTokenManager
    class << self
      def token_with_credits(minimal_credits)
        avaliable_token = ApiToken.where("credits >= #{minimal_credits}").order(:credits).first
        avaliable_token.update(credits: (avaliable_token.credits - minimal_credits))
      end
    end
  end
end
