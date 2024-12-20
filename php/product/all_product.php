<?php
include("../db.php");

$stmt = $conn->prepare("SELECT product_id, product_name,description, barcode, catname, brand_id,
warrenty, price_retail, price_cost, reorderlevel, qty, date, status FROM product ORDER BY product_id DESC");
$stmt->bind_result($product_id, $product_name,$description, $barcode, $catname, $brand_id,
$warrenty, $price_retail, $price_cost, $reorderlevel, $qty, $date, $status);   

if($stmt->execute())
{
    while($stmt->fetch())
    {
        $output[] = array("product_id"=>$product_id, "product_name"=>$product_name, "description"=>$description,
        "barcode"=>$barcode, "catname"=>$catname, "brand_id"=>$brand_id, "warrenty"=>$warrenty, "price_retail"=>$price_retail,
        "price_cost"=>$price_cost, "reorderlevel"=>$reorderlevel, "qty"=>$qty, "date"=>$date, "status"=>$status);
    }
    echo json_encode($output);

}

$stmt->close();



?>