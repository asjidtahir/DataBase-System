<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Courses</title>
</head>
<body>

<div class="container">
    <h4>ThemePark Records</h4>

    <form action="prep_stat.php" method="post">
        <span>Search Park Code</span> <br>
        <input type="text" name="park_code">
        <input type="submit" class="btn btn-info" value="Search">

    </form>

    <?php
    $username = 'root';
    $password = '';
    // Check connection
    try {
        $conn = new PDO("mysql:host=localhost;dbname=19p0085_asjidtahir", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // echo "Connected successfully";
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }


if (isset($_POST['park_code'])) {

    $park_code = trim($_POST['park_code']);

        // with prepared statement
        // $query_1 = $conn->prepare('
        // select PARK_CODE,PARK_NAME,PARK_CITY,PARK_COUNTRY from THEMEPARK 
        // where PARK_CODE = ? limit 1');
        // $query_1->execute([$park_code]);


    // without prepared statement
    $query_1 = $conn->query("
    select PARK_CODE,PARK_NAME,PARK_CITY,PARK_COUNTRY from THEMEPARK
     where PARK_CODE = '$park_code'");



     
}

// else{

//     $query_1 = $conn->query("
//     select PARK_CODE,PARK_NAME,PARK_CITY,PARK_COUNTRY from THEMEPARK
//      ");
// }
    
    // print_r($query_1);
    $result   = $query_1->fetchAll(PDO::FETCH_ASSOC);
        // print_r($result);

    ?>
     <table class="table mt-3">
            <thead>
            <th>Park Code</th>
            <th>Park Name</th>
            <th>Park City</th>
            <th>Park Country</th>
            
            </thead>
            <tbody>
            <?php
            foreach ($result as $value){

                // echo '<tr>';
                // foreach($value as $key2=>$value2){

                //     // echo '<pre>';
                //     // print_r($value);
                //     // print_r($value2);die;
                //     echo '<td>'.$value2.'</td>';
                // }
                // echo '</tr>';
                
                echo '<tr>
                <td>'.$value["PARK_CODE"].'</td>
                <td>'.$value["PARK_NAME"].'</td>
                <td>'.$value["PARK_CITY"].'</td>
                <td>'.$value["PARK_COUNTRY"].'</td>
                </tr>';
                
            }
           
            ?>

            </tbody>
        </table>

    <?php
     if(empty($result))
     echo 'No Record Found';


    

        ?>

     


</div>




<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- <script>
    console.lo
    </script> -->

</body>
</html>