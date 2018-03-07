class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def dashboard?
    user.present?
  end

  def downgrade?
    user.try(:premium?)
  end
end
