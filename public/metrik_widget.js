var Blocmetrics = {
  track: function(name, meta) {
    var myData = { "event": { "name": name, "meta": meta } };

    var request = new XMLHttpRequest();
    request.open("POST", "https://metrik.herokuapp.com/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');

    request.send(JSON.stringify(myData));
  }
}
