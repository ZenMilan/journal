document.addEventListener 'DOMContentLoaded', (evt) ->

  daylight = document.querySelector('.daylight')
  skylight = document.querySelector('.skylight')
  mtn           = document.querySelector('.mtn')
  sky           = document.querySelector('.sky')
  bgImgs        = document.querySelectorAll('.bg-img')
  contactButton = document.querySelector('button')

  launchEmail = (e) ->
    e.preventDefault()
    str = "kevin+dingus+pruett+brule+tatanka+bison+gmail"
    split = str.split('+')
    window.location.href = "mailto:#{split[2]}.#{split[0]}@#{split[6]}.com?subject=Let's work together"

  createImageFrom = (bgImg) ->
    bgImg = window.getComputedStyle(bgImg).backgroundImage
    bgImgUrl = bgImg.replace(/url\(['"]?(.*?)['"]?\)/i, "$1")
    image = document.createElement('img')
    image.src = bgImgUrl

  createImageFrom bgImg for bgImg in bgImgs

  contactButton.addEventListener 'click', launchEmail, false

  imagesLoaded document.querySelector('.scene'), (instance) ->

    Velocity
      elements: sky
      properties: { opacity: [1, 'easeIn', 0], translateZ: [0, 'easeInSine', 300] }
      options: { duration: 3000 }

    Velocity
      elements: mtn
      properties: { opacity: [1, 'easeIn', 0], translateZ: [0, 'easeInSine', 55] }
      options: { duration: 800, delay: 1000 }

  Velocity
    elements: document.querySelectorAll('span.extra')
    properties: { opacity: 0.35 }
    options: { duration: 1000, delay: 4000 }

  Velocity
    elements: contactButton
    properties: { translateX: [0, [500, 30], -500] }
    options: { duration: 1400, delay: 5000 }

  Velocity
    elements: daylight
    properties: { backgroundColor: ['#000', '#000'], backgroundColorAlpha: [0.5, 0.001] }
    options: { duration: 3000, delay: 4000 }

  Velocity
    elements: skylight
    properties: { backgroundColor: ['#000', '#000'], backgroundColorAlpha: [0.75, 0.001] }
    options: { duration: 7000, delay: 4000 }
