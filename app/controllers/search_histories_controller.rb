class SearchHistoriesController < ApplicationController
  def destroy
    ClearSearchHistoryJob.perform_later

    redirect_to root_url, status: :see_other
  end
end
