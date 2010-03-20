### *** Default Admin ***
#
# NOTE: the admin password should be moved to some other safer place
# For now we'll keep it here though

admin_email = "admin@premezcla.com"
puts "-- Creating Super Admin: #{admin_email}"

admin = User.find_or_create_by_email admin_email
admin.password = "password"
admin.password_confirmation = "password"
admin.email_confirmed = true
admin.name = 'Admin'
admin.save!
puts "\t - Done!"

