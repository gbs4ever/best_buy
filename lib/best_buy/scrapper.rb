require 'pry'
class Scrapper
    attr_accessor :name, :price ,:url, :instock, :shipping
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
deals_url=doc.css("ul .deals-ul-0 li") #need to grap the link fix this 
end
    

#scrapper 2 
    def self.deal_of_the_day(deals_url)
    #doc = Nokogiri::HTML(open("https://www.bestbuy.com/site/misc/deal-of-the-day/pcmcat248000050016.c?id=pcmcat248000050016"))
    doc = Nokogiri::HTML(open(deals_url))
    #@url_info=item.url=doc.css(".offer-link  a").attribute("href").value
    item.name=doc.css(".offer-link  a").text # name of item
    #item.url doc.css(".offer-link  a").attribute("href").value #need to add www.bestbuy to link file=
    item.price=doc.css(".sr-only").text # price 
    item.sale = doc.css(".pricing-price__sale-message").text #on sale should return true 
    end
    

#scrapper 3

    def self.more_info(@url_info)
        doc = Nokogiri::HTML(open(url_info))
        data.saved  =doc.css("div .pricing-price__savings").text #amont saved
        data.info =doc.css("div #long-description").text #more info
        data.name =doc.css("h1").text    # name
        data.price  doc.css("span.sr-only")[0].text # price
        binding.pry
    end

end
