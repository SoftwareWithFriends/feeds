jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more posts...")
        $.getScript(url)
    $(window).scroll()

jQuery ->
  $("#new_topic").submit (event) ->
    form = $(this)
    url = form.attr("action")
    data = form.serialize()
    
    $.post(
      url 
      data 
      (data) ->
        if(data.added_to_post)
          $(".topics").append('<a href="#" class="btn topic">'+data.name)
        $("#topic_name").attr("value","")
      "json")
    return false