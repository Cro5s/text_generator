
# Turns entered text file into an 100 word paragraph with new punctuations and sentence structure.
def text_generator(text)
  words = text.split(" ")
  stripped_words = []

  words.each do |word|
    stripped_word = word_stripper(word)
    stripped_words.push(stripped_word)
  end

  paragraph = paragraph_builder(stripped_words)
  # paragraph.length
end

# Takes the word input into the function and removes all punctuation
def word_stripper(word)
  
  if word == "i" or word == "I"
    result = word.upcase 
  else
    result = word.gsub(/[!()*:?.,;]/, "").downcase
  end

  result
end

# Builds a paragraph with a maximum of 100 words
def paragraph_builder(stripped_words)
  sentences = []
  
  while sentences.length < 10
    words = stripped_words.slice!(0..9)
    sentences.push(sentence_builder(words))    
  end

  sentences.join(" ")
end

# Takes the given array of words and builds a sentence containing a maximum of 10 words starting with a capital letter and ending with a period
def sentence_builder(words)
  sentence = [];

  words.each_with_index do |word, idx|

    if idx == 0
      sentence.push(word.capitalize)
    elsif idx == 9
      sentence.push(word + ".")
    else
      sentence.push(word)
    end

  end

  sentence
end

text = "INTRODUCTION.

After considering the historic page, and viewing the living world
with anxious solicitude, the most melancholy emotions of sorrowful
indignation have depressed my spirits, and I have sighed when
obliged to confess, that either nature has made a great difference
between man and man, or that the civilization, which has hitherto
taken place in the world, has been very partial.  I have turned
over various books written on the subject of education, and
patiently observed the conduct of parents and the management of
schools; but what has been the result? a profound conviction, that
the neglected education of my fellow creatures is the grand source
of the misery I deplore; and that women in particular, are rendered
weak and wretched by a variety of concurring causes, originating
from one hasty conclusion.  The conduct and manners of women, in
fact, evidently prove, that their minds are not in a healthy state;
for, like the flowers that  are planted in too rich a soil,
strength and usefulness are sacrificed to beauty; and the flaunting
leaves, after having pleased a fastidious eye, fade, disregarded on
the stalk, long before the season when they ought to have arrived
at maturity.  One cause of this barren blooming I attribute to a
false system of education, gathered from the books written on this
subject by men, who, considering females rather as women than human
creatures, have been more anxious to make them alluring mistresses
than rational wives; and the understanding of the sex has been so
bubbled by this specious homage, that the civilized women of the
present century, with a few exceptions, are only anxious to inspire
love, when they ought to cherish a nobler ambition, and by their
abilities and virtues exact respect."

p text_generator(text)

# Introduction After considering the historic page and viewing the living. World with anxious solicitude the most melancholy emotions of sorrowful. Indignation have depressed my spirits and I have sighed when. Obliged to confess that either nature has made a great. Difference between man and man or that the civilization which. Has hitherto taken place in the world has been very. Partial I have turned over various books written on the. Subject of education and patiently observed the conduct of parents. And the management of schools but what has been the. Result a profound conviction that the neglected education of my.