// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require select2-full
//= require cocoon
//= require turbolinks
//= require turbolinks-compatibility
//= require_tree .

$(document).ready(function() {
  $("#profession_list").select2({
    tags: true,
    tokenSeparators: [','],
    theme: "bootstrap"
  });
  $("#institution_parent_id").select2({
    theme: "bootstrap",
    placeholder: "Select a parent institution",
    allowClear: true
  });
  $("#institution_country").select2({
    theme: "bootstrap",
    placeholder: "Select a country",
    allowClear: true
  });
  $("#person_affiliation_institution_id").select2({
    theme: "bootstrap",
    placeholder: "Select a institution",
    allowClear: true
  });
});