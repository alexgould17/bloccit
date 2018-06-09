module RandomData
  def self.random_paragraph
    sentences = []
    rand(4..6).times { sentences << random_sentence }
    sentences.join(" ")
  end

  def self.random_sentence
    words = []
    rand(3..8).times { words << random_phrase }
    words.join(" ").capitalize << "."
  end

  def self.random_phrase
    case rand(1..7)
    when 1
      Faker::Book.title
    when 2
      Faker::Cat.breed
    when 3
      Faker::Coffee.blend_name
    when 4
      Faker::Dog.breed
    when 5
      Faker::Food.dish
    when 6
      Faker::Pokemon.move
    when 7
      Faker::SiliconValley.app
    end
  end
end
