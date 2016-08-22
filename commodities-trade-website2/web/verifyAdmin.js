function verifyAdmin(){
    if(document.cookie.indexOf("AdminSession=Valid") === -1){
        //window.alert("You are not authorized to access this page. Please login.");
        //document.location.href = "login.jsp";
    }
}