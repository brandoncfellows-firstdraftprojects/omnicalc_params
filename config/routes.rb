Rails.application.routes.draw do
    
  get("/flexible/square/:input_num",{:controller => "calcs", :action => "flex_square"})
  get("/flexible/square_root/:input_num",{:controller => "calcs", :action => "flex_root"})
  get("/flexible/payment/:basis_points/:years/:principal",{:controller => "calcs", :action => "flex_payment"})
  get("/flexible/random/:min/:max", {:controller => "calcs", :action => "flex_random"})
  get("/square/new", {:controller => "calcs", :action => "form_square"})
  get("/square/results", {:controller => "calcs", :action => "form_square_results"})
  get("/square_root/new", {:controller => "calcs", :action => "form_root"})
  get("/square_root/results", {:controller => "calcs", :action => "form_root_results"})
  get("/payment/new", {:controller => "calcs", :action => "form_payment"})
  get("/payment/results", {:controller => "calcs", :action => "form_payment_results"})
  get("/random/new", {:controller => "calcs", :action => "form_random"})
  get("/random/results", {:controller => "calcs", :action => "form_random_results"})
  get("/word_count/new", {:controller => "calcs", :action => "form_word"})
  get("/word_count/results", {:controller => "calcs", :action => "form_word_results"})
  get("/descriptive_stats/new", {:controller => "calcs", :action => "form_stats"})
  get("/descriptive_stats/results", {:controller => "calcs", :action => "form_stats_results"})
  get("/",{:controller => "calcs", :action => "form_square"})
  
end
