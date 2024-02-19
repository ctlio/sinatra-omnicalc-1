require "sinatra"
require "sinatra/reloader"


get("/howdy") do
  erb(:hello)
end

get("/goodybye") do
  erb(:bye)
end

get("/square/new")do

  erb(:new_square_calc)

end

get("/square/results") do
  @the_nums = params.fetch("number").to_f
  @the_results = @the_nums.to_f  ** 2.0

  erb(:square_results)

end

get("/square_root/new")do

  erb(:new_square_root_calc)

end

get("/square_root/results")do

  @the_nums = params.fetch("user_number").to_f
  @the_results = @the_nums ** 0.5

  erb(:square_root_results)

end


get("/payment/new")do

  erb(:payment_calc)

end

get("/payment/results") do

  
  @user_apr = params.fetch("user_apr").to_f 
  @apr = @user_apr.to_fs(:percentage, {:precision => 4})

  @user_years = params.fetch("user_years").to_f

  @user_pv =  params.fetch("user_pv").to_f
  @pv = @user_pv.to_fs(:currency)

  @monthly_interest_rate = @user_apr / 100 / 12
  @months_remaining = @user_years * 12

  @monthly_payment = @user_pv * (@monthly_interest_rate * (1 + @monthly_interest_rate)** @months_remaining) / ((1 + @monthly_interest_rate)** @months_remaining - 1)
 
  @payment = @monthly_payment.to_fs(:currency, {:precision => 2})

  erb(:payment_results)

end


get("/random/new")do

  erb(:random_new)

end

get("/random/results") do
  @user_min = params.fetch("user_min").to_f
  @user_max = params.fetch("user_max").to_f
  @rand_num = rand(@user_min..@user_max)
  @round_num = @rand_num.round(14)

  erb(:random_results)


end
get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
