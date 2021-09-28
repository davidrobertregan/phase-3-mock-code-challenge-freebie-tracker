class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie dev, item_name, value
        Freebie.create(item_name: item_name, value: value, dev_id: dev.id, company_id: self.id)                
    end

    def self.oldest_company
        self.all.sort_by{ |c| c[:founding_year]}.first
    end

    
end
# Company#give_freebie(dev, item_name, value)
# takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev
# Company.oldest_company
# returns the Company instance with the earliest founding year