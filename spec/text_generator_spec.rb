require "text_generator"

describe "word_stripper" do
  it "should return the word without any punctuations (example: !;.,:?()* ) or capitalization" do
    expect(word_stripper("APPLE")).to eq("apple")
    expect(word_stripper("aPpLe")).to eq("apple")
    expect(word_stripper("(*A.l,w:a;Ys!?)")).to eq("always")
    expect(word_stripper("i")).to eq("I")
  end
end

describe "character_limit" do
  it "should the amount of characters per line to 80" do
    sentence = "Makes me way way waaaaaay less than 80 characters please! Makes me way way waaaaaay less than 8011 another word"
    new_sentence = character_limit(sentence)
    puts new_sentence
    # puts new_sentence.length
    expect(new_sentence.split("\n")[0].length).to eq(77)
    expect(new_sentence.split("\n")[1].length).to eq(4)
  end
end
