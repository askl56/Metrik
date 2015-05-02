(function(_metrik){
  _metrik.report = function(event_name) {
    $.ajax({
      url: "https://metrik.herokuapp.com/api/v1/events",
      method: "post",
      data: {event: {name: event_name}}
    });
  }
})(window._metrik = window._metrik || {});
