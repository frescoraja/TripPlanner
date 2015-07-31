window.tripler = {
  initialize: function () {
    var createTripLink = $('#new-trip');
    createTripLink.click(showNewTripForm);
  },

  showNewTripForm: function (e) {
    var content = document.getElementsByClassName('content')[0];
    var modalForm =
    content.innerHTML
  }
};

$(document).ready(function () {
  tripler.initialize();
});
