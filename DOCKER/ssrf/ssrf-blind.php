<?php
    // ssrf-blind.php
    if (isset($_SERVER['HTTP_HOST'])) {
        $dominio = $_SERVER['HTTP_HOST'];
        $ip = gethostbyname($dominio);
        // No output
    } else {
        echo "No Host Header provided";
    }
?>

