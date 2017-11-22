require 'rails_helper'

RSpec.describe Table, :type => :model do
  let!(:table) { create(:table) }

  context 'associations' do
    it { should have_many(:reservations) }
  end

  context 'validations' do
    it { should validate_presence_of(:chairs) }
    it { should validate_presence_of(:name) }
  end

  context 'class_methods' do
    context '.find_vacants' do
      it { expect(Table.find_vacants(Time.now.strftime('%Y-%m-%d %H:%M'), 1).length).to eql(1) }
    end
  end
end
