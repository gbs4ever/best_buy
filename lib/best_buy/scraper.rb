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
   
    @@doc1 = Nokogiri::HTML(open(deals_url))
   doc =@@doc1.css("div.offer-column.oneUp.col-xs-12")

    name=doc.css(".offer-link  a").text # name of item
    url = "https://www.bestbuy.com"
    url +=doc.css(".offer-link  a").attribute("href").value # link file
    price=doc.css("span.sr-only").text if doc.css("span.sr-only") # price 
    sale = doc.css("div.pricing-price__sale-message").text #on sale should return true 
    message= doc.css("div .add-to-cart-button").text
    Item.new(name, price, url, sale, message)
  
    
    end

    def self.bonus_deals
        list_main=@@doc1.css("div.widget-list-offer-container")
        list= list_main.css(".row")
        list.each.with_index  do |item,i| item
            #scrapped data
        name=item.css("h3").text
        url = "https://www.bestbuy.com"
       url+=item.css("h3 a").attribute("href").value # link file
       price_data=item.css(".col-xs-4").first.text
       price=price_data.split(" ")[0]
       Item.new(name, price, url)
        end
    end

            


    def self.more_info(item) # item should be object
        
        doc = Nokogiri::HTML(open(item.url))
        item.saved =doc.css("div .pricing-price__savings").text #amont saved
        item.info =doc.css("div #long-description").text #more info
        item.long_name =doc.css("h1").text    # name
        item.long_price =doc.css("span.sr-only")[0].text # price
        end


    
end
