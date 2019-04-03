document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')

  if (timer) {
    var timerTime = timer.dataset.time;
    var userTestId = timer.dataset.id;

    setInterval(function() {
      if (timerTime > 0) {
        timerTime -= 1;
      } else {
        alert('Время вышло!');
        window.location.replace('/test_passages/' + userTestId + '/result');
      }

      var time = parseInt(timerTime / 60) + ":" + (timerTime % 60);
      timer.innerHTML = time

    }, 1000)
  }
})
