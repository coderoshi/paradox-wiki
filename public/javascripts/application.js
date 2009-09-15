jQuery(function() {
  jQuery("#article_input > div").hide();
  jQuery("#article_input > label").click(function(){
    jQuery("#article_input > div").toggle('slow');
  })
});