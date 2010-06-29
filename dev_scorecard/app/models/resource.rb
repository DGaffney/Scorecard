class Resource < ActiveRecord::Base
  has_attachment :storage => :file_system,
                 :max_size => 2.megabytes,
                 :resize_to => '900x700>',
                 :thumbnails => { :thumb => '200x200', :geometry => 'x10' }
  validates_as_attachment
  belongs_to :case
  belongs_to :user

  # after_create :associate_cases
  #The block will be executed just before the thumbnail is saved.
  #We need to set extra values in the thumbnail class as
  #we want it to have the same extra attribute values as the original image
  #except for the default flag that is always set to false
  before_thumbnail_saved do |record|
    record.user_id = record.parent.user_id
    record.case_id = record.parent.case_id
    record.default = false
  end
  
  def source_url=(url)
    return nil if not url
    http_getter = Net::HTTP
    uri = URI.parse(url)
    response = http_getter.start(uri.host, uri.port) {|http|
      http.get(uri.path)
    }
    case response
    when Net::HTTPSuccess
      file_data = response.body
      return nil if file_data.nil? || file_data.size == 0
      self.content_type = response.content_type
      self.temp_data = file_data
      self.filename = uri.path.split('/')[-1]
    else
      return nil
    end
  end
  
  # def associate_resources
  #   self.case = Case.find(self.case_id) 
  #   if !self.case.nil?
  #     if self.case.original_resource_id == self.id
  #       self.case.original_resource_id = self.id
  #     elsif self.case.derivative_resource_id == self.id
  #       self.derivative_resource.case_id = self.id
  #     end
  # 
  #   end
  #   if !self.derivative_resource.nil?
  #     
  #   end
  # end
  # 
end
