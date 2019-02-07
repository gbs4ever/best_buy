class Item
    attr_accessor :name, :price ,:url, :sale, :info, :saved, :long_price, :long_name
    @@deals=[]
    def initialize(name, price=nil, url=nil, sale=nil )
        @name=name
       @price=price
       @url=url
       @sale=sale
       
        @@deals<< self
    end

     






  #class methods
      def self.all# will return all deals
        @@deals
      end
      def self.destroy_all
      @@deals.clear
      end
    def save
      @@deals << self
    end
    def self.create(name)
        item= self.new(name)
       #item.save
        item
   end
      def self.find_by_name(name)
        @@all.find {|a|a.name == name}
      end

end
