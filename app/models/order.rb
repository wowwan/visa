class Order < ActiveRecord::Base
    has_many :passports

    accepts_nested_attributes_for :passports, allow_destroy: true
end
