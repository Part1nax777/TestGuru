document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar');
  var progressBarValue = document.querySelector('.progress');

  if (progressBar && progressBarValue) {
    var percent = progressBarValue.dataset.currentQuestion / progressBarValue.dataset.maxQuestions * 100;
    progressBar.setAttribute('style', 'width:' + percent + '%');
  }
})
