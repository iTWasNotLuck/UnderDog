
#set class 
#define initialize with (words)
#dictionary pull, set as instance variable
#.MAP to individuate each line(word) in to an array, &:CHOMP to remove whitespace
#create a method invoker to test code


class Wordplay 
  def initialize(words)
    @words = File.readlines(words).map(&:chomp)

  end



##[ Question ] What are all of the words containing UU?
  #define method to check all words that .INCLUDE 'UU'
  #call @WORDS .SELECT each element as |word| block variable
  #loop through each word for words containing 'UU'

  def words_with_uu
    @words.select { |word| word.include?('UU') }
  
 end


  

##[ Question ] What are all of the words containing an X and a Y and a Z?

  ###Edge case : checking output for double letter sets 'XX' 'YY' 'ZZ' : none occur

    #define method to output all words containing an X, a Y, AND a Z
    #call words, .SELECT each word to loop through 
    #check each element for words with an X AND a Y AND a Z

    def words_with_x_y_z
      @words.select { |word| word.include?('X') && word.include?('Y') && word.include?('Z') }  

 end


  
  

##[ Question ] What are all of the words containing a Q but not a U?

  ###Edge case: writing second line of code for method that outputs words with ONE 'Q' and DO NOT include the letter 'U'

  #define method to find words containing a Q but not a U
  #call words, SELECT each and set as block 
  #INCLUDE ? ('Q') !INCLUDE? ('U')

  
###ALT CODE: for 1(Q) & NO (U) - returns 2 less elements:
#  @words.select { word| word.count('Q') == 1 && !word.include?('U') }  #


 
  def words_with_q_not_u
    @words.select { |word| word.include?('Q') && !(word.include?('U')) }
    
end

  

  

##[ Question ] What are all of the words that contain the word CAT and are exactly 5 letters long?

   #define method to find all words containing the string CAT that are 5 letters in length
   #call words, select each to loop through looking for .INCLUDE. ('CAT')
   #&& word .LENGTH == 5 

  def words_with_cat_str_length_5
    @words.select { |word| word.include?('CAT') && word.length == 5 }
  
end


  
  

##[ Question ] What are all of the words that have no E or A and are at least 15 letters long?

  #define method: all words that DO NOT contain E !or! A && are minimum 15 letters 
  #call words, select each to a block variable
  #loop through each word selecting words that DO NOT (!)INCLUDE?: E or A 
  #&& checking those word are at least 15 characters in length

  def words_without_letter_e_or_a_with_minimum_fifteen_chars
    @words.select { |word| !word.include?('E') && !word.include?('A') && word.length >= 15 }

end


  
  

##[ Question ] What are all of the words that have a B and an X and are less than 5 letters long?

  #define method finding all words that contain !a! B and !an! X and are UNDER 5 letters long
  #call words, select to iterate through each as word 
  #find words with .COUNT (1) 'A' and (1) 'X' 
  #&& make sure it IS LESS THAN 5 characters long

  def words_with_one_a_and_x_under_five_chars
    @words.select { |word| word.count('B') == 1 && word.count('X') == 1 && word.length < 5 }

end


  
  
  
##[ Question ] What are all of the words that both start and end with a Y?

   #define method finding all words that .START_WITH && .END_WITH the letter 'Y'
   #call words, select to loop through each as |word|
   #use .START_WITH and .END_WITH to find words that BEGIN AND END with ('Y')

   def words_begin_and_end_lettr_y
     @words.select { |word| word.start_with?('Y') && word.end_with?('Y') }
   
end


  
  
  
##[ Question ] What are all of the words with no vowel and not even a Y?

   #define method finding all words that contain NO! VOWEL and NO! 'Y'
   #define vowels 
   #call words, select each to loop through as |word|
   #call vowels, using CHARS search for each |vowel| and that ALL? are !NOT INCLUDE in WORD
   #&& that those words, DO NOT INCLUDE 'Y'

   def words_no_vowels_no_y
     vowels = 'AEIOU'
     @words.select do |word|
       vowels.chars.all? { |vowel| !word.include?(vowel) && !word.include?('Y') } 
     
    end
  end



  

