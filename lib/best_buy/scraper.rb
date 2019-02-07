require 'pry'
require 'nokogiri'
require 'open-uri'
class Scraper
    
    
#scrapper 1 


def self.url
    doc = Nokogiri::HTML(open("https://www.bestbuy.com/"))
deals_url=doc.css("ul .deals-ul-0 li a")[2].attribute("href").value
self.deal_of_the_day(deals_url)
end
    

#scrapper 2 
    def self.deal_of_the_day(deals_url)
   # doc = Nokogiri::HTML(open("https://www.bestbuy.com/site/misc/deal-of-the-day/pcmcat248000050016.c?id=pcmcat248000050016"))
    doc1 = Nokogiri::HTML(open(deals_url))
   doc =doc1.css("div.offer-column.oneUp.col-xs-12")

    name=doc.css(".offer-link  a").text # name of item
    url = "https://www.bestbuy.com"
    url +=doc.css(".offer-link  a").attribute("href").value # link file
    binding.pry
    price=doc.css("span.sr-only")[0].text if doc.css("span.sr-only") # price 
    sale = doc.css("div.pricing-price__sale-message").last.text #on sale should return true 
    message= doc.css("div .add-to-cart-button").text
    Item.new(name, price, url, sale, message)
  
    
    end
    #scrapper additional deals 
            
    #name=doc.css(" list-header-text v-fw-medium").text # to check that it is bonus deals
    #file= doc.css(".col-xs-10 product")


            
#scrapper 3

    def self.more_info(item) # item should be object
        
        #doc = Nokogiri::HTML(open(item))
        item.saved =#doc.css("div .pricing-price__savings").text #amont saved
        item.info =#doc.css("div #long-description").text #more info
        item.long_name =#doc.css("h1").text    # name
        item.long_price = "123"#doc.css("span.sr-only")[0].text # price
    
      
    end


    
end
