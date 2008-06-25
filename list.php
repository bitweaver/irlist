<?php
/**
 * @version $Header: /cvsroot/bitweaver/_bit_irlist/list.php,v 1.6 2008/06/25 22:21:11 spiderr Exp $
 * @package blogs
 * @subpackage functions
 */

/**
 * required setup
 */
require_once( '../bit_setup_inc.php' );

include_once( IRLIST_PKG_PATH.'IRList.php' );

$gBitSystem->verifyPackage( 'irlist' );

$gBitSystem->verifyPermission( 'p_read_irlist' );

$gContent = new IRList();

// Get a list of matching IR entries
$listirs = $gContent->getList( $_REQUEST );
include_once( IRLIST_PKG_PATH.'display_list_header.php' );
$gBitSmarty->assign_by_ref( 'listInfo', $_REQUEST['listInfo'] );

$gBitSystem->setBrowserTitle("View Incident Reports List");
// Display the template
$gBitSystem->display( 'bitpackage:irlist/list.tpl', NULL, array( 'display_mode' => 'list' ));

?>
