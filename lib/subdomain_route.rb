class SubdomainRoute
  def self.matches?(request)
    if request.subdomain.present?
      case request.subdomain
      when 'www', 'ftp', 'pop', 'smtp', 'admin', '', nil
        false
      else
        true
      end
    else
      false
    end
  end
end
