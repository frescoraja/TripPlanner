window.tripler = {
  addEventListeners: function () {
    $('.new-trip').click(this.openModal);
    $('.guest-submit').click(this.guestLogin.bind(this));
    $('#new-trip-plan-form').submit(this.createNewTrip.bind(this));
    $('#cloudinary').click(this.uploadImg);
  },

  autoType: function (string, $el, cb) {
    var typer = setInterval(function () {
      $el.val($el.val() + string.slice(0, 1));
      string = string.substr(1);
      if (string.length === 0) {
        clearInterval(typer);
        cb();
      }
    }, 50);
  },

  clearInput: function () {
    $('#trip_plan_title').val('');
  },

  createNewTrip: function (e) {
    e.preventDefault();
    if ($('#trip_plan_title').val().length === 0) {
      $('.errors').remove();
      var $err = $('<div>').addClass('errors').css('color', 'red').text('Please enter a title');
      $(e.currentTarget).prepend($err);
      return;
    }
    var tripParams = $(e.currentTarget).serializeJSON();
    $.ajax({
      url: '/trip_plans',
      method: 'POST',
      data: tripParams,
      dataType: 'json',
      success: this.handleSuccess.bind(this)
    });
  },

  guestLogin: function (e) {
    e.preventDefault();
    var $loginInput = $('#user_session_login');
    var $pwInput = $('#user_session_password');
    var $pwConfInput = $('#user_session_password_confirmation');
    var self = this;
    self.autoType("Guest_User", $loginInput, function () {
      self.autoType("password", $pwInput, function () {});
      self.autoType("password", $pwConfInput, function () {
        $('#new_user_session').submit();
      });
    });
  },

  handleSuccess: function (data) {
    $('#myModal').modal('toggle');
    this.clearInput();
  },

  openModal: function () {
    $('#myModal').modal();
  },

  uploadImg: function (e) {
    e.preventDefault();
    cloudinary.openUploadWidget(window.CLOUDINARY_SETTINGS,
    function(error, result) {
      if (!error) {
        var url = result[0].url;
        $tripImg = $('.trip-img').attr('src', url);
        $tripImg.load(function () {
          $('#trip_plan_picture').val(url);
        });
      } else {
        console.log(error);
      }
    });
  }
};
