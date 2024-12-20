<?php
include("../db.php");

$stmt = $conn->prepare("SELECT product_id, product_name,description, barcode, category_id, brand_id,
warrenty, price_retail, price_cost, reorderlevel, date, status, qty FROM product WHERE barcode=? ORDER BY product_id DESC");
$barcode = $_POST["procode"];
$stmt->bind_param("s",$barcode);

$stmt->bind_result($product_id, $product_name,$description, $barcode, $category_id, $brand_id,
$warrenty, $price_retail, $price_cost, $reorderlevel, $date, $status, $qty);   

if($stmt->execute())
{
    while($stmt->fetch())
    {
        $output[] = array("product_id"=>$product_id, "product_name"=>$product_name, "description"=>$description,
        "barcode"=>$barcode, "category_id"=>$category_id, "brand_id"=>$brand_id, "warrenty"=>$warrenty, "price_retail"=>$price_retail,
        "price_cost"=>$price_cost, "reorderlevel"=>$reorderlevel, "date"=>$date, "status"=>$status, "qty"=>$qty);
    }
    echo json_encode($output);

}

$stmt->close();



?>