
function loadAndInitAuth2(){
    
    if(typeof gapi.auth2 === 'undefined' || gapi.auth2 === null){
        gapi.load('auth2', function() {
            gapi.auth2.init({
              client_id: 'YOUR_CLIENT_ID.apps.googleusercontent.com',
              scope: 'profile'
            });
        });
    }
}

window.addEventListener("load",function(){
    var googleLogInButton = document.querySelector("div.abcRioButton");
    if(typeof googleLogInButton !== 'undefined' && googleLogInButton !== null){
        var afterLogin = window.location.search.split("=")[1];
        if (typeof afterLogin !== 'undefined' & afterLogin !== null) {
            googleLogInButton.click();
        }
    }
});

function onGoogleSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
      
    var id_token = googleUser.getAuthResponse().id_token;
  
    var xhr = new XMLHttpRequest();
    xhr.open('POST','https://localhost:8443/SampleCarShopOnlineManagement/TokenSignIn');
    xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    xhr.onload = function(){
        console.log('Signed in as:' + xhr.responseText);
        
        var afterLogin = window.location.search.split("=")[1];
        if (typeof afterLogin === 'undefined' || afterLogin === null) {
            window.location = xhr.responseText;
        }
        else{
            window.location = xhr.responseText+"/"+afterLogin;
        }
        
        
        
    };
    xhr.send('idtoken='+ id_token);
}


function googleSignOut() {
    var auth2 = gapi.auth2.getAuthInstance();

    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
}



//if (typeof variable === 'undefined' || variable === null) {
//    // variable is undefined or null
//    alert('variable dn yparxui');
//}
