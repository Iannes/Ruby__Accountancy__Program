class Account < Array

		puts "\nWelcome to the best accountancy program in the world!"
	puts "Here you can create records for your clients, as well\nas calculate balances and credits !"
	

	def initialize name
	
		$name = name
		$balance = 0
		$rem_balance = 0
		$new_balance = 0
		$debit = 0
		$credit = 0
		$sum = 0
		$new_total = 0
		
		

		puts "#{$name} is your new client."
		client = $name
		create_balance
	end



	def create_balance 

		print "\nPlease enter starting balance : "
		$balance = gets.chomp.to_i
		puts "Initial balance is: £ #{$balance}."
		balance = $balance
		create_credit
	end
	
	def create_credit
		print "\nPlease enter #{$name}'s credit : "
		$credit = gets.chomp.to_i
		puts "#{$name}'s credit is : £ #{$credit}"
		remaining_balance
	end
	
	def remaining_balance
		
		$rem_balance = $balance - $credit
		puts "Remaining balance is : £ #{$rem_balance}."
		receipts_debit
	
	end
	
	def receipts_debit
	array =[]
	
	print "\nPlease insert any receipts to #{$name}'s account :"
	$debit = gets.chomp.to_i
	$new_balance = $rem_balance + $debit
	puts "#{$name}'s receipt is : £ #{$debit} "
	puts "and the new balance is : £ #{$new_balance}"



				
               # Assign instance variables to local to put in array
                 balance = $balance
				 new_balance = $new_balance
				 credit =$credit
				 debit = $debit
				 name = $name

				array.push name
				array.push balance
			#c  
				array.push credit
			#d
				array.push debit

			#total
			array.push new_balance	

				
				

			   # Assign instance variables to local to put in array


	
	
	puts "\n******************************************"
	
		puts "\nClient's name is : #{array[0]}"
		#balance
		puts "#{$name}'s starting balance was : £ #{array[1]}"
		#credit
		puts "#{$name}'s credit is : £ #{array[2]}"
		#debit
		puts "#{$name}'s debit is : £ #{array[3]}"
		#total
		puts "#{$name}'s total balance before VAT is : £ #{array[4]}"
		#credit
	
	# Ask User To Clear Screen
		clear_code = %x{clear}

		puts "\n**************************************************"
		puts 'Please hit ENTER to clear the screen and continue.'
		puts "\n**************************************************"
		$stdin.gets
		print clear_code

		vat_method
		
					
	end

	def vat_method

		        array_new =[]
				

	            # VAT loop and total

				puts "\nPlease insert all VAT for #{$name}'s account\nand once you're done type 'exit': "
				

				
				
				while (input = gets.chomp) != 'exit'
				  data = input.to_i
				  array_new.push data
				  
				
				$sum = array_new.reduce :+
				$sum.to_i

				balance = $balance.to_i
				
				
				
				end
				puts
				print "\n#{$name}'s total VAT is: "
				print $sum
				total_after_vat($new_balance, $sum)
			end

				
				 def total_after_vat (b, s)

					$new_total = b - s
					puts
				    print "\n#{$name}'s total balance after VAT is: £ #{$new_total} "
				    puts
				  
					
				end






end

print "\nPlease insert Client's name: "
reply = gets.chomp.to_s




name =  Account.new(reply.capitalize)
				

				


			
				
				# total_balance = sum - balance
				#puts "And #{$name}'s total after VAT is: "
				#puts total_balance
				#


                 # VAT loop and total



#puts "Saving information to data.txt"

#puts "Your file named 'data' is saved on your Programs folder."
#fname = File.open("data.txt", "w+") {|f| array_new.each {|element| f.puts(element)}}





