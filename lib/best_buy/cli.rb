class Controller
    def call
        main_menu
           input = nil
        while input !=  "exit"
        input= gets.strip.downcase
            case input
           when "deal"
            message
            file=deal
            sleep 1.0
            puts "To see Bonus Deals of the Day press 'bonus'"
            when"bonus"
            message   
            bonus_deals
            when "more info"
                message
                info(file)
            when "exit"
                puts "Good bye have a good day"
            else
                puts "Invaild command please type a vaild command."
                puts ""
                puts "what would you like to do, press current deals or exit."
            end

        end
    end
        def  deal
            file=Scraper.url
            if file.message == "Add to Cart"
                price=file.price.split(" ").map {|x| x[/\d+/]}.compact.join("").to_i
                puts "Today's deals: #{file.name} $#{price}" 
                    sleep 0.9
                    puts "These deals end at midnight tonight!!"
                puts "For more information please type more info"
            else
                puts "There are no deals today see www.bestbuy.com for great coupons"
                file # is the object file.url
            end
        end
        
        
     
        def info
            Scraper.more_info ()
            binding.pry
            puts  <<-DOC
            Moreinfo
            ================
            1. #{item.long_name} 
            
            2.#{item.long_price}
           
            3. #{item.info}
            4.Great you saved #{item.saved}
            --------------------------------
            Thank you for shopping at Best Buy
            DOC
        end
                def  bonus_deals
                bonus=Scraper.bonus_deals
                binding.pry
            # puts "Today's bonus deals: #{file.name} $#{file.price}"
                end
                def main_menu
                    puts""
                    puts "====================================="
                    puts "Welcome to Best Buy Deal of the day."
                    puts ""
                    puts "To see today's deal enter 'deal'."
                    puts "what would you like to do"
                    puts""
                    puts "To quit type exit. "
                end
                
        
        def    message
                puts "Hold on one second we are searching the web ..........................."
                puts ""
                puts ""
                sleep 0.8
                puts "Sorry for the wait , your patience is duly noted !" 
        end

         






end
