/* jshint devel:true */
(function () {
  'use strict';
  $.ajax({
    url: '/ip',
    success: function (ip) {
      $('#title').text('Overmind is runing on http://' + ip + ':8000/');
      $('#jenkins_link').attr('href', 'http://' + ip + ':9090/');
      $('#gogs_link').attr('href', 'http://' + ip + ':3000/');
      $('#shipyard_link').attr('href', 'http://' + ip + ':8080/');
      $('#taskboard_link').attr('href', 'http://' + ip + ':4000/');
    },
    error: function () {
      alert('Overmind server is not running. Please launch overmind server.');
      window.location.reload();
    }
  });

})();
