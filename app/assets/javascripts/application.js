// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require select2
//= require_tree .


$(document).on('turbolinks:load', function () {

  $('.datepicker').datepicker({
    format: "yyyy-mm-dd",
    autoclose: true,
    weekStart: 1,
    zIndexOffset: 20,
    language: 'sv',
    ignoreReadonly: true,
    allowInputToggle: true,
  });

  $(".check-hover").click(function () {
    $("#check-ticket").fadeToggle('fast');
    $("#ticket-id").focus();
  });

  $(".select2").select2({
    theme: "bootstrap",
    language: "sv"
  });

  $('#ticket-id').blur('input', function () {
    this.value = $(this).val().trim();
  });

});