##[ Question ] What are all of the words that have all 5 vowels, in any order?

  #define method all words containing all 5 vowels, vowel order NOT important
  #define vowels
  #call words, select each to iterate through as |word|
  #call vowels, seperating each letter with .CHARS and looking for .ALL? with |vowel|
  #search words for INCLUDE? VOWELS 

  def words_incl_each_vowel
    vowels = 'AEIOU'
    @words.select do |word|
      vowels.chars.all? { |vowel| word.include?(vowel) }

    end
  end




##[ Question ] What are all of the words that have all 5 vowels, in alphabetical order?

  ###EDGE CASE: I have a word starting with U, it matches the ask by containing A E I O U in order but, 
  #a U does come before A E I O U, which is not exactly 'appearing' in alphabetical order
  #only allow word to contain 1 of each letter?

   #define method finding all words containing all 5 vowels, in ALPHABET ORDER
   #find method that will return letters in particular order
   #call words, select to loop through each
   #check for words that .MATCH (/A.*E.*I.*O.*U/)

   ###ALT CODE: this code would ensure A appears before E, E appears before I, I appears before etc. etc.
    #&& word.index('A') < word.index('E') && word.index('E') < word.index('I') &&
    #word.index('I') < word.index('O') && word.index('O') < word.index('U') }

  def words_with_all_vowels_in_alph_order 
    @words.select { |word| word.match(/A.*E.*I.*O.*U/) }

  end
  
  


#GO LONGBOARD OR RUN!
###Setting up storage to use during a for loop, including counters and arrays


  

##[ Question ] How many words contain the substring "TYPE”?

#this question makes the method name tricky, with the ambiguity of 'TYPE' - being that it could be a 'type of substring'

#NOTE: Counting the amount of occurances of the SUB-STRING 'TYPE' - EXCLUDING the string 'TYPE' (from 208 to 207 occurances)

   #define method to find all words containing the SUBSTRING = 'TYPE' then COUNT and output
   #create variable to store 'TYPE' .INCLUDE? matches 
   #pull words, select and create block variabe
   #words that INCLUDE? string 'TYPE' = matches
   #&& remove the word 'TYPE' being a string, not a SUBstring 
   #.COUNT matches 
   
  def num_words_contain_the_substr_type
    matches = []
     @words.each do |word| 
      if word.include?('TYPE') &&
       word != 'TYPE'
        matches << word
        end   
      end
     matches.count 
  
  end




##[ Question ] Create and print an array containing all of the words that end in "GHTLY"

    #define method as words that end with the substring 'GHTLY'
    #create ghtly_matches for storage
    #pull @words, use .SELECT and create block variable
    #GHTLY_matches = find words with .END_WITH 'GHTLY' 
    #I'm going to not use my print method....
    #store that in GHTLY_matches array
    #set GHTLY_matches to print

  def words_end_with_ghtly
    ghtly_matches = []
        @words.select do |word| 
          if word.end_with?('GHTLY') 
        ghtly_matches << word 
        end
      end
   print ghtly_matches  
 
end



##[ Question ] What is the shortest word that contains all 5 vowels?

#Define method finding the shortest word that contains all 5 vowels
#set an open storage for shortest_word
#define vowels
#pull words, select through each and set block variable |word| - Set equal to VOWEL_WORDS
#pull vowels and set EACH CHAR ALL? 
#WORD .INLCUDE?() 
#find the shortest word = vowel_word.min_by { |word| word.length }


 def shortest_word_with_all_vowels
    shortest_word = ''
       vowels = 'AEIOU'
          vowel_words = @words.select do |word|
        vowels.chars.all? { |vowel| word.include?(vowel) }
      end
   shortest_word = vowel_words.min_by { |word| word.length }
  
end




  
##[ Question ] What is the longest word that contains no vowels?

  ###EDGE CASE: There are multiple(4) 7 letter words that tie for 'longest_word'
  #find ALL longest words with NO vowels
  

   #define method finding longest word, containing NO vowels
   #set container for longest_word
   #define vowels
   #set non_vowel_words = @words..
   #call EACH CHAR of vowels, set as |vowel| NOT-INCLUDE !word.include?(vowel)
   #drop ends' set longest_word = vowel_words using max_by

   def longest_word_no_vowels
      longest_word = ''
         vowels = 'AEIOU'
           no_vowel_words = @words.select do |word|
         vowels.chars.all? { |vowel| !word.include?(vowel) }
         end
     longest_word = no_vowel_words.max_by { |word| word.length }
    
  end
  
  
