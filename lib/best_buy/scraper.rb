require 'pry'
require 'nokogiri'
require 'open-uri'
class Scraper
    
    #this is test sutie must remove
    def scrape_items
    Item.create("ball")
    Item.create("cat")
    Item.create("bat")
    Item.create("glove")
    Item.create("hat")
    end

#scrapper 1 


def self.url
    doc = Nokogiri::HTML(open("https://www.bestbuy.com/"))
deals_url=doc.css("ul .deals-ul-0 li a")[2].attribute("href").value
self.deal_of_the_day(deals_url)
end
    

#scrapper 2 
    def self.deal_of_the_day(deals_url)
   # doc = Nokogiri::HTML(open("https://www.bestbuy.com/site/misc/deal-of-the-day/pcmcat248000050016.c?id=pcmcat248000050016"))
    doc = Nokogiri::HTML(open(deals_url))
    
    name=doc.css(".offer-link  a").text # name of item
    url = "https://www.bestbuy.com"
    url +=doc.css(".offer-link  a").attribute("href").value # link file
    price=doc.css("span.sr-only")[0].text # price 
    sale = doc.css("div.pricing-price__sale-message").last.text #on sale should return true 
    Item.new(name, price, url, sale)
  
end
    

#scrapper 3

    def self.more_info(item)
        doc = Nokogiri::HTML(open(item.url))
        item.saved =doc.css("div .pricing-price__savings").text #amont saved
        item.info =doc.css("div #long-description").text #more info
        item.long_name =doc.css("h1").text    # name
        item.long_price = doc.css("span.sr-only")[0].text # price
      
    end


    
end
#Scrapper.url