class ClearSearchHistoryJob < ApplicationJob
  def perform
    SearchHistory.clear
  end
end
