# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require jquery
#= require bootstrap/dist/js/bootstrap

showNextStep = (nextStepId, currentStepId) ->
  $("#"+currentStepId).hide()
  $("#"+nextStepId).show()

  # Atualizar a barra de progresso
  updateProgressBar(nextStepId)

updateProgressBar = (nextStepId) ->
  activeIndex = $("[id$='_progress']").index($("#"+nextStepId+"_progress"))
  $(".progress-bar").css("width", ((activeIndex + 1) / $("[id$='_progress']").length * 100) + "%")

# Executando após o sucesso da adição ao carrinho
$(document).on 'ajax:success', '.add-to-cart', (event, data, status, xhr) ->
  nextStepId = $(this).data("next-step")
  currentStepId = $(this).data("current-step")
  showNextStep(nextStepId, currentStepId)


# Update progress bar based on the current step
updateProgressBar = (nextStepId) ->
  allSteps = ['step1_progress', 'step2_progress', 'step3_progress', 'step4_progress']
  activeIndex = allSteps.indexOf(nextStepId + '_progress')
  
  allSteps.forEach (stepId, index) ->
    stepElement = document.getElementById(stepId)
    if index <= activeIndex
      stepElement.classList.add('active')
    else
      stepElement.classList.remove('active')
    
  progressBar = document.querySelector('.progress-bar')
  if progressBar
    progressBar.style.width = "#{((activeIndex + 1) / allSteps.length) * 100}%"

# Handle add to cart and advance step
handleAddToCart = (productId, nextStepId, currentStepId) ->
  console.log("Clicked add to cart for product: #{productId}")
  csrfToken = $('meta[name="csrf-token"]').attr('content')
  
  $.ajax
  type: 'POST'
  url: "/add_item_to_cart"
  data: 
    authenticity_token: $('meta[name="csrf-token"]').attr('content')
    product_id: productId
    current_step: currentStepId
    next_step: nextStepId
  dataType: 'script'  # Garanta que o formato esperado seja script
  success: (data) ->
    console.log 'Item added: ', data
  error: (xhr, status, error) ->
    console.error 'Failed to add item: ', status, error


# Bind click events on document ready
$(document).on 'turbolinks:load', ->
  $('body').off('click', '.add-to-cart').on 'click', '.add-to-cart', (event) ->
    productId = $(this).data('product-id')
    nextStepId = $(this).data('next-step')
    currentStepId = $(this).data('current-step')
    handleAddToCart(productId, nextStepId, currentStepId)
    event.preventDefault()
