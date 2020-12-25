require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)

  if coupons.length == 0
    return cart
  end

  cart.each do |item_hash|
     coupons.each do |hash|
      item_coupon = hash[:item]
      item_name = item_coupon + " W/COUPON"
      coupon_num = hash[:num]
      coupon_cost = hash[:cost]
      price_each = coupon_cost / coupon_num
    if item_hash[:item] == item_coupon && item_hash[:count] >= hash[:num]
      item_hash[:count] = item_hash[:count] - coupon_num
      cart << {item: item_name, price: price_each.round(2),                 
                clearance: item_hash[:clearance], count: coupon_num}
    end
  end
end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item_hash|
    if item_hash[:clearance] == true
      item_hash[:price] = item_hash[:price] * 0.8
      item_hash[:price] = item_hash[:price].round(2)
    end
  end
  cart
end

def checkout(cart, coupons)

  cart1 = consolidate_cart(cart)
  cart2 = apply_coupons(cart1, coupons)
  cart =apply_clearance(cart2)
  total = 0.0
  cart.each do |item_hash|
    item_hash[:price].round(2)
    total += item_hash[:price] * item_hash[:count]
    total.round(2)
  end
  if total > 100
    total = total * 0.9
    total.round(2)
  end
  total
end
