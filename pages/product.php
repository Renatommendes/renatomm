<html>

<head>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    
    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../components/jquery-confirm-master/css/jquery-confirm.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

    <style>
.viewport {
    position: relative;
    }

canvas.drawingBuffer {
            position: absolute;
            left: 0;
            top: 0;

    }
.element.style{
    width: 50px;
}

</style>

</head>

<body>

<?php include ("../header.php");
include("../php/db.php")
?>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <form id="frmProduct">
                <div>
                <div id="resultado"></div>
                


                    <h3>Product</h3>
                    </br>

                    <div class="row">
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>ProductName</label>
                                <input type="text" id="productName" class="form-control" name="productName" placeholder="Product Name" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Product Description</label>
                                <input type="text" id="productdescription" class="form-control" name="productdescription" placeholder="Product Description" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Category</label>
                                <select class="form-control" name="catname" id="catname">
                                        <option>Please Select</option>   

                                            <?php 
                                            include("../php/product/add_product.php");
                                            $q = ("SELECT id, catname,status FROM category WHERE status = '1' ORDER BY id DESC");
                                            $r = mysqli_query($conn, $q) ;
                                                if($r){
                                                if(mysqli_num_rows($r) > 0){
                                                    while($row = mysqli_fetch_assoc($r)){ ?>
                                            <option  value="<?php echo $row['catname'] ?>"><?php echo $row['catname'] ?></option>
                                            <?php } 
                                            }
                                        }?>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Brand</label>

                                <select class="form-control" id="brand" name="brand">
                                    <option value="" >Please  Select</option>
                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Warrenty</label>
                                <input type="text" id="warrenty" class="form-control" name="warrenty" placeholder="Warrenty" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Cost Price</label>
                                <input type="text" id="costPrice" class="form-control" name="costPrice" placeholder="Cost Price" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Retail Price</label>
                                <input type="text" id="retailprice" class="form-control" name="retailprice" placeholder="Retail Price" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                            <label>Leitor de Codigo de Barras</label>
                            <div id="camera" class="viewport" style="display: none;">
                                <video id="videocamera" style="width: 200px; display: none;"></video>
                            </div>
                            <input type="button" id="btn" class="form-control" value="Iniciar/Fechar Leitor" />
                            
                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Barcode</label>
                                <input type="text" id="barcode" class="form-control" name="barcode" placeholder="Barcode" required>

                            </div>
                        </div>  
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Reorder Level</label>
                                <input type="text" id="reorderlevel" class="form-control" name="reorderlevel" placeholder="Reorder Level" required>

                            </div>
                        </div> 
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Quantidade</label>
                                <input type="text" id="qty" class="form-control" name="qty" placeholder="Quantidade" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Product Date</label>
                                <input type="date" id="productdate" class="form-control" name="productdate" placeholder="Product Date" required>

                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-3">
                            <div class="form-group" align="left">
                                <label>Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="">Please Select</option>
                                        <option value="1">Active</option>
                                        <option value="2">DeActive</option>
                                    </select>
                            </div>
                        </div> 

                    </div>
                    <div align="right">
                            <button type="button" class="btn btn-info" id="save" onclick="AddProduct()">Add</button>
                            <button type="button" class="btn btn-warning" id="reset" onclick="">Reset</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="col s12 m6 offset-m4">
            <div class="panel-body">
                <table id="tbl-product" class="table table-responsive table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>   
                        </tr>
                    </thead>
                </table>
           </div>
        </div>
    </div>
</div>


    <script src="../components/jquery/dist/jquery.js"></script>
    <script src="../components/jquery/dist/jquery.min.js"></script>
    <script src="../components/jquery.validate.min.js"></script>

    <script src="../components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="../components/jquery-confirm-master/js/jquery-confirm.js"></script>

    <script src="http://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <script src="../quagga.min.js"></script>




<script>

//getCategory();
getBrand();
get_all();

