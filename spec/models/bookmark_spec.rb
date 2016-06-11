require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  describe "attributes" do
    it { should have_db_column(:url) }
    it { should have_db_column(:topic_id) }
  end

  describe "associations" do
    it { should belong_to(:topic) }
  end

  describe "validations" do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:topic) }
  end
end
