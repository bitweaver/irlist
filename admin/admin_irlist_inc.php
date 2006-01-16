<?php

// $Header: /cvsroot/bitweaver/_bit_irlist/admin/admin_irlist_inc.php,v 1.2 2006/01/16 06:42:14 lsces Exp $

// Copyright (c) 2002-2003, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

include_once( IRLIST_PKG_PATH.'IRList.php' );

$formIRListFeatures = array(
	"ir_list_title" => array(
		'label' => 'IR Title and Number',
	),
	"ir_list_created" => array(
		'label' => 'Created By',
	),
	"ir_list_lastmodif" => array(
		'label' => 'Last Modified By',
	),
	"ir_list_user" => array(
		'label' => 'Closed By',
	),
	"ir_list_notes" => array(
		'label' => 'Notes',
	),
);
$gBitSmarty->assign( 'formIRListFeatures',$formIRListFeatures );

if (isset($_REQUEST["irlistfeatures"])) {
	
	foreach( $formIRListFeatures as $item => $data ) {
		simple_set_toggle( $item, 'irlist' );
	}
}

?>
