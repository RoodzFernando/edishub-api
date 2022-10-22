class Mutations::LoginUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType
  field :errors, [String], null: false

  def resolve(email:, password:)
    user = User.find_by_email(email).authenticate(password)
    if user.save
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end