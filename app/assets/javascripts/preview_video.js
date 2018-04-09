$(document).ready(function() {
  videoHandler();
  secondVideoHandler();
});

function getVideoUrl() {
  var userInput = $("#seed_url").val();
  return userInput;
}

function clearVideoPreview() {
  $('#iframe').attr('src', '').hide();
}

function parseVideoUrl(videoUrl) {
  var id = videoUrl.replace("https://www.youtube.com/watch?v=", "");
  var url = 'https://www.youtube.com/embed/' + id;
  console.log(url);
  return url;
}

function showVideoPreview(url) {
  $('.media-preview').removeClass("hidden");
  $('#iframe').attr('src', url).show();
}

function videoHandler() {
  $('#seed_url').on('keyup', function(event) {
    if (event.keyCode == 86 || event.keyCode == 91) {
      clearVideoPreview();
      var videoUrl = $('#seed_url').val();
      var videoId = parseVideoUrl(videoUrl);
      showVideoPreview(videoId);
    }

    if (event.keyCode == 8) {
      if ($('#seed_url').val() == "") {
        clearVideoPreview();
      }
    }
  })
}

function getSecondVideoUrl() {
  var userInput = $("#seed_secondary_url").val();
  return userInput;
}


function clearSecondVideoPreview() {
  $('#iframe-2').attr('src', '').hide();
}

function parseSecondVideoUrl(videoUrl) {
  var id = videoUrl.replace("https://www.youtube.com/watch?v=", "");
  var url = 'https://www.youtube.com/embed/' + id;
  return url;
}

function showSecondVideoPreview(url) {
  $('.second-media-preview').removeClass("hidden");
  $('#iframe-2').attr('src', url).show();
}

function secondVideoHandler() {
  $('#seed_secondary_url').on('keyup', function(event) {
    if (event.keyCode == 86 || event.keyCode == 91) {
      clearSecondVideoPreview()
      var videoUrl = $('#seed_secondary_url').val()
      var videoId = parseSecondVideoUrl(videoUrl)
      showSecondVideoPreview(videoId)
    }
    if (event.keyCode == 8) {
      if ($('#seed_secondary_url').val() == "") {
        clearSecondVideoPreview();
      }
    }
  })
}

