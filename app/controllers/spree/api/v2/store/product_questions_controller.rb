module Spree
    module Api
      module V2
        module Store
          class ProductQuestionsController < ::Spree::Api::V2::BaseController
            include Spree::Api::V2::CollectionOptionsHelpers
            before_action :load_user, only: [:index]
  
            def index
              render_serialized_payload {serialize_collection(paginated_collection)}
            end
  
            def show
              render_serialized_payload { serialize_resource(resource) }
            end
  
            private
  
            def scope
              Spree::ProductQuestion
            end
  
            def resource
              scope.find(params[:id])
            end
  
            def resource_serializer
              Spree::V2::Storefront::ProductQuestionSerializer
            end
  
            def collection_serializer
              Spree::V2::Storefront::ProductQuestionSerializer
            end
  
            def paginated_collection
              collection_paginator.new(collection, params).call
            end
  
            def collection
              Spree::ProductQuestion.where(user: @user)
            end
  
            def load_user
              @user = Spree::User.find(params[:user_id])
            end
          end
        end
      end
    end
  end