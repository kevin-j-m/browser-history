module DatetimeHelper
  def l_datetime(timestamp, placeholder: "", **opts)
    if timestamp.present?
      l(timestamp, **opts)
    else
      placeholder
    end
  end
end

