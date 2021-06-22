# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  active     :boolean          default(TRUE)
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation rails_testing_rspec' do
    it 'ensures first_name presence' do
      user = User.new(last_name: 'Viet', email: 'test@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures last_name presence' do
      user = User.new(first_name: 'Le Thanh', email: 'test@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(first_name: 'Le Thanh', last_name: 'Viet').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(first_name: 'Le Thanh', last_name: 'Viet', email: 'test@example.com').save
      expect(user).to eq(true)
    end
  end
  context 'scope rails_testing_rspec' do
    let(:params) { { first_name: 'Le Thanh', last_name: 'Viet', email: 'test@example.com' } }
    before(:each) do
      User.new(params).save
      User.new(params).save
      User.new(params.merge(active: true)).save
      User.new(params.merge(active: false)).save
      User.new(params.merge(active: false)).save
    end

    it 'should return active users' do
      expect(User.active.size).to eq(3)
    end

    it 'should return inactive users' do
      expect(User.inactive.size).to eq(2)
    end
  end
end