###ALT CODE:this code outputs ALL of the longest words with no vowels
#  def all_longest_word_no_vowels
#      all_longest_words = ''
#       vowels = 'AEIOU'
#         no_vowel_words = @words.select { |word|
#         vowels.chars.all? { |vowel| !word.include?(vowel) } }
#        no_vowel_max_length = no_vowel_words.map(&:length).max
#      all_longest_words = no_vowel_words.select { |word| word.length == no_vowel_max_length }
#     all_longest_words
#      
#     end
  
#  end

  ### I created this method to output ALL max length words found with NO-vowels
  #I use the first half of my code with non_vowel_words output 
  #I then use MAP&:LENGTH to get all NO_VOWEL word lengths and MAX for the highest #
  #I loop through all no_vowel_words measuring word LENGTH to the MAX number in no_vowel_max
  #all the longest words that match MAX are output 


  

##[ Question ] Which of the letters Q, X, and Z is the least common?

   #define method finding of the 3 letters Q, X, and Z, which is least common
   #create storage hash to hold keys = letters, and value = number
   #pull words, SELECT to iterate through |word| block 
   #break word down to EACH CHAR 
   #find the number each letter is used through-out the dictionary, add to hash
   #call hash with key = letter , value = number of instances

  def which_letter_least_q_x_z
    letter_count = { 'Q' => 0, 'X' => 0, 'Z' => 0 }
    @words.each do |word|
      word.each_char do |chars|
        if letter_count.include?(chars)
          letter_count[chars] += 1
        end
      end
    end
    letter, count = letter_count.min_by { |letter, count| count }
    #letter_count < will display all keys and values

end


  

##[ Question ] What is the longest palindrome?


  ####EDGE CASE - As in my previous method:'longest word no vowels' - there may be multiple palindromes of the same max length : There isn't (thank goodness)

  
  #define method as thee longest palindrome
  #set longest_palindrom variable for storage
  #call words, SELECT set as |word| 
  #check word is == to word .REVERSE this finds all palindromes
  #&& = word.max_by { |max_pal| word.length } (i couldn't get this way to work)
  #I set an && for word.length to be greater than longest_palindrome.length
  #giving me the longest palindrome thats been looped through

  def longest_palindrome
    longest_palindrome = ''
        @words.select do |word| 
          if word == word.reverse && 
            word.length > longest_palindrome.length
          longest_palindrome = word
        end
      end
      longest_palindrome
end



  

##[ Question ] What are all of the letters that never appear consecutively in an English word? For example, we know that “U” isn’t an answer, because of the word VACUUM, and we know that “A” isn’t an answer, because of “AARDVARK”, but which letters never appear consecutively?

   #define method finding all double letter sets of words, then find what letter is not used, 
   #then output ONE letter for each letter not used. 
   #set matches array or if possible DOES NOT match empty array
   #define method double_letter_sets_not_found
   #define double letter sets (AA..ZZ) : set in block variable
   #call words, set block, run loop finding all occurances or if possible NONE?(?)
   #take the letter sets not found and convert back in to single letter - possibly by double letter alphabet == traditional alphabet?

  
def double_letter_sets_not_found
  matches = []
     double_alph = ('AA'..'ZZ').select { |i| i[0] == i[1] }
        double_alph.each do |dubs| 
         if !@words.any? { |word| word.include?(dubs) }
         matches << dubs
        end
      end
     matches.map!(&:chop)
    end

end


wordplay = Wordplay.new('sowpods.txt')

puts wordplay.words_with_uu
puts wordplay.words_with_x_y_z
puts wordplay.words_with_q_not_u
puts wordplay.words_with_cat_str_length_5
puts wordplay.words_without_letter_e_or_a_with_minimum_fifteen_chars
puts wordplay.words_with_one_a_and_x_under_five_chars
puts wordplay.words_begin_and_end_lettr_y
puts wordplay.words_no_vowels_no_y
puts wordplay.words_incl_each_vowel
puts wordplay.words_with_all_vowels_in_alph_order
puts wordplay.num_words_contain_the_substr_type
puts wordplay.words_end_with_ghtly
puts wordplay.shortest_word_with_all_vowels
puts wordplay.longest_word_no_vowels
puts wordplay.which_letter_least_q_x_z
puts wordplay.longest_palindrome
puts wordplay.double_letter_sets_not_found