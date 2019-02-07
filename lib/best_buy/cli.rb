class Controller
    def call

        puts "Welcome to Best Buy Deal of the day."
        puts "To see today's deal enter 'deal'."
        puts "what would you like to do"
        puts "To quit type exit. "
       
 #remove white space in menu
 #bug 1 exit works but still puts out invaild command
        input = nil
        while input !=  "exit"
        input= gets.strip.downcase
            case input
           when "deal"
            message
            file=deal
            puts "To see Bonus Deals of the Day press 'bonus'"
           when"bonus"
            bonus_deals
            when "more info"
                info#(file)
            else
            puts "Invaild command please type a vaild command."
            #puts "what would you like to do, press current deals or exit."
            end

        end
    end
        def  deal
            file=Scraper.url
            if file.message == "Add to Cart"
                price=file.price.split(" ").map {|x| x[/\d+/]}.compact.join("").to_i
                puts "Today's deals: #{file.name} $#{price}" 
                    sleep 0.9
                puts "For more information please type yes"
            else
                puts "There are no deals today see www.bestbuy.com for great coupons"
                file
            end
        end
        
        
        #still broken
        def info(file=nil)# is the object
            #Scraper.more_info (file.url=nil)
            puts  <<-DOC
            Moreinfo
            ================
            1.  #{item.long_name} 
            
            2.#{item.long_price}
           
            3. #{item.info}
            4.Make sure to buy today you saved #{item.saved}
            --------------------------------
            Thank you for shopping at Best Buy
            DOC
        end
        def  bonus_deals
            puts "bonus deals lol"
        end
            def message
                puts "Hold on one second we are searching the web ..........................."
                puts "Sorry for the wait , your patience is duly noted !" 
            end

         #  Item.all.each.with_index  do |item,i| when i swirch do many deals









end
