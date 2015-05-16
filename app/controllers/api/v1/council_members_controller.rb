module Api
  module V1
    class CouncilMembersController < ApplicationController      
      respond_to :json

      def index
        @council_members = CouncilMember.all
        respond_with @council_members, status: 200
      end

    end
  end
end