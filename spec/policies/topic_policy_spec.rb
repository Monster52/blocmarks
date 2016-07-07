require 'rails_helper'

describe TopicPolicy do
  subject { TopicPolicy.new(user, topic) }

  let(:topic) { create(:topic) }

  context "for a visitor" do
    let(:user) { nil }

    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context "for an authenticated user" do
    let(:user) { create(:user) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }

    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context "for an authenticated / authorized user" do
    let(:user) { create(:user) }
    let(:topic) { create(:topic, user_id: user.id)}

    it { is_expected.to permit_action(:show)}
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end
end
