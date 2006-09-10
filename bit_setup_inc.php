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
	$gBitSystem->registerAppMenu( IRLIST_PKG_NAME, 'IR List', IRLIST_PKG_URL.'index.php', 'bitpackage:irlist/menu_irlist.tpl', IRLIST_PKG_NAME);
}

?>
