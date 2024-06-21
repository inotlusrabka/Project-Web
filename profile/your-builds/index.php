<?php
session_start();

if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

// Konfigurasi koneksi ke database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pc_part";

// Membuat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Mendapatkan UserID dari sesi
$UserID = $_SESSION['userid'];

// Query untuk mengambil data build_component dan join dengan tabel part pc
$sql = "
    SELECT 
        motherboard.brand AS motherboard_brand, motherboard.item_name AS motherboard_item_name, motherboard.image_url AS motherboard_image_url,
        processor.brand AS processor_brand, processor.item_name AS processor_item_name, processor.image_url AS processor_image_url,
        ram.brand AS ram_brand, ram.item_name AS ram_item_name, ram.image_url AS ram_image_url,
        gpu.brand AS gpu_brand, gpu.item_name AS gpu_item_name, gpu.image_url AS gpu_image_url,
        powersupply.model AS powersupply_model, powersupply.image_url AS powersupply_image_url,
        cases.model AS cases_model, cases.image_url AS cases_image_url
    FROM build_component
    LEFT JOIN motherboard ON build_component.motherboard_id = motherboard.item_id
    LEFT JOIN processor ON build_component.processor_id = processor.item_id
    LEFT JOIN ram ON build_component.ram_id = ram.item_id
    LEFT JOIN gpu ON build_component.gpu_id = gpu.item_id
    LEFT JOIN powersupply ON build_component.powersupply_id = powersupply.id
    LEFT JOIN cases ON build_component.cases_id = cases.id
    WHERE build_component.UserID = ?
";

$stmt = $conn->prepare($sql);
if ($stmt === false) {
    die("Prepare failed: " . $conn->error);
}

$stmt->bind_param("i", $UserID);
$stmt->execute();
$result = $stmt->get_result();

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CC - Your Builds</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/ProjekUAS/stylesheets/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- AOS CSS -->
    <link href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css" rel="stylesheet">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/ProjekUAS/">Computer Crafter</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                        <li class="nav-item"><a class="nav-link" href="/ProjekUAS/profile"><i class="fas fa-user"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="py-4">
        <section id="your-builds" class="py-5">
            <div class="container" data-aos="fade-up">
                <h2 class="text-center">Your Builds</h2>
                <div class="accordion" id="buildsAccordion">
                    <?php
                    if ($result->num_rows > 0) {
                        $buildNumber = 1;
                        while ($row = $result->fetch_assoc()) {
                            echo '<div class="card">';
                            echo '<div class="card-header" id="heading aria-expanded="true" aria-controls="collapseOne"' . $buildNumber . '">';
                            echo '<h2 class="mb-0">';
                            echo '<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse' . $buildNumber . '" aria-expanded="true" aria-controls="collapse' . $buildNumber . '">';
                            echo 'Build ' . $buildNumber;
                            echo '</button>';
                            echo '</h2>';
                            echo '</div>';

                            echo '<div id="collapse' . $buildNumber . '" class="collapse" aria-labelledby="heading' . $buildNumber . '" data-parent="#buildsAccordion">';
                            echo '<div class="card-body">';
                            
                            echo '<h5 class="card-title">Motherboard</h5>';
                            echo '<div class="list-group-item">';
                            echo '<div class="d-flex w-100 justify-content-between">';
                            echo '<p>' . htmlspecialchars($row['motherboard_brand']) . ' ' . htmlspecialchars($row['motherboard_item_name']) . '</p>';
                            echo '<img src="' . htmlspecialchars($row['motherboard_image_url']) . '" alt="Motherboard Image" width=20% height=20%>';
                            echo '</div>';
                            echo '</div>';
                            
                            echo '<h5 class="card-title">Processor</h5>';
                            echo '<div class="list-group-item">';
                            echo '<div class="d-flex w-100 justify-content-between">';
                            echo '<p>' . htmlspecialchars($row['processor_brand']) . ' ' . htmlspecialchars($row['processor_item_name']) . '</p>';
                            echo '<img src="' . htmlspecialchars($row['processor_image_url']) . '" alt="Processor Image" width=20% height=20%>';
                            echo '</div>';
                            echo '</div>';
                            
                            echo '<h5 class="card-title">RAM</h5>';
                            echo '<div class="list-group-item">';
                            echo '<div class="d-flex w-100 justify-content-between">';
                            echo '<p>' . htmlspecialchars($row['ram_brand']) . ' ' . htmlspecialchars($row['ram_item_name']) . '</p>';
                            echo '<img src="' . htmlspecialchars($row['ram_image_url']) . '" alt="RAM Image" width=20% height=20%>';
                            echo '</div>';
                            echo '</div>';
                            
                            echo '<h5 class="card-title">GPU</h5>';
                            echo '<div class="list-group-item">';
                            echo '<div class="d-flex w-100 justify-content-between">';
                            echo '<p>' . htmlspecialchars($row['gpu_brand']) . ' ' . htmlspecialchars($row['gpu_item_name']) . '</p>';
                            echo '<img src="' . htmlspecialchars($row['gpu_image_url']) . '" alt="GPU Image" width=20% height=20%>';
                            echo '</div>';
                            echo '</div>';
                            
                            echo '<h5 class="card-title">Power Supply</h5>';
                            echo '<div class="list-group-item">';
                            echo '<div class="d-flex w-100 justify-content-between">';
                            echo '<p>' . htmlspecialchars($row['powersupply_model']) . '</p>';
                            echo '<img src="' . htmlspecialchars($row['powersupply_image_url']) . '" alt="Power Supply Image" width=20% height=20%>';
                            echo '</div>';
                            echo '</div>';
                            
                            echo '<h5 class="card-title">Case</h5>';
                            echo '<div class="list-group-item">';
                            echo '<div class="d-flex w-100 justify-content-between">';
                            echo '<p>' . htmlspecialchars($row['cases_model']) . '</p>';
                            echo '<img src="' . htmlspecialchars($row['cases_image_url']) . '" alt="Case Image" width=20% height=20%>';
                            echo '</div>';
                            echo '</div>';
                            
                            echo '</div>';
                            echo '</div>';
                            echo '</div>';
                            
                            $buildNumber++;
                        }
                    } else {
                        echo "No builds found for this user.";
                    }
                    ?>
                </div>
            </div>
        </section>
    </main>

    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
            <p>&copy; 2024 Computer Crafter. All rights reserved.</p>
        </div>
    </footer>

    <!-- jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>
