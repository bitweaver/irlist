<?php

// $Header: /cvsroot/bitweaver/_bit_irlist/admin/admin_irlist_inc.php,v 1.4 2009/10/01 13:45:42 wjames5 Exp $

// Copyright (c) 2002-2003, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See http://www.gnu.org/copyleft/lesser.html for details.

include_once( IRLIST_PKG_PATH.'IRList.php' );

$formIRListFeatures = array(
	"ir_list_title" => array(
		'label' => 'IR Number and Title',
		'note' => 'Display the incident report Number and Title.',
	),
	"ir_list_created" => array(
		'label' => 'Created By',
		'note' => 'Display the Created By column.',
	),
	"ir_list_lastmodif" => array(
		'label' => 'Last Modified By',
		'note' => 'Display the Last Modified By column.',
	),
	"ir_list_user" => array(
		'label' => 'Closed By',
		'note' => 'Display the Closed By column.',
	),
	"ir_list_project" => array(
		'label' => 'Projects',
		'note' => 'Display the Projects column.',
	),
	"ir_list_version" => array(
		'label' => 'Version',
		'note' => 'Display the Version column.',
	),
);
$gBitSmarty->assign( 'formIRListFeatures',$formIRListFeatures );

if (isset($_REQUEST["irlistfeatures"])) {
	
	foreach( $formIRListFeatures as $item => $data ) {
		simple_set_toggle( $item, 'irlist' );
	}
}

?>
