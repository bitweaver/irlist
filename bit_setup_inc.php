<?php
global $gBitSystem;

$registerHash = array(
	'package_name' => 'irlist',
	'package_path' => dirname( __FILE__ ).'/',
	'homeable' => TRUE,
);
$gBitSystem->registerPackage( $registerHash );

define('IRLIST_CONTENT_TYPE_GUID', 'irlist' );

if( $gBitSystem->isPackageActive( 'irlist' ) ) {
	$menuHash = array(
		'package_name'  => IRLIST_PKG_NAME,
		'index_url'     => IRLIST_PKG_URL.'index.php',
		'menu_template' => 'bitpackage:irlist/menu_irlist.tpl',
	);
	$gBitSystem->registerAppMenu( $menuHash );
}

?>
