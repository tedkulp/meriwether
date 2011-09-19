class ValidSubdomainRoute
  def self.matches?(request)
    Subdomain.exists?(conditions: { name: request.subdomain })
  end
end
