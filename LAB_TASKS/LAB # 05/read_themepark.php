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



  
        $query_2 = $conn->query('select * from THEMEPARK');
       
        // $result   = $query_2->fetchAll(PDO::FETCH_ASSOC);
        $result   = $query_2->fetchAll(PDO::FETCH_OBJ);

        // echo "<pre>";
        // print_r($result);
        // die;

  

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

    
                // uncomment if you have used FETCH_ASSOC method
                // while fetching data from Database.
                // echo "<tr>
                // <td>".$value['PARK_CODE']."</td>
                // <td>".$value['PARK_NAME']."</td>
                // <td>".$value['PARK_CITY']."</td>
                // <td>".$value['PARK_COUNTRY']."</td>
                // </tr>";

                
                echo "<tr>
                <td>$value->PARK_CODE</td>
                <td>$value->PARK_NAME</td>
                <td>$value->PARK_CITY</td>
                <td>$value->PARK_COUNTRY</td>
                </tr>";
                
            }
            ?>

            </tbody>
        </table>
</div>




<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>