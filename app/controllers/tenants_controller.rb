class TenantsController < ApplicationController
    before_action :find_tenant, only: [:show, :destroy, :update]

    def index
        render json: Tenant.all, status: :ok
    end

    def show
        render json: @tenant, status: :ok
    end

    def create
        render json: Tenant.create!(tenant_params), status: :created
    end

    def update
        @tenant.update!(tenant_params)
        render json: @tenant, status: :accepted
    end

    def destroy
        @tenant.destroy
        render json: {}, status: :ok
    end

    private

    def find_tenant
        @tenant = Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end
end
