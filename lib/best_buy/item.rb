class Item
    attr_accessor :name, :price ,:url, :sale, :info
    @@deals=[]
    def initialize(name, price=nil, url=nil, sale=nil )
        @name=name
       @price=price
        @@deals<< self
    end

     # item = self.new
      #item.price = "$27"
      #item.name = "coach"
      #item.url = "www.amazon.com"
      #item.sale = true
      #item.shipping = "prime"






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
