<?php

if($_SERVER['REQUEST_METHOD']=='POST')
{
    include("../db.php");

    $stmt = $conn->prepare("UPDATE product SET product_name=?, description=?, barcode=? , catname=? , brand_id=? , warrenty=? , price_retail=? , price_cost=? , reorderlevel=?, qty=?, date=?, status=?  WHERE product_id=?");
    $stmt->bind_param("sssssssssssss", $product_name,$description,$barcode,$catname,$brand_id,
    $warrenty,$price_retail,$price_cost,$reorderlevel,$qty,$date,$status,$product_id);

    $product_id = $_POST['product_id'];

    $product_name = $_POST['productName'];
    $description = $_POST['productdescription'];
    $barcode = $_POST['barcode'];
    $catname = $_POST['catname'];
    $brand_id = $_POST['brand'];
    $warrenty = $_POST['warrenty'];
    $price_retail = $_POST['retailprice'];
    $price_cost = $_POST['costPrice'];
    $reorderlevel = $_POST['reorderlevel'];
    $qty = $_POST['qty'];
    $date = $_POST['productdate'];
    $status = $_POST['status'];

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