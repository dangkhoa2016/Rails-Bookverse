import { Controller } from '@hotwired/stimulus';

const SocialService = {
  // Helper function to capitalize the first letter of a string
  capitalize(str) {
    return str ? str.charAt(0).toUpperCase() + str.slice(1) : '';
  },
  
  // Helper method to remove the domain for a specific social network
  removeSocialDomain(url, network = '') {
    if (!url) return url;
    network = network.toLowerCase();
    return this._removeOrInsertSocialDomain(url, network, 'remove');
  },

  // Helper method to insert the domain for a specific social network
  insertSocialDomain(url, network = '') {
    if (!url) return url;
    network = network.toLowerCase();
    return this._removeOrInsertSocialDomain(url, network, 'insert');
  },

  // General method for both removing and inserting social media domain for specific networks
  _removeOrInsertSocialDomain(url, network, action) {
    const method = `${action}${this.capitalize(network)}Domain`;

    if (typeof this[method] === 'function') {
      return this[method](url);
    }

    const defaultDomain = {
      linkedin: 'linkedin.com',
      youtube: 'youtube.com',
      instagram: 'instagram.com',
      facebook: 'facebook.com',
      twitter: 'twitter.com',
    };

    const domain = defaultDomain[network] || network;

    if (action === 'remove') {
      return url.replace(new RegExp(`^https?:\/\/(www\.)?(m\.)?${domain}\/(.*)`), '$3');
    } else if (action === 'insert') {
      return `https://${domain}/${url}`;
    }

    return url;
  },

  // Methods for removing social media domain for specific networks
  removeLinkedinDomain(url) {
    return this._removeSocialDomainForSpecificNetwork(url, 'linkedin');
  },

  removeYoutubeDomain(url) {
    return this._removeSocialDomainForSpecificNetwork(url, 'youtube');
  },

  removeInstagramDomain(url) {
    return this._removeSocialDomainForSpecificNetwork(url, 'instagram');
  },

  removeFacebookDomain(url) {
    return this._removeSocialDomainForSpecificNetwork(url, 'facebook');
  },

  removeTwitterDomain(url) {
    return this._removeSocialDomainForSpecificNetwork(url, 'twitter');
  },

  // Methods for inserting social media domain for specific networks
  insertLinkedinDomain(url) {
    return this._insertSocialDomainForSpecificNetwork(url, 'linkedin');
  },

  insertYoutubeDomain(url) {
    return this._insertSocialDomainForSpecificNetwork(url, 'youtube');
  },

  insertInstagramDomain(url) {
    return this._insertSocialDomainForSpecificNetwork(url, 'instagram');
  },

  insertFacebookDomain(url) {
    return this._insertSocialDomainForSpecificNetwork(url, 'facebook');
  },

  insertTwitterDomain(url) {
    return this._insertSocialDomainForSpecificNetwork(url, 'twitter');
  },

  // Helper method for removing domain for a specific network
  _removeSocialDomainForSpecificNetwork(url, network) {
    if (!url) return url;

    const domainRegex = {
      linkedin: /^https?:\/\/(www\.)?(m\.)?linkedin\.com\/(.*)/,
      youtube: /^https?:\/\/(www\.)?(m\.)?(youtu\.be|youtube\.com)\/(.*)/,
      instagram: /^https?:\/\/(www\.)?(m\.)?instagram\.com\/(.*)/,
      facebook: /^https?:\/\/(www\.)?(m\.)?(l\.)?(fb\.com|facebook\.com)\/(.*)/,
      twitter: /^https?:\/\/(www\.)?(mobile\.)?(x\.com|twitter\.com)\/([^\/]+).*/,
    };

    // Get the correct capturing group for each social network.
    const regex = domainRegex[network];

    if (!regex) return url;

    // For LinkedIn, YouTube, Instagram, Facebook, and Twitter
    const match = url.match(regex);
    if (match) {
      // The last group is always the part after the domain for most networks
      return match[match.length - 1];
    }

    return url;
  },

  // Helper method for inserting domain for a specific network
  _insertSocialDomainForSpecificNetwork(url, network) {
    if (!url) return url;
    return `https://${network}.com/${url}`;
  }
};


export default class extends Controller {
  static values = {
    network: String
  }

  connect() {
  }

  onBlur() {
    this.insertDomain();
  }

  onFocus() {
    this.removeDomain();
  }

  removeDomain() {
    this.element.value = SocialService.removeSocialDomain(this.element.value, this.networkValue);
  }

  insertDomain() {
    this.element.value = SocialService.insertSocialDomain(this.element.value, this.networkValue);
  }
}
