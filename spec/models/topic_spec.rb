require 'rails_helper'

RSpec.describe Topic, type: :model do

  describe "attributes" do
    it { should have_db_column(:title) }
    it { should have_db_column(:user_id) }
  end

  describe "associations" do
    it { should have_many(:bookmarks).dependent(:destroy) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_length_of(:title).is_at_least(3) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user) }
  end
end
