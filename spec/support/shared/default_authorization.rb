shared_examples 'default authorization' do
  it 'requires login to index' do
    get :index
    expect(response.status).to eq 401
  end

  it 'requires login to show' do
    get :show, id: object.id
    expect(response.status).to eq 401
  end

  it 'requires login to create' do
    post :create
    expect(response.status).to eq 401
  end

  it 'requires an admin to update' do
    as create :user, :peasant
    patch :update, id: object.id
    expect(response.status).to eq 401
  end

  it 'requires an admin to delete' do
    as create :user, :peasant
    delete :destroy, id: object.id
    expect(response.status).to eq 401
  end
end
