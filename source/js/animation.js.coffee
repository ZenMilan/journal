document.addEventListener 'DOMContentLoaded', (evt) ->

  daylight      = document.querySelector('.daylight')
  skylight      = document.querySelector('.skylight')
  mtn           = document.querySelector('.mtn')
  aboutTxt      = document.querySelector('h2.about')
  sky           = document.querySelector('.sky')
  stars         = document.querySelectorAll('.star')
  bgImgs        = document.querySelectorAll('.bg-img')
  contactBtn    = document.querySelector('button')
  screenWidth   = window.screen.availWidth
  screenHeight  = window.screen.availHeight / 30
  translateZMin = -900
  translateZMax = 100

  r = (min, max) ->
    Math.floor(Math.random() * (max - min + 1)) + min

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

  sceneAnimation =
    sky:
      elements: sky
      properties: { opacity: [1, 0], translateZ: [0, 300] }
      options: { duration: 3000, easing: 'easeInOutSine' }

    mtn:
      elements: mtn
      properties: { opacity: [1, 0], translateZ: [0, 55] }
      options: { duration: 800, delay: 1000, easing: 'easeInQuad' }

    showAboutTxt:
      elements: aboutTxt
      properties: { translateX: [0, [500, 30], -600] }
      options: { duration: 1400 }

    extraTxt:
      elements: aboutTxt.querySelectorAll('span.extra')
      properties: { opacity: 0.35 }
      options: { duration: 1000 }

    contactBtn:
      elements: contactBtn
      properties: { translateX: [0, [500, 30], -500] }
      options: { duration: 1400 }

    daylight:
      elements: daylight
      properties: { backgroundColor: ['#000', '#000'], backgroundColorAlpha: [0.66, 0.001] }
      options: { duration: 4000, delay: 4000 }

    skylight:
      elements: skylight
      properties: { backgroundColor: ['#000', '#000'], backgroundColorAlpha: [0.70, 0.001] }
      options: { duration: 7000 }

    stars:
      elements: stars
      properties:
        opacity: [
          -> Math.random(),
          -> Math.random() + 0.1
        ]
        translateX: [
          -> "+= #{r(-screenWidth, screenWidth)}",
          -> r(0, screenWidth)
        ]
        translateY: [
          -> "+= #{r(-screenHeight, screenHeight)}",
          -> r(0, screenHeight)
        ]
        translateZ: [
          -> "+= #{r(translateZMin, translateZMax)}",
          -> r(translateZMin, translateZMax)
        ]
      options: { duration: 30000, loop: true, sequenceQueue: false }

    full: -> [@sky, @mtn, @showAboutTxt, @extraTxt, @contactBtn, @daylight, @skylight, @stars]

  createImageFrom bgImg for bgImg in bgImgs

  contactBtn.addEventListener 'click', launchEmail, false

  imagesLoaded document.querySelector('.scene'), (instance) ->

    Velocity.RunSequence(sceneAnimation.full.call(sceneAnimation))
