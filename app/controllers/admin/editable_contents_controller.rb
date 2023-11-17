module Admin
  class EditableContentsController < ApplicationController
    before_action :set_editable_content

    def set_editable_content
      @editable_contet = EditableContent.first
    end

    def editable_content_params
      params.require(:editable_content).permit(:description)
    end

    def edit; end

    def update
      respond_to do |format|
        if EditableContent.first.update(editable_content_params)
          format.html do
            redirect_to(about_path, notice: 'Description was successfully updated!.')
          end
        else
          format.html do
            redirect_to(about_path, notice: 'Failed to update description!')
          end
        end
      end
    end
  end
end
