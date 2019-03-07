document.addEventListener('turbolinks:load', function() {
  var password_field = document.querySelector('.password');
  var confirmation_field = document.querySelector('.confirmation');

    password_field.addEventListener('input', function() {
      showAlert(password_field, confirmation_field);
    }, false);
    confirmation_field.addEventListener('input', function() {
      showAlert(password_field, confirmation_field);
    }, false);
})

function showAlert(password, confirmation) {

    if (confirmation.value.length == 0) {
      document.querySelector('.octicon-thumbsup').classList.add('hide');
    }
    else if (confirmation.value !== password.value) {
      danger();
    } else {
      success();
    }

    function danger() {
      document.querySelector('.octicon-thumbsup').classList.add('text-danger');
      document.querySelector('.octicon-thumbsup').classList.remove('hide');
    }

    function success() {
      document.querySelector('.octicon-thumbsup').classList.remove('text-danger');
      document.querySelector('.octicon-thumbsup').classList.add('text-success');
      document.querySelector('.octicon-thumbsup').classList.remove('hide');
    }
}
