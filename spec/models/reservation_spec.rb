require 'rails_helper'

RSpec.describe Reservation, :type => :model do
  let!(:table) { create(:table) }
  let!(:reservation) { create(:reservation, table_id: table.id, date_time: Time.now.strftime('%Y-%m-%d %H:%M'), seats: table.chairs) }

  context 'associations' do
    it { should belong_to(:table) }
  end

  context 'validations' do
    it { should validate_presence_of(:seats) }
    it { should validate_presence_of(:date_time) }
    it { should validate_presence_of(:table_id) }
  end

  context 'scope' do
    it { expect(Reservation.active_and_reserved).to be_a(ActiveRecord::Relation) }
    it { expect(Reservation.active_and_reserved.length).to eql(1) }
  end

  context 'methods' do
    context '#formatted_date_time' do
      it { expect(reservation.formatted_date_time).to eql(Time.now.strftime('%Y-%m-%d %H:%M')) }
    end
  end

end
