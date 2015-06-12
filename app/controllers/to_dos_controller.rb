class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.order(:position  )
  end

  def create
    @to_do = ToDo.new(to_do_params)
    respond_to do |format|
      if @to_do.save
        # client = Twilio::REST::Client.new(Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token)
        # message = client.messages.create(from: "(713) 597-6652", to: "(281) 682-4786", body: "You've added a new to-do: #{@to_do.desc}")

        format.html { redirect_to root_url }
        format.js
      else
        format.html { redirect_to root_url, notice: 'Your to-do item was invalid'}
      end
    end

  end

  def destroy
    @to_do = ToDo.find(params[:id])
    @to_do.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
    @to_do = ToDo.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @to_do = ToDo.find(params[:id])
    @to_do.update_attributes(to_do_params)

    respond_to do |format|
      format.js
    end
  end

  def toggle_checkbox
    @to_do = ToDo.find(params[:to_do_id])
    @to_do.completed == true ? @to_do.completed = false : @to_do.completed = true
    # if @to_do.completed == true
    #   @to_do.completed = false
    # else
    #   @to_do.completed = true
    # end

    puts @to_do.inspect
    @to_do.save

    respond_to do |format|
      format.js
    end
  end

  def re_sort
    params[:to_do].each_with_index do |id, index|
      to_do = ToDo.find(id)
      to_do.position = index + 1
      to_do.save
    end


    render :nothing => true, :status => 200, :content_type => 'text/html'

  end

  private

    def to_do_params
      params.require(:to_do).permit(:desc)
    end
end
