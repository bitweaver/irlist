<?php
global $gBitSystem, $gBitSmarty;
$gBitSystem->registerPackage( 'irlist', dirname( __FILE__).'/' );

	define('IRLIST_CONTENT_TYPE_GUID', 'irlist' );

if( $gBitSystem->isPackageActive( 'irlist' ) ) {
	$gBitSystem->registerAppMenu( 'irlist', 'IR List', IRLIST_PKG_URL.'index.php', 'bitpackage:irlist/menu_irlist.tpl', 'irlist');
}

?>
