<html>
<head>
<title>Theme park Registration Form</title>
</head>
<body>
<h2>Registration Form</h2>
<form action="registration.php" method="POST"> Park Code:
<input type="text" name="park_code"> <br> Park Name:
<input type="text" name="park_name"> <br> Park City:
<input type="text" name="park_city"> <br> Park Country:
<input type="text" name="park_country"> <br>
<input type="hidden" name="form_submitted" value="1" />
<input type="submit" value="Submit">
</form>
</body>
</html>