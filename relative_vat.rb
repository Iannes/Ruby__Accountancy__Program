
require_relative 'test_vat'

def vat_method

		        array_new =[]
				sum = 0

	            # VAT loop and total

				puts "Please insert all VAT for #{$name}'s receipts and once you're done press 'exit': "
				

				
				
				while (input = gets.chomp) != 'exit'
				  data = input.to_i
				  array_new.push data
				  
				
				sum = array_new.reduce :+
				sum.to_i

				balance = $balance.to_i
				puts "#{$name}'s total VAT is: "
				puts sum
				
				end

				total_after_vat
			end

				
				def total_after_vat (b, s)

					$balance.to_i = b
					$sum.to_i = s

					new_total = b - s
					puts new_total
					
				end