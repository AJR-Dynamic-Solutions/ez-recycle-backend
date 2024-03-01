require 'rails_helper'

RSpec.describe Recycle, type: :model do
    let(:user) { User.create(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
      )
    }
  
    it 'should validate category' do
      recycle = user.recycles.create(
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
  end
