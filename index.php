<?php

// $Header: /cvsroot/bitweaver/_bit_irlist/index.php,v 1.6 2010/02/08 21:27:23 wjames5 Exp $

// Copyright (c) 2002-2003, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See below for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See http://www.gnu.org/copyleft/lesser.html for details.
require_once( '../kernel/setup_inc.php' );

include_once( IRLIST_PKG_PATH.'IRList.php' );

$gBitSystem->isPackageActive('irlist', TRUE);

$gContent = new IRList();

if( !empty( $_REQUEST['content_id'] ) ) {
	$gContent->load($_REQUEST['content_id']);
}

// Comments engine!
if( $gBitSystem->isFeatureActive( 'irlist_comments' ) ) {
	$comments_vars = Array('page');
	$comments_prefix_var='ir note:';
	$comments_object_var='page';
	$commentsParentId = $gContent->mContentId;
	$comments_return_url = IRLIST_PKG_URL.'index.php?content_id='.$gContent->mContentId;
	include_once( LIBERTY_PKG_PATH.'comments_inc.php' );
}

$displayHash = array( 'perm_name' => 'bit_p_view' );
$gContent->invokeServices( 'content_display_function', $displayHash );

$pdata = $gContent->parseData();
$gBitSmarty->assign_by_ref('parsed',$pdata);
$gBitSmarty->assign_by_ref( 'contentInfo', $gContent->mInfo );
if ( $gContent->isValid() ) {
	$gBitSystem->setBrowserTitle("Incident Reports Item");
	$gBitSystem->display( 'bitpackage:irlist/show_ir_item.tpl', NULL, array( 'display_mode' => 'display' ));
} else {
	header ("location: ".IRLIST_PKG_URL."list.php");
	die;
}
?>
