<?php

include("../db.php");

if($_SERVER['REQUEST_METHOD'] == 'POST')
{
    $stmt = $conn->prepare("INSERT INTO product (product_name,description, barcode, category_id,catname, brand_id,
    warrenty, price_retail, price_cost, reorderlevel,qty, date, status)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    $stmt-> bind_param("ssisssiiisisi", $product_name,$description, $barcode, $category_id,$catname, $brand_id,
    $warrenty, $price_retail, $price_cost, $reorderlevel,$qty, $date, $status);

    $product_name = $_POST['productName'];
    $description = $_POST['productdescription'];
    $category_id = $_POST['catname'];
    $catname = $_POST['catname'];
    $brand_id = $_POST['brand'];

    $warrenty = $_POST['warrenty'];
    $price_cost = $_POST['costPrice'];
    $price_retail = $_POST['retailprice'];
    $warrenty = $_POST['warrenty'];
    $barcode = $_POST['barcode'];
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