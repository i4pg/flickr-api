class StaticPagesController < ApplicationController
  def home
    return unless params[:user_id]

    @response = RestClient.get('https://www.flickr.com/services/rest/?method=flickr.photos.search',
                               params: { user_id: params[:user_id], format: 'json', nojsoncallback: '1', api_key: ENV['FLICKR_KEY'], secret_key: ['FLICKR_SECRET'] }, accept: :json)
  end
end
