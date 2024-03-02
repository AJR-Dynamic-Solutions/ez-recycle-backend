require 'rails_helper'

RSpec.describe Recycle, type: :model do
    let(:user) { User.create(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
      )
    }
  
it 'should validate item' do
      recycle = user.recycles.create(
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: "1234567890",
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2'
        )
      expect(recycle.errors[:item]).to include("can't be blank")
    end

    it 'should validate category' do
      recycle = user.recycles.create(
        item: "Shirt",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: "1234567890",
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2'
      )
      expect(recycle.errors[:category]).to include("can't be blank")
    end
  
    it 'should validate description' do
      recycle = user.recycles.create(
        item: "Shirt",
        category: "clothing",
        price: 10,
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: "1234567890",
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2'
      )
      expect(recycle.errors[:description]).to include("can't be blank")
    end

    it 'should validate price' do
      recycle = user.recycles.create(
        item: "Shirt",
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        city: 'Oceanside',
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: "1234567890",
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2'
      )
      expect(recycle.errors[:price]).to include("can't be blank")
    end

    it 'should validate city' do
      recycle = user.recycles.create(
        item: "Shirt",
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        state: 'California',
        email: 'bobevans@gmail.com',
        whatsapp_user: "1234567890",
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2'
      )
      expect(recycle.errors[:city]).to include("can't be blank")
    end

      it 'should validate state' do
      recycle = user.recycles.create(
        item: "Shirt",
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: "Oceanside",
        email: 'bobevans@gmail.com',
        whatsapp_user: "1234567890",
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2'
      )
        expect(recycle.errors[:state]).to include("can't be blank")
  end

it 'should validate email' do
      recycle = user.recycles.create(
        item: "Shirt",
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: "Oceanside",
        state: "California",
        whatsapp_user: "1234567890",
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2'
      )
        expect(recycle.errors[:email]).to include("can't be blank")
end

it 'should validate whatsapp_user' do
      recycle = user.recycles.create(
        item: "Shirt",
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: "Oceanside",
        state: "California",
        email: 'bobevans@gmail.com',
        image: 'https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2'
      )
        expect(recycle.errors[:whatsapp_user]).to include("can't be blank")
end

it 'should validate image' do
      recycle = user.recycles.create(
        item: "Shirt",
        category: "Clothing",
        description: 'Mens Large Sweatshirt',
        price: 10,
        city: "Oceanside",
        state: "California",
        email: 'bobevans@gmail.com',
        whatsapp_user: "1234567890",
      )
        expect(recycle.errors[:image]).to include("can't be blank")
end
end
