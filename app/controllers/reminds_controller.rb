class RemindsController < ApplicationController
  def index
    @reminds = Remind.all
  end

  def new; end
  
  def edit
    @remind = Remind.find(params[:id])
  end

  def create
    @remind = Remind.new(remind_params)
    if @remind.save
      flash[:success] = t('messages.create.success')
      redirect_to reminds_path
    else
      flash[:error] = t('messages.create.error')
      render 'new'
    end
  end

  def update
    if Remind.find(params[:id]).update(remind_params)
      flash[:success] = t('messages.update.success')
      redirect_to reminds_path
    else
      flash[:error] = t('messages.update.error')
      render 'edit'
    end
  end

  private

  def remind_params
    params.require(:remind).permit(:name, :message_remind, :delay_days)
  end
end