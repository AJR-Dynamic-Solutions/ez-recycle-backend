class RecyclesController < ApplicationController
        def index
          recycles = Recycle.all
          render json: recycles
        end
      
        def create
          recycle = Recycle.create(recycle_params)
          if recycle.valid?
            render json: recycle
          else
            render json: recycle.errors, status: 422
          end
        end
      
        private
        def recycle_params
          params.require(:recycle).permit(:item, :category, :description, :price, :city, :state, :email, :whatsapp_user, :image, :user_id)
        end
      end