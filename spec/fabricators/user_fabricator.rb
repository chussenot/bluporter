# encoding: utf-8
Fabricator(:user) do
  email                   { sequence(:email) { |i| "user-#{Time.now.to_f}-#{i}@example.com" } }
end