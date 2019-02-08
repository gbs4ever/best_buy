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
            marketing
            puts ""
            puts "To see Bonus Deals of the Day press 'bonus'"
            puts "====================================="
            when"bonus"
            message 
            bonus_deals
            when "menu" 
            main_menu
            when "more info"
                message
                info
                main_menu
            when "exit"
                puts "Good bye have a good day"
            else
                puts "Invaild command please type a vaild command."
                puts ""
                exit_message
            end
        end
    end
        def  deal
             file=Scraper.url
            if file.message == "Add to Cart"
                output(file)
             else
                puts "There are no deals today see www.bestbuy.com for great coupons"
              
            end
            @file =file# is the object file.url
        end
        
        
     
        def info
            file=@file
           Scraper.more_info(file) # the instance of the item class is not 
            puts  <<-DOC
            Moreinfo
           
    ===========================
    1. Get this now !! #{file.long_name} 
    2.#{file.price}
    3.Great  #{file.saved}
    4. #{file.info}

    -----------------------------------------------------
    Lets go, this item is not #{file.sale} for long! 
    To purchase click here "#{file.url}"
        
    Thank you for shopping at Best Buy , Have a wonderful day!
    DOC
        exit_message
        end
   
        def  bonus_deals
        deal=Scraper.bonus_deals
           deal.each_with_index do |file, i|
            price=file.price.split(" ").map {|x| x[/\d+/]}.compact.join("").to_i
            #binding.pry
                puts  <<-DOC
                    
        ===========================
            Bonus deal # #{i+1}.
        1. Get this now !! 
        2.#{file.name}
        3. $#{price}

        Lets go, this item is not on sale for long! 
        To purchase click here "#{file.url}"
        ===========================
        DOC
               
        end
          # exit_message
        end

       





        #static messages 
        def  output(file)
            price=file.price.split(" ").map {|x| x[/\d+/]}.compact.join("").to_i
            puts "Today's deals: #{file.name} $#{price}" 
        end

        def output_info
            puts  <<-DOC
            Moreinfo
           
    ===========================
    1. Get this now !! #{file.long_name} 
    2.#{file.price}
    3.Great  #{file.saved}
    4. #{file.info}

    -----------------------------------------------------
    Lets go, this item is not #{file.sale} for long! 
    To purchase click here "#{file.url}"
        
    Thank you for shopping at Best Buy , Have a wonderful day!
    DOC



end
        def main_menu
            puts""
            puts "====================================="
            puts "Welcome to Best Buy Deal of the day."
            puts ""
            puts "To see today's deal enter 'deal'."
            # puts "To get to main
            puts""
            puts "To quit type exit. "
            puts "====================================="
        end
                
        
        def message 
            puts "Hold on one second we are searching the web ..........................."
            puts ""
            puts ""
            sleep 0.8
            puts "Sorry for the wait , your patience is duly noted !" 
            puts ""
            puts ""
        end

        def marketing
            puts ""
            puts "These deals end at midnight tonight!!"
            puts "For more information please type more info"
        end  
        
        def exit_message
            puts ""
            puts "what would you like to do, press  deal or exit."
            puts ""
        end 
end
