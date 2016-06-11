require 'rails_helper'

RSpec.describe User, type: :model do

  describe "attributes" do
    it { should have_db_column(:username) }
    it { should have_db_column(:email) }
  end
end
