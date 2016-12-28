
function loadAndInitAuth2(){
    
    if(typeof gapi.auth2 === 'undefined' || gapi.auth2 === null){
        gapi.load('auth2', function() {
            gapi.auth2.init({
              client_id: '289108522458-ccr2le3rbcmthadua80hk9epkrsakal1.apps.googleusercontent.com',
              scope: 'profile'
            });
        });
    }
}

function onGoogleSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
        
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
    
    
    var xhr = new XMLHttpRequest();
    xhr.open('POST','https://localhost:8443/SampleCarShopOnlineManagement/TokenSignIn');
    xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    xhr.onload = function(){
        console.log('Signed in as:' + xhr.responseText);
        
        window.location = xhr.responseText;
        
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