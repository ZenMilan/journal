document.addEventListener 'DOMContentLoaded', (evt) ->

  fireModal = ->
    Velocity
      elements: document.querySelector('.help')
      properties: { opacity: 0.5, width: '50%' }
      options: { display: 'block', duration: 1000 }

  button = document.querySelector('button')
  button.addEventListener 'click', fireModal, false
