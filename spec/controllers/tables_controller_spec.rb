require 'rails_helper'

RSpec.describe TablesController, :type => :controller do
  let!(:tables) { create_list(:table, 5, chairs: 8) }

  describe 'GET search_vacant_for_reservation' do
    before { xhr :get, :search_vacant_for_reservation, reservation: { date_time: Time.now.strftime('%Y-%m-%d %H:%M'), seats: 4 } }

    it { expect(assigns(:tables).length).to eql(5) }
    it { expect(response).to have_http_status(200) }
    it { expect(response).to render_template('tables/search_vacant_for_reservation') }
  end

  describe 'GET index' do
    before { get :index }

    it { expect(assigns(:tables).length).to eql(5) }
    it { expect(response).to have_http_status(200) }
    it { expect(response).to render_template('tables/index') }
  end

  describe 'GET new' do
    before { get :new }

    it { expect(assigns(:table).id).to be_nil }
    it { expect(response).to have_http_status(200) }
    it { expect(response).to render_template('tables/new') }
  end

  describe 'POST create' do
    before { post :create, { table: { name: 'Table A', chairs: 5 } } }

    it { expect(assigns(:table).id).not_to be_nil }
    it { expect(assigns(:table).name).to eql('Table A') }
    it { expect(assigns(:table).chairs).to eql(5) }
    it { expect(response).to redirect_to tables_path }
  end

  describe 'GET edit' do
    before { get :edit, id: tables.first.id }

    it { expect(assigns(:table).id).not_to be_nil }
    it { expect(response).to have_http_status(200) }
    it { expect(response).to render_template('tables/edit') }
  end

  describe 'PUT update' do
    before { put :update, { id: tables.first.id, table: { name: 'Table A', chairs: 5 } } }

    it { expect(assigns(:table).id).not_to be_nil }
    it { expect(assigns(:table).name).to eql('Table A') }
    it { expect(assigns(:table).chairs).to eql(5) }
    it { expect(response).to redirect_to tables_path }
  end

  describe 'DELETE destroy' do
    before { delete :destroy, id: tables.first.id }

    it { expect(assigns(:table).destroyed?).to eql(true) }
    it { expect(response).to redirect_to tables_path }
  end
end
