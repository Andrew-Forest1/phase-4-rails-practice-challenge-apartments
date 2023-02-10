class LeasesController < ApplicationController
    before_action :find_lease, only: [:destroy]

    def destroy
        @lease.destroy
        render json: {}, status: :ok
    end

    def create
        render json: Lease.create!(lease_params)
    end

    private

    def find_lease
        @lease = Lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end
end
