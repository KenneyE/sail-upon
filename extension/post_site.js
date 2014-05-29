

var xhr = new XMLHttpRequest();
xhr.open("POST", "http://sailupon.com/api/websites", true);
xhr.onreadystatechange = function() {
  if (xhr.readyState == 4) {
    // JSON.parse does not evaluate the attacker's scripts.
    var resp = JSON.parse(xhr.responseText);
  }
}
xhr.send();