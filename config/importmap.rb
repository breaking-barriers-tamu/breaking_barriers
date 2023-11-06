# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "navbar"
pin "footer"
pin "delete_confirmation_dialog"
pin "profile"
pin "registration"
pin "announcements_index"
print "announcements_form"


pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "sweetalert2", to: "https://ga.jspm.io/npm:sweetalert2@11.7.31/dist/sweetalert2.all.js"

