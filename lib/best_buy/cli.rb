class Controller
  def call
    main_menu
    input = nil
    while input != 'exit'
      input = gets.strip.downcase
      case input
      when 'deal'
        message
        deal
        puts ''
        puts "To see Bonus Deals type 'bonus'"
        puts '====================================='
      when 'bonus'
        message
        bonus_deals
      when 'menu'
        sub_menu
      when 'all'
        all_deals
      when 'more info'
        message
        info
        sub_menu
      when 'exit'
        puts 'Good bye have a good day'
      else
        puts 'Invaild command please type a vaild command.'
        puts ''
        exit_message
        end
    end
  end

  def deal

    @file ||= Scraper.url # is the object file.url
    if @file.message == 'Add to Cart' || @file.message == 'Check Stores'
      output(@file)
    else
      puts 'There are no deals today see https://www.bestbuy.com for great coupons'
      puts 'Come back tomorrow for some great deals!'
     end
   
  end

  def info

    Scraper.more_info(@file) # the instance of the item class is not
    puts <<-DOC
            Moreinfo

    ===========================
    1. Get this now !! #{@file.long_name}
    2.#{@file.price}
    3.Great  #{@file.saved}
    4. #{@file.info}

    -----------------------------------------------------
    Lets go, this item is not #{@file.sale} for long!
    To purchase click here "#{@file.url}"

    Thank you for shopping at Best Buy , Have a wonderful day!
    DOC
    exit_message
  end

  def bonus_deals
    @@deal ||= Scraper.bonus_deals
    @@deal.each_with_index do |file, i|
      price = file.price.split(' ').map { |x| x[/\d+/] }.compact.join('')

      puts <<-DOC
    ===========================
        Bonus deal # #{i + 1}.
    1. Get this now !!
    2.#{file.name}
    3. #{file.price}
    4.#{file.sale}

    Lets go, this item is not on sale for long!
    To purchase click here "#{file.url}"
    ===========================
      DOC
    end
end

  def all_deals
    puts(Item.all.length).to_s
  end

  # static messages
  def output(file)
    price = file.price.split(' ').map { |x| x[/\d+/] }.compact.join('').to_i
    puts "Today's deals: #{file.name} $#{price}"
    puts ''
    marketing
  end

  def main_menu
    puts <<-DOC
=====================================
Welcome to Best Buy Deal of the day.

To see today's deal enter 'deal'.


To quit type exit.
=====================================
    DOC
  end

  def message
    puts 'Hold on one second we are searching the web ...........................'
    puts ''
    puts ''
    sleep 0.9
    puts 'Sorry for the wait , your patience is duly noted !'
    puts ''
    puts ''
  end

  def marketing
    puts <<-DOC
    These deals end at midnight tonight!!
    For more information about the deal of the day please type 'more info'
    DOC
  end

  def exit_message
    puts ''
    puts '  what would you like to do, press menu or exit.'
    puts ''
  end

  def sub_menu
    puts <<-DOC
                        =====================================
                        Welcome to Best Buy Deal of the day.
                        1.Menu
                        2.Deal
                        3.Bonus
                        4.All
                        5.More info

                        To quit type exit.
                        =====================================
    DOC
  end

  def output_info # not active yet
    puts <<-DOC
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
end