var categoryname;


        var sonido = new Audio("../pages/beep-06.mp3");

        function startScanner() {
        Quagga.init({
            inputStream: {
                name: "Live",
                type: "LiveStream",
                //target: document.querySelector('#camera')    // Or '#yourElement' (optional)
                target: document.querySelector('#camera'),
              constraints: {
                        width: 380,
                        height: 220,
                        facingMode: "environment"
                    },
                },
            frequency: 2,
            decoder: {
                readers: ["code_128_reader",
                        "ean_reader",
                        "ean_8_reader",
                        "code_39_reader",
                        "code_39_vin_reader",
                        "codabar_reader",
                        "upc_reader",
                        "upc_e_reader",
                        "i2of5_reader",
                        "2of5_reader",
                        "code_93_reader"]
            }
        }, function (err) {
            if (err) {
                console.log(err);
                return
            }
            console.log("Initialization finished. Ready to start");
            Quagga.start();
        });

        Quagga.onProcessed(function(result){
            var drawingCtx = Quagga.canvas.ctx.overlay,
            drawingCanvas = Quagga.canvas.dom.overlay;
            drawingCanvas.style.width = '200';

            if(result){
                if(result.boxes){
                    drawingCtx.clearRect(0,0,parseInt(drawingCanvas.getAttribute("width")),parseInt(drawingCanvas.getAttribute("height")));
                    result.boxes.filter(function(box){
                        return box !==result.box;
                    }).forEach(function(box){
                        Quagga.ImageDebug.drawPath(box,{
                            x:0,
                            y:1
                        }, drawingCtx,{
                            color: "green",
                            lineWidth: 2
                        
                        });
                    });
                }

                if(result.box){
                    Quagga.ImageDebug.drawPath(result.box,{
                        x:0,
                        y:1
                    },drawingCtx,{
                        color:"#00F",
                        lineWidth:2
                    });
                }

                if(result.codeResult && result.codeResult.code){
                    Quagga.ImageDebug.drawPath(result.line,{
                        x:'x',
                        y:'y'
                    },drawingCtx,{
                        color:'red',
                        lineWidth:3
                  });
                }
            }
        });
//-------
        Quagga.onDetected(function (data) {
            sonido.play();
           // alertify.success(''+ data.codeResult.code);
            console.log(data.codeResult.code);
            var codigo = data.codeResult.code;
            document.getElementById('barcode').value = codigo;
        });
    }
        
//-------
        var video = document.getElementById("videocamera");
        var button = document.getElementById("btn");
        button.addEventListener("click", function () {
      //  if (_scannerIsRunning) {
     //           Quagga.stop();
    //            Quagga.closed();
            //}
        
            
            var container = document.getElementById("camera");
            if(video.style.display === "none"){
                video.style.display = "block";
            }
            if(container.style.display === "none"){
                container.style.display = "block";
                startScanner();


            }else{
                container.style.display ="none";
                
                Quagga.stop();
            }
        });

//------------------------------------------------------//
function getBrand()
{
    $.ajax({
        type : 'GET',
        url : '../php/brand/getbrand.php',
        dataType : 'JSON',

        success: function(data){

            console.log(data)
            for (var i = 0; i< data.length; i++)
            {   
                $('#brand').append($("<option/>", {
                    
                    value: data[i].brand,
                    text: data[i].brand,
                }));
            }

        },
        error: function (xhr, status, error){
            alert(xhr.responseText);
        }

    });

}

//--------------------------------------------------------//
    var Isnew = true;
    var brand_id = null;

    function AddProduct()
    {
        if($("#frmProduct").valid())
        {
            var _url = '';
            var _data = '';
            var _method;
        }else{

        }
            if (Isnew == true)
            {
                _url = '../php/product/add_product.php';
                _data = $("#frmProduct").serialize();
                _method = 'POST';
            }
            else
            {
                _url = '../php/product/update_product.php';
                _data = $("#frmProduct").serialize() + "& product_id=" + product_id;
                _method = 'POST';
            }

            $.ajax({
                type : "POST",
                data : _data,
                url : _url,
                dataType : 'JSON',

                success : function(data){
                    get_all();
                    var msg;


                   if(Isnew)
                    {
                        msg = "Product Created";
                    }
                    else
                    {
                        msg = "Product Updated";
                  
                    }

                    $.alert({
                            title: 'Success!',
                            content: msg,
                            type: 'GREEN',
                            boxWidth: '400px',
                            theme: 'light',
                            useBootstrap: false,
                            autoClose: 'ok|2000'
                        });
                },
                 error: function (xhr, status, error){
                    alert(xhr);
                    console.log(xhr.responseText);

                    $.alert({
                        title: 'Fail!',
                        type: 'red',
                        autoClose: 'ok|2000'
                    });
                    $('#save').prop('disabled', false);
                    $('#save').html('');
                    $('#save').append('Save');
                }
            });
    }   

