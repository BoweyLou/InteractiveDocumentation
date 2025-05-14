
// IE7/8 compatibility layer
if(!document.querySelector) {
    document.querySelector = function(selector) {
        return document.getElementsByTagName(selector)[0] || document.getElementById(selector.substring(1));
    }
}

// Basic AJAX wrapper
function makeRequest(url, callback) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if(xhr.readyState == 4 && xhr.status == 200) {
            callback(xhr.responseText);
        }
    };
    xhr.open("GET", url, true);
    xhr.send();
}
