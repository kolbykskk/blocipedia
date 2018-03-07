class ChargesControllerPolicy

  attr_reader :user, :ctrlr

  def initialize(user, ctrlr)
    @user = user
    @ctrlr = ctrlr
  end

  def new?
    user.try(:standard?)
  end

  def create?
    user.try(:standard?)
  end

end
