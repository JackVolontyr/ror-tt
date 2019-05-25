module ChooseRedirectType
  extend ActiveSupport::Concern

  protected

  def continue_changes?
    params[:commit] == "Сохранить и остаться"
  end

  def end_changes?
    params[:commit] == "Сохранить и выйти"
  end
end