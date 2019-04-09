document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')

  if (timer) {
    var timerTime = timer.dataset.time;
    var userTestId = timer.dataset.id;

    setInterval(function() {
      if (timerTime > 0) {
        timerTime -= 1;
      } else {
        clearInterval(timer);
        alert('Время вышло!');
        document.getElementById('answer_current_question_form').submit();
      }

      var time = parseInt(timerTime / 60) + ":" + (timerTime % 60);
      timer.innerHTML = time;

    }, 1000)
  }
})
