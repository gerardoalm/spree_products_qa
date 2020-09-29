module Spree
  module ProductDecorator
    def self.prepended(base)
      base.has_many :product_questions
    end
  end
end

Spree::Product.prepend Spree::ProductDecorator