require "text_generator"

describe "word_stripper" do
  it "should return the word without any punctuations (example: !;.,:?()* ) or capitalization" do
    expect(word_stripper("APPLE")).to eq("apple")
    expect(word_stripper("aPpLe")).to eq("apple")
    expect(word_stripper("(*A.l,w:a;Ys!?)")).to eq("always")
    expect(word_stripper("i")).to eq("I")
  end
end