//-------------------------------------------------------------
    function get_all()
    {
        $('#tbl-product').dataTable().fnDestroy();
        $.ajax({
            url: "../php/product/all_product.php",
            type: "GET",
            dataType:"JSON",

            success:function(data){
                $('#tbl-product').dataTable({
                    "aaData":data,
                    "scrollX":true,

                    "aoColumns":[
                        {"sTitle": "Product Name", "mData":"product_name"},
                        {"sTitle": "Description", "mData":"description"},
                        {"sTitle": "Barcode", "mData":"barcode"},
                        {"sTitle": "Category", "mData":"catname"},
                        {"sTitle": "Brand", "mData":"brand_id"},
                        {"sTitle": "Warrenty", "mData":"warrenty"},
                        {"sTitle": "Price Retail", "mData":"price_retail"},
                        {"sTitle": "Price Cost", "mData":"price_cost"},
                        {"sTitle": "Reorderlevel", "mData":"reorderlevel"},
                        {"sTitle": "Qty", "mData":"qty"},
                        {"sTitle": "Date", "mData":"date"},
                        
                        {
                            "sTitle": "Status", "mData": "status", "render":function(mData, type, row, meta){
                                if(mData == 1){
                                    return '<span class="label label-info">Active</span>';
                                }
                                else if (mData == 2) {
                                    return '<span class="label label-warning">Deactive</span>';
                                }
                            }
                        },
                        {
                            "sTitle": "Edit",
                            "mData": "product_id",
                            "render":function(mData, type, row, meta){

                                return '<button class="btn btn-xs btn-success" onclick="get_product_details(' + mData + ')">Edit</button>'; 
                            }
                        },
                        {
                            "sTitle":"Delete",
                            "mData":"product_id",
                            "render":function(mData, type, row, meta){
                                return '<button class="btn btn-xs btn-primary" onclick="RemoveProduct(' + mData + ')">Delete</button>';
                            }
                        }
                    ]
                });
            },

            error:function(xhr){
                console.log('Request Status: ' + xhr.status);
                console.log('Status Text: ' + xhr.statusText);
                console.log(xhr.responseText);
                var text = $($.parseHTML(xhr.responseText)).filter('.trace-message').text();
            }
        });
    }
//------------------------------------------------------------------
    function get_product_details(id)
    {
        $.ajax({
            type : 'POST',
            url : '../php/product/edit_return.php',
            dataType : 'JSON',
            data : {product_id:id},

            success : function(data)
            {
                $("html, body").animate({scrollTop: 0}, "slow");
                Isnew = false
                product_id = data.product_id
                $('#productName').val(data.product_name);

                $('#productdescription').val(data.description);
                $('#category').val(data.category_id);
                $('#brand').val(data.brand_id);
                $('#warrenty').val(data.warrenty);
                $('#costPrice').val(data.price_cost);
                $('#retailprice').val(data.price_retail);
                $('#barcode').val(data.barcode);
                $('#reorderlevel').val(data.reorderlevel);
                $('#qty').val(data.qty);
                $('#productdate').val(data.date);
                $('#status').val(data.status);
            //    $('#frmCategory').modal('show');
            },
            error: function (xhr, status, error){

                alert(xhr.responseText);
            }
        });
    }

//-------------------------------------------------------------------------
function RemoveProduct(id)
{
    $.confirm({
        theme : 'supervan',
        buttons: 
        {
            yes:function()
            {
                $.ajax({
                    type:'POST',
                    url: '../php/product/remove_product.php',
                    dataType: 'JSON',
                    data: {product_id:id},

                    success : function(data)
                    {
                        get_all();
                    },

                    error: function (xhr, status, error){

                        alert(xhr.responseText);

                    }
                });
            },

            no:function()
            {

            }
        }
    });

}
    
</script>

</body>

</html>