<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CC - Register</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="stylesheets/login.css">
    <!-- Custom JavaScript -->
    <script src="scripts/scripts.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/ProjekUAS">
                    <img src="/ProjekUAS/logo.png" alt="Computer Crafter Logo" style="height: 67px; width: 180px;">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#parts">Parts List</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#build">Build Guide</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/build">Build</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/forum">Forum</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/#team">Our Team</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-form p-4 shadow">
                    <h2 class="text-center mb-4">Register</h2>
                    <hr>
                    <?php
                    $serverName = "localhost";
                    $databaseUsername = "root";
                    $databasePassword = "";
                    $databaseName = "pc_part";
                    
                    $error = '';
                    $connect = mysqli_connect($serverName, $databaseUsername, $databasePassword, $databaseName);

                    if (!$connect){
                        die("Maaf, mohon coba lagi nanti." . mysqli_connect_error()); 
                    } else if($_SERVER["REQUEST_METHOD"] == "POST"){
                        $username = $_POST["username"];
                        $email = $_POST["email"];
                        $password = $_POST["password"];
                        $repassword = $_POST["repassword"];
                        
                        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                            $error = 'Invalid email format';
                        } else {
                            // Hash password
                            $hashPassword = hash('sha256', $password);

                            // PDO connection
                            $pdo = new PDO("mysql:host=$serverName;dbname=$databaseName", $databaseUsername, $databasePassword);

                            // Check if username already exists
                            $stmt = $pdo->prepare('SELECT COUNT(*) FROM userdata WHERE Username = :username');
                            $stmt->execute(['username' => $username]);
                            if ($stmt->fetchColumn() > 0) {
                                echo '<script>alert("Username sudah terdaftar.")</script>';
                            } else {
                                // Check if email already exists
                                $stmt = $pdo->prepare('SELECT COUNT(*) FROM userdata WHERE Email = :email');
                                $stmt->execute(['email' => $email]);
                                if ($stmt->fetchColumn() > 0) {
                                    $error = "Email sudah terdaftar";
                                    echo '<script>alert("Email sudah terdaftar.")</script>';
                                } else {
                                    // Jika username dan email belum ada, lakukan INSERT
                                    $stmt = $pdo->prepare('INSERT INTO userdata (Username, Email, Password, AccessLevel) VALUES (:username, :email, :password, "Member")');
                                    $stmt->execute(['username' => $username, 'email' => $email, 'password' => $hashPassword]);
                                    // Redirect to login page after successful registration
                                    header("Location: login.php");
                                }
                            }
                        }
                    }
                ?>
            <form action="register.php" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" name="username" placeholder="Username" onkeyup='checkUsernameExists()' required>
                                <span id="UsernameConfirmMessage"></span>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" placeholder="E-mail" onkeyup='checkEmailExists()' required>
                                <span id="EmailConfirmMessage"></span>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" onkeyup='passConfirm();' required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Confirm Password" onkeyup='passConfirm();' required>
                                <span id="PasswordConfirmMessage"></span>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Register</button>
                        </form>
                    </div>
                    <div class="text-center mt-3">
                        <p>Have an account? <a href="login.php">Click Here!</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
