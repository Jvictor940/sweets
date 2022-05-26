class VendorSweetsController < ApplicationController

    def index
        vendorsweets = VendorSweet.all
        render json: vendorsweets
    end 

    def show 
        vendorsweet = VendorSweet.find_by(id: params[:id])
        render json: vendorsweet
    end

    def create
        vendor = VendorSweet.create(vendor_id: params[:vendor_id], sweet_id: params[:sweet_id])
        if vendor.valid?
            render json: vendor, status: 200
        else
            render json: { error: vendor.errors.full_messages }, status: 404
        end
    end

    def destroy
        vendorsweet = VendorSweet.find_by!(id: params[:id])
        if vendorsweet
        vendorsweet.destroy
        head :no_content
        else 
            render json: { error: "VendorSweet not found" }
        end
    end
end