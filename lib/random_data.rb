module RandomData
  def self.random_paragraph
    sentences = []
    rand(4..6).times { sentences << random_sentence }
    sentences.join(" ")
  end

  def self.random_sentence
    strings = []
    rand(3..8).times { strings << random_word }
    strings.join(" ").capitalize << "."
  end

  def self.random_word
    letters = ('a'..'z').to_a.shuffle
    letters[0,rand(3..8)].join
  end
end
