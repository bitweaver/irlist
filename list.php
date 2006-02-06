<?php
/**
 * @version $Header: /cvsroot/bitweaver/_bit_irlist/list.php,v 1.3 2006/02/06 10:18:45 lsces Exp $
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

if( empty( $_REQUEST["sort_mode"] ) ) {
	$sort_mode = 'ir_id_desc';
} else {
	$sort_mode = $_REQUEST["sort_mode"];
}
$gBitSmarty->assign_by_ref('sort_mode', $sort_mode);

// If offset is set use it if not then use offset =0
// use the maxRecords php variable to set the limit
// if sortMode is not set then use last_modified_desc
if (!isset($_REQUEST["offset"])) {
	$offset = 0;
} else {
	$offset = $_REQUEST["offset"];
}

if (isset($_REQUEST['page'])) {
	$page = &$_REQUEST['page'];
	$offset = ($page - 1) * $maxRecords;
}

$gBitSmarty->assign_by_ref('offset', $offset);

if (isset($_REQUEST["find"])) {
	$find = $_REQUEST["find"];
} else {
	$find = '';
}
$gBitSmarty->assign('find', $find);
if (isset($_REQUEST["project"]) and $_REQUEST["project"] != "          ") {
	$add_sql = "`project_name` = '".$_REQUEST["project"]."'";
	if ($_REQUEST["status"] != "A") {
		$add_sql .= " AND `status` = '".$_REQUEST["status"]."'"; 
	}
	if ($_REQUEST["priority"] != "A") {
		$add_sql .= " AND `priority` = ".$_REQUEST["priority"]; 
	}
	if (!isset($_REQUEST["version"]) ) {
		$_REQUEST["version"] = '';
	}
	$ihash = array();
	$ihash['project'] = trim($_REQUEST["project"]);
	$ihash['status'] = $_REQUEST["status"];
	$ihash['priority'] = $_REQUEST["priority"];
	$ihash['version'] = trim($_REQUEST["version"]);
	$gBitSmarty->assign('ihash', $ihash);
} else {
	$add_sql = '';
}

// Get a list of matching IR entries
$listirs = $gContent->getList( $_REQUEST );

include_once( IRLIST_PKG_PATH.'display_list_header.php' );

$gBitSystem->setBrowserTitle("View Incident Reports List");
// Display the template
$gBitSystem->display( 'bitpackage:irlist/list.tpl');

?>
