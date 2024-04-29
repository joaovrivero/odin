def stock_picker(prices)
  if prices.length < 2
    return "Not enough prices to pick from"
  end

  max_profit = 0
  buy_day = 0
  sell_day = 0

  (0...prices.length).each do |i|
    (i+1...prices.length).each do |j|
      profit = prices[j] - prices[i]
      if profit > max_profit
        max_profit = profit
        buy_day = i 
        sell_day = j 
      end
    end
  end

  return [buy_day, sell_day]
end

prices = [7, 1, 5, 3, 6, 4]
best_buy_day, best_sell_day = stock_picker(prices)
puts "Best day to buy: #{best_buy_day}"
puts "Best day to sell: #{best_sell_day}"
