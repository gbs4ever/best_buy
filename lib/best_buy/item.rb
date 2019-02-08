class Item
    attr_accessor :name, :price ,:url, :sale, :info, :saved, :long_price, :long_name ,:message
    @@deals=[]
    def initialize(name, price, url=nil, sale=nil, message=nil )
        @name=name
       @price=price
       @url=url
       @sale=sale
       @message=message
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
    def self.create(name,price, url)
     if  self.find_by_name(name) == nil
        item= self.new(name,price, url)
        
      end
    end
      def self.find_by_name(name)
        @@deals.find {|a|a.name == name}
      end

end
