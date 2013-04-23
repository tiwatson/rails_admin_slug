require 'rails_admin/config/fields/base'
require 'rails_admin/config/fields/types/string'


module RailsAdmin
  module Config
    module Fields
      module Types
        class Slug < RailsAdmin::Config::Fields::Types::String

          RailsAdmin::Config::Fields::Types::register(self)

          register_instance_option :source do
            @source ||= properties && properties[:source]
          end

          register_instance_option :html_attributes do
            {
              :maxlength => length,
              :size => [50, length.to_i].min,
              :'data-slug' =>  "#{self.abstract_model.model.name.underscore}_#{source}"
            }
           end
        end
      end
    end
  end
end