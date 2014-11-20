document.addEventListener 'DOMContentLoaded', (evt) ->

  # Fade out extraneous text
  setTimeout ->
    Velocity
      elements: document.querySelectorAll('span.extra')
      properties: { opacity: 0.55 }
      options: { duration: 5000 }
  , 3000

  fireModal = ->
    Velocity
      elements: document.querySelector('.help')
      properties: { opacity: 0.5, width: '50%' }
      options: { display: 'block', duration: 1000 }

  button = document.querySelector('button')
  button.addEventListener 'click', fireModal, false
