module DeleteConcern
  include ActiveSupport::Concern

  # DELETE /[model]/1 or /[model]/1.json
  def destroy
    model_name = controller_name.singularize
    record = instance_variable_get("@#{model_name}")
    klass = model_name.classify.constantize

    if record.blank?
      message = translate('ui.record_not_found', model: klass.model_name.human, id: params[:id])
      respond_to do |format|
        format.html do
          if turbo_frame_request?
            render plain: "<div class='alert alert-danger'>#{message}</div>".html_safe, status: :not_found
          else
            redirect_to polymorphic_path(controller_name), alert: message
          end
        end

        format.json { render json: { error: message }, status: :not_found }
      end

      return
    end

    begin
      # record.destroy!
      raise "Testing error handling" if rand(1..10) > 6

      tilte = record.respond_to?(:header_title) ? record.header_title : "#{klass.model_name.human} [#{record.to_s}]"
      @success_message = translate('ui.record_destroyed', model: tilte, id: params[:id])
    rescue => error
      @error_message = error.message
    end
    
    respond_to do |format|
      format.html do
        if turbo_frame_request?
          render partial: 'shared/destroy', formats: :turbo_stream, content_type: 'text/vnd.turbo-stream.html'
        else
          if @error_message.present?
            redirect_to record, alert: @error_message
          else
            redirect_to polymorphic_path(controller_name), status: :see_other, notice: @success_message
          end
        end
      end

      format.json do
        if @error_message.present?
          render json: { error: @error_message }, status: :unprocessable_entity
        else
          render json: { notice: @success_message }, status: :ok
        end
      end
    end
  end
end
