<?php

if($_SERVER['REQUEST_METHOD']=='POST')
{
    include("../db.php");

    $stmt = $conn->prepare("UPDATE product SET qty=qty-?  WHERE barcode=?");
    $stmt->bind_param("ii",$qty, $procode);

    $procode = $_POST['procode'];
    $qty = $_POST['qty'];

    if($stmt->execute())
    {
        echo 1;
    }else
    {
        echo 0;
    }

    $stmt->close();
}


?>