=begin
- Write a method that accepts a 10 character string of letters (both uppercase and lowercase)
- if not 10 characters in length, return false
- else:
  - define an empty string to a variable (phone_num) - *already done
  - loop through 10 character string (word) - *already done
  - compare letter to telephone mappings and concatenate to the variable (phone_num)
  - return the variable (phone_number)
----------------
- You may need to ensure the letter casing of the input string
=end

def yellow_pager(word)
    phone_num = ""
  
    # ** complete the if expression and statement to meet the condition **
    if word.length == 10
      word.each_char do |letter|
        # ** complete the conditions to map letters to numbers **
        if letter == "a" || letter == "b" || letter == "c"
          phone_num += 2
      elsif letter == "d" || letter == "e" || letter == "f"
          phone_num += 3

      elsif letter == "g" || letter == "h" || letter == "i"
          phone_num += 4

      elsif letter == "j" || letter == "k" || letter == "l"
          phone_num += 5

      elsif letter == "m" || letter == "n" || letter == "0"
          phone_num += 6

      elsif letter == "p" || letter == "q" || letter == "r" || letter == "s"
          phone_num += 7

      elsif letter == "t" || letter == "u" || letter == "v"
          phone_num += 8

      elsif letter == "w" || letter == "x" || letter == "y" || letter == "z"
          phone_num += 9
      else

        phone_num += letter

      end
           
      end
  
      return phone_num
  
    else
  
      return "not a valid word"
      
    end
  end
  
  # ** call method and pass the variable here (you may need to print (puts) the return value) **
  yellow_pager_word = "Lighthouse"

  puts yellow_pager(yellow_pager_word)