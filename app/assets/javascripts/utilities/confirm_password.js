document.addEventListener('turbolinks:load', function() {
  var password_field = document.querySelector('.password');
  var confirmation_field = document.querySelector('.confirmation');

    if (password_field && confirmation_field) {
    password_field.addEventListener('input', function() {
      showAlert(password_field, confirmation_field);
    }, false);
    confirmation_field.addEventListener('input', function() {
      showAlert(password_field, confirmation_field);
    }, false);
  }
})

function showAlert(password, confirmation) {

    var select_octicon = document.querySelector('.octicon-thumbsup');

    if (confirmation.value.length == 0) {
    select_octicon.classList.add('hide');
    }
    else if (confirmation.value !== password.value) {
      danger(select_octicon);
    } else {
      success(select_octicon);
    }

    function danger(select_octicon) {
      select_octicon.classList.remove('text-success');
      select_octicon.classList.add('text-danger');
      select_octicon.classList.remove('hide');
    }

    function success(select_octicon) {
      select_octicon.classList.remove('text-danger');
      select_octicon.classList.add('text-success');
      select_octicon.classList.remove('hide');
    }
}
