# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# myfunction = alert ("Hello")
# # $(document).on ->
# #   alert ('hola')
#
# # console.log ('hola')
# my_function()

# $(document).ready ->
#   $('#comments-link').click ->
#     $('#comments-box').fadeToggle()
    # alert ("hola")
    # console.log ('hola')
# $(document).on "page:change",  ->
#
#   console.log("submitted!")
#
# $(document).on 'ready turbolinks:load', () ->
#   $('#comments-link').click ->
#     $('#comments-box').fadeToggle()

$(document).on "ajax:success", "form#comments-form",(ev,data) ->
	console.log data
	$(this).find("textarea").val("");
	$("#comments-box").append("<li>#{data.body} - #{data.user.email}</li>");

$(document).on "ajax:error", "form#comments-form",(ev,data) ->
	console.log data
