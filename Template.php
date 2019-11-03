<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title><?= $title ?></title>
		<link <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<!--<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
	</head>
	<script language="JavaScript" type="text/JavaScript">
	function submit()
	{	
			document.getElementById('MiseEnFab').submit();
	}
	function Autotab1(event,id)
	{	
		var keycode;
			keycode = event.which;
			if (window.event){ 
				keycode = window.event.keyCode;
			}
			if ( keycode == 13 ){
				document.forms["MiseEnFab"].elements[id].focus();
			}	
	}
	</script>
	<body>
		<div>
		
			<header class ="container-fluid">
			
				<a href=<?="index.php"?>>
					<p id="logo" > <h2> Accueil </h2></p>
				</a>
				<div id="logo" class="pull-right"><h2><?= $menuLinks ?></h2></div>
				
			</header>
			<div class="container" id="contenu">
				<?= $contenu ?>
			</div>
			<footer class="text-center">
				Projet Badgage Self Signal 
			</footer>
		</div>
	</body>
</html>