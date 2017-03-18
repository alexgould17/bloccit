require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:vote) { Vote.create!(value: 1, post: post, user: user) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:value) }

  it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }

  describe "update_post callback" do
    it "triggers update_post on save" do
      expect(vote).to receive(:update_post).at_least(:once)
      vote.save!
    end

    it "#update_post should call update_rank on post " do
      expect(post).to receive(:update_rank).at_least(:once)
      vote.save!
    end
  end

  describe "#update_rank" do
    it "calculates the correct rank" do
      post.update_rank
      expect(post.rank).to eq (post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds)
    end

    it "updates the rank when an up vote is created" do
      old_rank = post.rank
      post.votes.create!(value: 1, user: user)
      expect(post.rank).to eq (old_rank + 1)
    end

    it "updates the rank when a down vote is created" do
      old_rank = post.rank
      post.votes.create!(value: -1, user: user)
      expect(post.rank).to eq (old_rank - 1)
    end
  end
end
