require 'rails_helper'

RSpec.describe ReservationsHelper, :type => :helper do
  describe '#current_hour' do

    it 'should be equal to time range' do
      assign(:date_time, '2017-11-23 01:00')
      expect(helper.current_hour).to eql('01:00 AM - 02:00 AM')
    end
  end

  describe '#display_readable_date_time' do
    it { expect(helper.display_readable_date_time('2017-11-23 01:00'.to_time)).to eql('Nov 23, 2017 01:00 AM') }
  end
end
