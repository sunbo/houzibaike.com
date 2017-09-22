class ExposePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @expose = model
  end

  def index?
    @current_user.admin?
  end

end
