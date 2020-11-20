$(document).on 'turbolinks:load', ->
  # Setup sidenav
  $('.sidenav').sidenav()

  return

$(document).on 'turbolinks:before-cache', ->
  # Destroy sidenav
  sidenav = $('.sidenav')
  sidenavInstance = M.Sidenav.getInstance(sidenav)
  sidenavInstance.destroy()

  return