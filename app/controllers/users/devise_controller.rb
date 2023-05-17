class Users::DeviseController < ApplicationController
  # Define a custom responder class as a nested class inside the DeviseController
  class Responder < ActionController::Responder
    # Override the to_turbo_stream method to handle Turbo Streams format
    def to_turbo_stream
      # Render the response with the options merged with the HTML format
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => error
      if get?
        # If it's a GET request and the template is missing, raise the error
        raise error
      elsif has_errors? && default_action
        # If there are errors and a default action is defined, render the response with the specified options
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        # Redirect to the navigation location if none of the above conditions are met
        redirect_to navigation_location
      end
    end
  end

  # Set the custom responder class as the responder for the DeviseController
  self.responder = Responder

  # Specify the supported formats for the DeviseController
  respond_to :html, :turbo_stream
end
