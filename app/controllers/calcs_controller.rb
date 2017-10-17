class CalcsController < ApplicationController

  def flex_square
      # The Parameters look like this: {"input_num" =>"42"}
      
      @input_number = params["input_num"].to_i
      @result = @input_number * @input_number
      
      render("calc_templates/flexible_square.html.erb")
  end
  
  def flex_root
      
      @input_number = params["input_num"].to_i
      @result = @input_number**0.5

    render("calc_templates/flexible_root.html.erb")
  end
  
  def flex_payment
  
   basis_points = params["basis_points"].to_f
   @apr = basis_points / 100
   @years = params["years"].to_i
   @principal = params["principal"].to_f
   
   @payment = @principal*((@apr/1200)/(1-(1+(@apr/1200))**(-@years*12)))
   
   render("calc_templates/flexible_payment.html.erb")
  end
  
  def flex_random
  
  @min = params["min"].to_i
  @max = params["max"].to_i
  
  @random = (@min + rand(@max - @min + 1))

  render("calc_templates/flexible_random.html.erb")

  end
  
  def form_square
  
  render("form_templates/form_square.html.erb")
  
  end
  
  def form_square_results
  
  @number = params["input_number"].to_f
  @square = @number**2
  
  render("form_results/form_square_results.html.erb")
  
  end
  
  def form_root
  
  render("form_templates/form_root.html.erb")
  
  end
  
  def form_root_results
  
  @number = params["input_number"].to_f
  @root = @number**0.5
  
  render("form_results/form_root_results.html.erb")
  
  end
  
  def form_payment
  
  render("form_templates/form_payment.html.erb")
  
  end
  
  def form_payment_results
  
  @apr = params["user_apr"].to_f
  @years = params["user_years"].to_f
  @principal = params["user_principal"].to_f
  
  @payment = @principal*((@apr/1200)/(1-(1+(@apr/1200))**(-@years*12)))
  
  render("form_results/form_payment_results.html.erb")
  
  end
 
  def form_random
  
  render("form_templates/form_random.html.erb")
  
  end
  
  def form_random_results
  
  @minimum = params["min"].to_f
  @maximum = params["max"].to_f
  
  @random = rand(@minimum..@maximum)
  
  render("form_results/form_random_results.html.erb")
  
  end

  def form_word
  
  render("form_templates/form_word.html.erb")
  
  end
  
  def form_word_results
  
    @text = params[:user_text]
    @special_word = params[:user_word]

    count = 0
    @text.gsub(/[^a-z0-9\s]/i, "").split.each do |word|
      if word==@special_word
        count = count + 1
      end 
    end 
    
    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/, "").length

    @occurrences = count
  
  render("form_results/form_word_results.html.erb")
  
  end
  
  def form_stats
  
  render("form_templates/form_stats.html.erb")
  
  end
  
  def form_stats_results
  
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum-@minimum

    @median = if @numbers.count.odd?
                @numbers.sort[@numbers.count/2 + 0.5]
              else
                (@numbers.sort[@numbers.count/2]+@numbers.sort[@numbers.count/2 - 1])/2
              end 

    @sum = @numbers.sum

    @mean = @sum / @count

    var=0
    @numbers.each do |num|
                 var = var + (num-@mean) ** 2 
                end 
                
    @variance = var / @count
                

    @standard_deviation = @variance ** 0.5

    mod=[]
    times=0
    @numbers.each do |num|
      @numbers.each do |num2|
        if num==num2
          times=times+1
        end 
      end 
      mod.push(times)
      times=0
    end 
    
    most=0
    while mod[most]!=mod.max
        most=most + 1
    end 
      
    @mode = @numbers[most]
  
  render("form_results/form_stats_results.html.erb")
  
  end
  
end