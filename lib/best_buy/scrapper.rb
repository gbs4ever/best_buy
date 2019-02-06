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

#scrapper 1 trending deals
#def self.scrape_index_page get url from hope page
doc = Nokogiri::HTML(open("https://deals.bestbuy.com/"))
#@file=doc.css(".deals-ul-0 li")#.attribute("href")
#end

# we need these things scrapped
# url of item,name, price  will need diffrent css selector
#css product_info_block
#scrapper one ul.class name
#scrapper 2   item price  on sale(true) old price  free shipping smalldata on item

def url
    doc = Nokogiri::HTML(open("https://www.bestbuy.com/site/misc/deal-of-the-day/pcmcat248000050016.c?id=pcmcat248000050016"))
  # file=doc.css(".offer-link  a").attribute("href").value
  #name file=doc.css(".offer-link  a").text
  #url need to add www.bestbuy to link file=doc.css(".offer-link  a").attribute("href").value
   #price data file=doc.css(".sr-only").text
  #on sale  doc.css(".pricing-price__sale-message").text


  #page 2 info

 #amont saved doc.css("div .pricing-price__savings").text
 #more info doc.css("div #long-description").text
# name  doc.css("h1").text
#price  doc.css("span.sr-only")[0].text
    binding.pry
end

end
