Factory.define :user do |user|
  user.sequence(:email) {|n| "user#{n}@ticketee.org"}
  user.password 'password'
  user.password_confirmation 'password'
end
