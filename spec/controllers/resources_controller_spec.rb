require 'rails_helper'

describe ResourcesController do
  render_views

  let(:resource) { create :resource }

  it 'lets anyone see resources' do
    as :peasant

    get :show, id: resource.id
    expect( response.json.url ).to eq resource.url
  end


  it 'lets admins update resources' do
    as :admin

    patch :update, id: resource.id, resource: { url: 'google.com/updated', description: 'Updated description' }
    get :show, id: resource.id
    expect( response.json.description ).to eq 'Updated description'
    expect( response.json.url ).to eq 'google.com/updated'
  end

  it 'lets admins delete resources' do
    as :admin

    delete :destroy, id: resource.id
    get :show, id: resource.id
    expect( response ).to be_missing
  end
end
