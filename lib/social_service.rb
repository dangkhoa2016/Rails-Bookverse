class SocialService
  class << self
    def remove_social_domain(url, network = nil)
      return url if url.blank?

      network = (network || '').downcase
      if respond_to?("remove_#{network}_domain", true)
        send("remove_#{network}_domain", url)
      else
        url.gsub(/^https?:\/\/(www\.|m\.)?([^\/]+\/.*)/, '\2')
      end
    end

    def insert_social_domain(url, network = nil)
      return url if url.blank?

      network = (network || '').downcase
      if respond_to?("insert_#{network}_domain", true)
        send("insert_#{network}_domain", url)
      else
        "https://#{network}.com/#{url}"
      end
    end

    [:linkedin, :youtube, :instagram].each do |network|
      define_method("remove_#{network}_domain") do |url|
        return url if url.blank?

        url.gsub(/^https?:\/\/(www\.)?(m\.)?#{network}\.com\/(.*)/, '\2')
      end
    end

    def remove_instagram_domain(url)
      return url if url.blank?

      url.gsub(/^https?:\/\/(www\.)?instagram\.com\/(.*)/, '\2')
    end

    def remove_facebook_domain(url)
      return url if url.blank?

      url.gsub(/^https?:\/\/(www\.)?(m\.)?(l\.)?(fb\.com|facebook\.com)\/(.*)/, '\5')
    end
  
    def remove_twitter_domain(url)
      return url if url.blank?

      url.gsub(/^https?:\/\/(www\.)?(mobile\.)?(x\.com|twitter\.com)\/([^\/]+).*/, '\4')
    end
  
    [:linkedin, :youtube, :facebook, :twitter, :instagram].each do |network|
      define_method("insert_#{network}_domain") do |url|
        return url if url.blank?

        "https://#{network}.com/#{url}"
      end
    end
  end
end
