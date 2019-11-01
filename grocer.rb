require 'pry'
def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0
   while i < collection.length do
    if collection[i][:item] == name
      return collection[i]
     end
       i += 1
  end
end

def consolidate_cart(cart)
new_cart = []
i = 0
  while i < cart.length do
    new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    if new_cart_item
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        item: cart[i][:item],
        price: cart[i][:price],
        clearance: cart[i][:clearance],
        count: 1
      }
      new_cart << new_cart_item
    end
    i += 1
  end
  new_cart
end

def apply_coupons(cart, coupons)
i = 0
while i < coupons.length
  cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
  coupon_item_name = "#{coupons[i][:item]} W/COUPON"
  cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[i][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[i][:num]
        cart_item[:count] -= coupons[i][:num]
      else
        cart_item_with_coupon = {
          item: coupon_item_name,
          price: coupons[i][:cost] / coupons[i][:num],
          clearance: cart_item[:clearance],
          count: coupons[i][:num]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[i][:num]
      end
    end
  i += 1
end
 cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
i = 0
while i < cart.length do
    if cart[i][:clearance]
      cart[i][:price] =  (cart[i][:price] - (cart[i][:price] * 0.20)).round(2)
    end
    i += 1
  end
cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
total = 0
index = 0

cart = consolidate_cart(cart)
pp cart
cart = apply_coupons(cart, coupons)
pp cart
cart = apply_clearance(cart)
pp cart

whi



  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
