require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  describe 'GET index' do

    context 'when there are reservations' do
      let!(:table) { create(:table) }
      let!(:reservation) { create(:reservation, table_id: table.id, seats: table.chairs, date_time: Time.now.strftime('%Y-%m-%d %H:%M')) }
      before { get :index }

      it { expect(assigns(:reservations).length).to eql(1) }
      it { expect(response).to have_http_status(200) }
    end

    context 'when there are no reservations' do
      before { get :index }

      it { expect(assigns(:reservations).length).to eql(0) }
      it { expect(response).to have_http_status(200) }
    end
  end
end
