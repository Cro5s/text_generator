# Lines 3 - 11 opens and preps the text file for the text generator

file_data = ""

puts "Drag text file here:"

File.open(gets.chomp).each do |line|
  file_data += line
end

text = file_data.to_s
  
# Turns entered text file into an 100 word paragraph with new punctuations and sentence structure.
def text_generator(text)
  words = text.split(" ")
  stripped_words = []

  words.each do |word|
    stripped_word = word_stripper(word)
    stripped_words.push(stripped_word)
  end

  paragraph = paragraph_builder(stripped_words)
  paragraph
end

# Takes the word input into the function and removes all punctuation
def word_stripper(word)
  
  # Makes sure that the word I remains capitalized
  if word == "i" or word == "I" 
    result = word.upcase 
  else
    # Removes any punctuations and anything else I assumed needed to be removed. 
    result = word.gsub(/[!()*:?.,;]/, "").downcase 
  end

  result
end

# Builds a paragraph with a maximum of 100 words
def paragraph_builder(stripped_words)
  sentences = []
  
  while sentences.length < 10
    words = stripped_words.slice!(0..9) # Makes sure that stripped_words removes words already sent into sentence_builder
    sentences.push(sentence_builder(words))    
  end

  sentences.join(" ")
end

# Takes the given array of words and builds a sentence containing a maximum of 10 words starting with a capital letter and ending with a period
def sentence_builder(words)
  sentence = [];

  words.each_with_index do |word, idx|

    if idx == 0
      sentence.push(word.capitalize) # Capitalizes every first word
    elsif idx == 9
      sentence.push(word + ".") # Appends a period to every last word
    else
      sentence.push(word)
    end

  end

  sentence
end

# Iterate over each word in the words array
# Add each word to the new line string while its less than 80 characters
# return the string when it reaches 80 characters

def character_limit(words)
  line_characters = ""
  line_length = 0
  words_array = words.split(" ")

  words_array.each do |word|

    if line_length < 80 && (line_length + word.length) <= 80
      line_characters += word
      line_length += word.length
    else
      line_length = 0
      line_characters += "\n" + word
      line_length += word.length

    end
  end

  return line_characters
end

p text_generator(text)