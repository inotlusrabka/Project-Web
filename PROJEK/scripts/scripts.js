// // Fungsi untuk memeriksa apakah username sudah ada
// var checkUsernameExists = function(username) {
//     var xhr = new XMLHttpRequest();
//     xhr.open('POST', 'verify/check_username.php', true);
//     xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//     xhr.onreadystatechange = function() {
//         if (xhr.readyState === 4 && xhr.status === 200) {
//             var response = xhr.responseText;
//             if (response === 'exists') {
//                 document.getElementById("UsernameConfirmMessage").innerHTML = "Username already exists.";
//             } else {
//                 document.getElementById("UsernameConfirmMessage").innerHTML = "";
//             }
//         }
//     };
//     xhr.send('username=' + username);
// };

// // Fungsi untuk memeriksa apakah email sudah ada
// var checkEmailExists = function(email) {
//     var xhr = new XMLHttpRequest();
//     xhr.open('POST', 'verify/check_email.php', true);
//     xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//     xhr.onreadystatechange = function() {
//         if (xhr.readyState === 4 && xhr.status === 200) {
//             var response = xhr.responseText;
//             if (response === 'exists') {
//                 document.getElementById("EmailConfirmMessage").innerHTML = "Email already exists.";
//             } else {
//                 document.getElementById("EmailConfirmMessage").innerHTML = "";
//             }
//         }
//     };
//     xhr.send('email=' + email);
// };


// Cek Password
var passConfirm = function() {
    var verifyPassword = document.getElementById("password").value;
    var verifyRepassword = document.getElementById("repassword").value;

    if (verifyPassword.length < 8) {
        document.getElementById("PasswordConfirmMessage").style.color = "Red";
        document.getElementById("PasswordConfirmMessage").innerHTML = "Passwords must atleast more than 8 characters!";
    }
    else {
        if (verifyPassword == verifyRepassword){
            document.getElementById("PasswordConfirmMessage").style.color = "Red";
            document.getElementById("PasswordConfirmMessage").innerHTML = "";
        } else {
            document.getElementById("PasswordConfirmMessage").innerHTML = "Passwords do NOT match!";
        }
    }
}
