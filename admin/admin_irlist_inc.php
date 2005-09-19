<?php

// $Header: /cvsroot/bitweaver/_bit_irlist/admin/admin_irlist_inc.php,v 1.1 2005/09/19 13:47:49 lsces Exp $

// Copyright (c) 2002-2003, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for details.

include_once( IRLIST_PKG_PATH.'IRList.php' );

$formIRListFeatures = array(
	"irlist_flag1" => array(
		'label' => 'Display 1',
	),
	"irlist_flag2" => array(
		'label' => 'Display 2',
	),
	"irlist_flag3" => array(
		'label' => 'Display 3',
	),
	"irlist_flag4" => array(
		'label' => 'Display 4',
	),
	"irlist_flag5" => array(
		'label' => 'Enable 5',
	),
);
$gBitSmarty->assign( 'formIRListFeatures',$formIRListFeatures );

if (isset($_REQUEST["irlistfeatures"])) {
	
	foreach( $formIRListFeatures as $item => $data ) {
		simple_set_toggle( $item );
	}
}

?>
