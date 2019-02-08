class Controller
    def call
        main_menu
           input = nil
        while input !=  "exit"
        input= gets.strip.downcase
            case input
           when "deal"
            message
            deal
            sleep 1.0
            puts "To see Bonus Deals of the Day press 'bonus'"
            puts "====================================="
            when"bonus"
            message   
            bonus_deals
            when "more info"
                message
                info
                main_menu
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
                
            end
            @file =file# is the object file.url
                
        end
        
        
     
        def info
            file=@file
           
            Scraper.more_info(file) # the instance of the item class is not 
            #getting passed in from the method above 
        #   binding.pry
            puts  <<-DOC
            Moreinfo
     ===========================
        1. #{file.long_name} 
            
        2.#{file.long_price}
        3.Great  #{file.saved}
        4. #{file.info}
            
---------------------------------------
        Lets go this item is not #{file.sale} for long! 
           
        Thank you for shopping at Best Buy , Have a wonderful day!
        DOC

        end
    def  bonus_deals
               bonus=Scraper.bonus_deals
               #bonus.each do |data|  data end
                binding.pry
                #info.price.
            # puts "Today's bonus deals:#{info.name }"
            # puts  "$#{info.price}"
 #            end
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
                    puts "====================================="
                end
                
        
        def    message
                puts "Hold on one second we are searching the web ..........................."
                puts ""
                puts ""
                sleep 0.8
                puts "Sorry for the wait , your patience is duly noted !" 
                puts ""
                puts ""
        end

         






end
