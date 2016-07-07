require 'rails_helper'

describe BookmarkPolicy do
  subject { BookmarkPolicy.new(user, article) }

  let(:bookmark) { FactoryGirl.create(:bookmark) }

  context "for a visitor" do
    let(:user) { nil }

    it { should     permit(:show)    }

    it { should_not permit(:create)  }
    it { should_not permit(:new)     }
    it { should_not permit(:update)  }
    it { should_not permit(:edit)    }
    it { should_not permit(:destroy) }
  end

#  context "for a user" do
#    let(:user) { FactoryGirl.create(:user) }
#
#    it { should permit(:show)    }
#    it { should permit(:create)  }
#    it { should permit(:new)     }
#    it { should permit(:update)  }
#    it { should permit(:edit)    }
#    it { should permit(:destroy) }
#  end
end
