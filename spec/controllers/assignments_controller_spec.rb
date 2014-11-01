require 'rails_helper'

describe AssignmentsController do
  render_views

  let(:assignment) { create :assignment }

  it 'lets anyone see assignments' do
    as :peasant

    get :show, id: assignment.id
    expect( response.json.description ).to eq assignment.description
  end


  it 'lets admins update assignments' do
    as :admin

    patch :update, id: assignment.id, assignment: { description: 'Updated description' }
    get :show, id: assignment.id
    expect( response.json.description ).to eq 'Updated description'
  end

  it 'lets admins delete assignments' do
    as :admin

    delete :destroy, id: assignment.id
    get :show, id: assignment.id
    expect( response ).to be_missing
  end
end
