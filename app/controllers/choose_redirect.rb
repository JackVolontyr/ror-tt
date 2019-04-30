module ChooseRedirect
  extend ActiveSupport::Concern

  protected

  module ClassMethods
    def choose_redirect(item, edit_item_path)
      redirect_to item if end_changes?
      redirect_to edit_item_path if continue_changes?
    end
  end

  def continue_changes?
    params[:commit] == "Сохранить и остаться"
  end

  def end_changes?
    params[:commit] == "Готово!"
  end
end