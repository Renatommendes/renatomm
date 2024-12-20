<?php

if($_SERVER['REQUEST_METHOD'] == 'POST')
{
    include("../db.php");

    $stmt = $conn->prepare("DELETE FROM category WHERE id=?");
    $stmt->bind_param("s",$category_id);

    $category_id = $_POST["category_id"];

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