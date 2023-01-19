# (1..100).each do |num|
#     if num % 3 == 0 && num % 5 == 0
#         puts "Fizzbuzz" + " " + "#{num}"
#     elsif num % 5 == 0
#         puts "Buzz" + " " + "#{num}"
#     elsif num % 3 == 0
#         puts "Fizz" + " " + "#{num}"
#     else
#         puts num
#     end


# (1..100).each do |num|
#     fizz = (num % 3 == 0)
#     buzz = (num % 5 == 0)
#     if fizz && buzz
#         puts "Fizzbuzz" + " " + "#{num}"
#     elsif fizz
#         puts "Buzz" + " " + "#{num}"
#     elsif buzz
#         puts "Fizz" + " " + "#{num}"
#     else
#         puts num
#     end
# end

for i in (1..100) do
    fizz = (i % 3 == 0)
    buzz = (i % 5 == 0)
    if fizz && buzz
        puts "Fizzbuzz" + " " + "#{i}"
    elsif fizz
        puts "Buzz" + " " + "#{i}"
    elsif buzz
        puts "Fizz" + " " + "#{i}"
    else
        puts i
    end
end

