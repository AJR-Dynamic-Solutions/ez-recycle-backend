require 'rails_helper'

RSpec.describe "Recycles", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a list of items for recycling' do
      recycle = Recycle.create(
        item: 'Shirt',
        category: 'Clothing',
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      )
      get '/recycles'

 expect(response).to have_http_status(200)
      recycle_response = JSON.parse(response.body)
      p recycle_response.length
  expect(recycle_response.length).to eq 1
  expect(recycle_response.first['item']).to eq('Shirt')
  expect(recycle_response.first['category']).to eq('Clothing')
      expect(recycle_response.first['description']).to eq('Mens Large Sweatshirt')
      expect(recycle_response.first['price']).to eq(10)
      expect(recycle_response.first['city']).to eq('Oceanside')
      expect(recycle_response.first['state']).to eq('California')
      expect(recycle_response.first['email']).to eq('bobevans@gmail.com')
      expect(recycle_response.first['whatsapp_user']).to eq('1234567890')
      expect(recycle_response.first['image']).to eq('https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2')
    end
  end

  it 'creates a new item' do 
    recycle_params = {
      recycle: {
        item: 'Shirt',
        category: 'Clothing',
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params

        expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      recycle = Recycle.find_by(id: json['id'])
      expect(recycle['item']).to eq('Shirt')
      expect(recycle['category']). to eq('Clothing')
      expect(recycle['description']).to eq('Mens Large Sweatshirt')
      expect(recycle['price']).to eq(10)
      expect(recycle['city']).to eq('Oceanside')
      expect(recycle['state']).to eq('California')
      expect(recycle['email']).to eq('bobevans@gmail.com')
      expect(recycle['whatsapp_user']).to eq('1234567890')
      expect(recycle['image']).to eq('https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2')
      expect(recycle['user_id']).to eq(user.id)
  end

  it "doesn't create an item without an item" do
    recycle_params = {
      recycle: {
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['item']).to include "can't be blank"
  end

  it "doesn't create an item without a category" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        description: "Mens Large Sweatshirt",
        price: 10,
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['category']).to include "can't be blank"
  end

  it "doesn't create an item without a description" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        category: "Clothing",
        price: 10,
        city: "Oceansde",
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['description']).to include "can't be blank"
  end


  it "doesn't create an item without a price" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        category: "Clothing",
        description: "Mens Large Sweatshirt",
        city: "Oceansde",
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['price']).to include "can't be blank"
  end

  it "doesn't create an item without a city" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        state: "California",
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params
    
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['city']).to include "can't be blank"
  end

   it "doesn't create an item without a state" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: "Oceanside",
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params
    
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['state']).to include "can't be blank"
  end

  it "doesn't create an item without an email" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: "California",
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params
    
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['email']).to include "can't be blank"
  end

  it "doesn't create an item without a whatsapp_user" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        catgory: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: "California",
        email: 'bobevans@gmail.com',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params
    
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['whatsapp_user']).to include "can't be blank"
  end

  it "doesn't create an item without an image" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: "California",
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        user_id: user.id
      }
    }
    post '/recycles', params: recycle_params
    
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['image']).to include "can't be blank"
  end

  it "doesn't create an item without a user id" do
    recycle_params = {
      recycle: {
        item: 'Shirt',
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: '1234567890',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2',
      }
    }
    post '/recycles', params: recycle_params
    
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['user_id']).to include "can't be blank"
  end

#   # Additional tests can be added here if needed
end