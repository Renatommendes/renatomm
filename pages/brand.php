<html>

<head>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    
    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../components/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../components/jquery-confirm-master/css/jquery-confirm.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
</head>

<body>

<?php include ("../header.php") ?>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <form class="form-horizontal" id="frmBrand">
                <div class="form-group" align="left">
                    <label>Brand</label>
                    <input type="text" id="brandname" class="form-control" name="brandname" placeholder="Brand" required>

                </div>
                <div class="form-group" align="left">
                    <label>Status</label>
                    <select class="form-control" id="status" name="status">
                        <option value="">Please Select</option>
                        <option value="1">Active</option>
                        <option value="2">DeActive</option>
                    </select>
                </div>

                <div align="right">
                    <button type="button" class="btn btn-info" id="save" onclick="AddBrand()">Add</button>
                    <button type="button" class="btn btn-warning" id="reset" onclick="">Reset</button>
                </div>
            </form>
        </div>
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-brand" class="table table-responsive table-bordered" cellspacing="0" width="100%">
                <thead>  
                        <tr>
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
    <script src="bower_components/jquery/dist/jquery.min.js"></script>



<script>
    var Isnew = true;
    get_all();
    var brand_id = null;

    $('.frmBrand').on('click',function(){
        this.form.reset();
    });

    function AddBrand()
    {
        if($("#frmBrand").valid())
        {
            var _url = '';
            var _data = '';
            var _method;
        }else{

        }
            if (Isnew == true)
            {
                _url = '../php/brand/add_brand.php';
                _data = $("#frmBrand").serialize();
                _method = 'POST';
            }
            else
            {
                _url = '../php/brand/update_brand.php';
                _data = $("#frmBrand").serialize() + "& brand_id=" + brand_id;
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
                        msg = "Brand Created";
                    }
                    else
                    {
                        msg = "Brand Updated";
                  
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

    function get_all()
    {
        $('#tbl-brand').dataTable().fnDestroy();
        $.ajax({
            url: "../php/brand/all_brand.php",
            type: "GET",
            dataType:"JSON",

            success:function(data){
                $('#tbl-brand').dataTable({
                    "aaData":data
                    ,
                    "scrollX":true,
                    "aoColumns":[
                        {"sTitle": "Brand", "mData":"brand"},
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
                            "mData": "id",
                            "render":function(mData, type, row, meta){

                                return '<button class="btn btn-xs btn-success" onclick="get_brand_details(' + mData + ')">Edit</button>'; 
                            }
                        },
                        {
                            "sTitle":"Delete",
                            "mData":"id",
                            "render":function(mData, type, row, meta){
                                return '<button class="btn btn-xs btn-primary" onclick="RemoveBrand(' + mData + ')">Delete</button>';
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

    function get_brand_details(id)
    {
        $.ajax({
            type : 'POST',
            url : '../php/brand/edit_return.php',
            dataType : 'JSON',
            data : {brand_id:id},

            success : function(data)
            {
                $("html, body").animate({scrollTop: 0}, "slow");
                Isnew = false
                brand_id = data.id
                $('#brandname').val(data.brand);

                $('#status').val(data.status);
            //    $('#frmCategory').modal('show');


            },
            error: function (xhr, status, error){

                alert(xhr.responseText);

            }
        });
    }

function RemoveBrand(id)
{
    $.confirm({
        theme : 'supervan',
        buttons: 
        {
            yes:function()
            {
                $.ajax({
                    type:'POST',
                    url: '../php/brand/remove_brand.php',
                    dataType: 'JSON',
                    data: {brand_id:id},

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