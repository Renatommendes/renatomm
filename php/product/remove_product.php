<?php

if($_SERVER['REQUEST_METHOD'] == 'POST')
{
    include("../db.php");

    $stmt = $conn->prepare("DELETE FROM product WHERE product_id=?");
    $stmt->bind_param("s",$product_id);

    $product_id = $_POST["product_id"];

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