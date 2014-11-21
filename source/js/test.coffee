document.addEventListener 'DOMContentLoaded', (evt) ->

  setTimeout ->
    Velocity
      elements: document.querySelectorAll('span.extra')
      properties: { opacity: 0.35 }
      options: { duration: 5000 }
  , 3000

  launchEmail = (e) ->
    e.preventDefault()
    str = "kevin+dingus+pruett+brule+tatanka+bison+gmail"
    split = str.split('+')
    window.location.href = "mailto:#{split[2]}.#{split[0]}@#{split[6]}.com?subject=Let's work together"

  button = document.querySelector('button')
  button.addEventListener 'click', launchEmail, false
