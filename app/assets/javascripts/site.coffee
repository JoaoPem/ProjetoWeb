# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require bootstrap/dist/js/bootstrap
//= require jquery
console.log("a")
showNextStep = (nextStepId, currentStepId) ->
  currentStep = document.getElementById(currentStepId)
  nextStep = document.getElementById(nextStepId)
  console.log("b")
  if currentStep
    currentStep.style.display = 'none'
    currentStep.classList.remove('active')
  
  if nextStep
    nextStep.style.display = 'block'
    nextStep.classList.add('active') # Faltava um parênteses aqui
  
  # Atualiza a barra de progresso
  updateProgressBar nextStepId

updateProgressBar = (nextStepId) ->
  allSteps = ['step1_progress', 'step2_progress', 'step3_progress', 'step4_progress']
  activeIndex = allSteps.indexOf(nextStepId + '_progress')
  
  # Atualiza a classe 'active' dos itens da barra de progresso
  allSteps.forEach (stepId, index) ->
    stepElement = document.getElementById(stepId)
    if index <= activeIndex
      stepElement.classList.add('active')
    else
      stepElement.classList.remove('active')
    
  # Atualiza a largura da barra de progresso
  progressBar = document.querySelector('.progress-bar')
  if progressBar
    percentage = ((activeIndex + 1) / allSteps.length) * 100
    progressBar.style.width = "#{percentage}%"