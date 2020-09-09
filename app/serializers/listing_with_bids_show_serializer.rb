class ListingWithBidsShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :category, :lead, :scene, :description, :address, :price
  attribute :images
  has_many :biddings, serializer: BiddingsSerializer

  #should not send of bids if listing already has tenant

  def images
    images_to_return = []
    object.images.each do |image|
      if Rails.env.test?
        images_to_return << {url: rails_blob_url(image)}
      else
        images_to_return << {url: image.service_url(expires_in: 1.hour, disposition: "inline")}
      end
    end
    images_to_return
  end
end