require 'uri'
require 'securerandom'

class Url < ActiveRecord::Base
  belongs_to :user

  # Remember to create a migration!
  validates :original, :presence => true
  validates :original, :format => { :with => /https?:\/\/[\S]+/}


  before_create do |url|
    url.short = SecureRandom.hex(3)
    while Url.where(:short => url.short).count != 0
      url.short = SecureRandom.hex(3)
    end
  end

  def self.increment_counter(url)
    # we have an object, and we need a click counter from it
    count = url.click_count
    Url.update(url.id, :click_count => (count + 1))

  end

      # activerecord method for generating short (before save call back)
      # model method for incrementing counter

end
