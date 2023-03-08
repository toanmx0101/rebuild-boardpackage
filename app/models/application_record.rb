# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def file_url file
    return nil unless file.try(:attached?) || file.try(:processed?)

    if [ :test, :local ].include? Rails.application.config.active_storage.service
      Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true)
    else
      file.service_url
    end
  end
end
