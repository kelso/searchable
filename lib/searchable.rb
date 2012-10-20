require "searchable/version"

module Searchable
  def has_searchable field
    @field = field
    extend InstanceMethods
  end

  module InstanceMethods
    def search(options = {})
      case search_method(options)
      when :string
        self.where(["#{@field} LIKE ?", "%#{options[:by]}%"])
      when :letter
        self.where(["#{@field} LIKE ?", "#{options[:by_letter]}%"])
      when :numbers
        self.where(["#{@field} RLIKE ?", '^[0-9]'])
      else
        self.where(1)
      end
    end

    private
    def search_method(options)
      if options[:by]
        :string
      elsif options[:by_letter]
        options[:by_letter] == "num" ? :numbers : :letter
      end
    end
  end
end

ActiveRecord::Base.extend Searchable
