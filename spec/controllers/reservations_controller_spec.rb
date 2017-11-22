require 'rails_helper'

RSpec.describe ReservationsController, :type => :controller do
  let!(:table) { create(:table, chairs: 5, name: 'Table A') }
  let!(:reservation) { create(:reservation, table_id: table.id, name: 'Reservation A', date_time: Time.now.strftime('%Y-%m-%d %H:%M'), seats: 5) }

  describe 'GET index' do
    let!(:table_b) { create(:table, chairs: 6, name: 'Table B') }
    before { get :index }

    it { expect(assigns(:tables).length).to eql(2) }
    it { expect(assigns(:reservation).id).to be_nil }
    it { expect(assigns(:date_time)).to eql((Time.now + 1.hour).beginning_of_hour.strftime('%Y-%m-%d %H:%M')) }
    it { expect(response).to have_http_status(200) }
    it { expect(response).to render_template('reservations/index') }
  end

  describe 'POST create' do
    before { post :create, reservation: { seats: 5, date_time: Time.now.strftime('%Y-%m-%d %H:%M'), table_id: table.id } }

    it { expect(assigns(:reservation).id).not_to be_nil }
    it { expect(assigns(:reservation).table.id).to eql(table.id) }
    it { expect(assigns(:reservation).seats).to eql(5) }
    it { expect(response).to redirect_to edit_reservation_path(assigns(:reservation).id) }
  end

  describe 'GET edit' do
    before { get :edit, id: reservation.id }

    it { expect(assigns(:reservation).id).not_to be_nil }
    it { expect(assigns(:reservation).id).to eql(reservation.id) }
    it { expect(response).to have_http_status(200) }
    it { expect(response).to render_template('reservations/edit') }
  end

  describe 'GET show' do
    before { get :show, id: reservation.id }

    it { expect(assigns(:reservation).id).not_to be_nil }
    it { expect(assigns(:reservation).id).to eql(reservation.id) }
    it { expect(response).to have_http_status(200) }
    it { expect(response).to render_template('reservations/show') }
  end

  describe 'PUT update' do 
    before { put :update, { id: reservation.id, reservation: { date_time: Time.now.strftime('%Y-%m-%d %H:%M'), name: 'Reservation A', status: 'occupied', remarks: 'Nice Day' } } }

    it { expect(assigns(:reservation).name).to eql('Reservation A') }
    it { expect(assigns(:reservation).status).to eql('occupied') }
    it { expect(assigns(:reservation).formatted_date_time).to eql(Time.now.strftime('%Y-%m-%d %H:%M')) }
    it { expect(response).to redirect_to home_path }
  end

  describe 'DELETE destroy' do
    before { delete :destroy, id: reservation.id }

    it { expect(assigns(:reservation).destroyed?).to eql(true) }
    it { expect(response).to redirect_to reservations_path }
  end
end
