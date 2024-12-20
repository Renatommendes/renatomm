<?php

if($_SERVER['REQUEST_METHOD'] == 'POST')
{
    include("../db.php");

    $stmt = $conn->prepare("DELETE FROM brand WHERE id=?");
    $stmt->bind_param("s",$brand_id);

    $brand_id = $_POST["brand_id"];

    if($stmt->execute())
    {
        echo 1;
    }
    else
    {
        echo 0;
    }

    $stmt->close();
}


?>