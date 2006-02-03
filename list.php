<?php
/**
 * @version $Header: /cvsroot/bitweaver/_bit_irlist/list.php,v 1.2 2006/02/03 08:31:28 lsces Exp $
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
/*
if($feature_listPages != 'y') {
  $gBitSmarty->assign('msg',tra("This feature is disabled"));
  $gBitSystem->display( 'error.tpl' );
  die;
}
*/

/*
// Now check permissions to access this page
if(!$gBitUser->( 'bit_p_view' )) {
  $gBitSmarty->assign('msg',tra("Permission denied you cannot view pages"));
  $gBitSystem->display( 'error.tpl' );
  die;
}
*/

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
$listirs = $gContent->getList($offset, $maxRecords, $sort_mode, $find, $add_sql);

// If there're more records then assign next_offset
$cant_pages = ceil($listirs["cant"] / $maxRecords);
$gBitSmarty->assign_by_ref('cant_pages', $cant_pages);
$gBitSmarty->assign('actual_page', 1 + ($offset / $maxRecords));

if ($listirs["cant"] > ($offset + $maxRecords)) {
	$gBitSmarty->assign('next_offset', $offset + $maxRecords);
} else {
	$gBitSmarty->assign('next_offset', -1);
}

// If offset is > 0 then prev_offset
if ($offset > 0) {
	$gBitSmarty->assign('prev_offset', $offset - $maxRecords);
} else {
	$gBitSmarty->assign('prev_offset', -1);
}

include_once( IRLIST_PKG_PATH.'display_list_header.php' );

$gBitSystem->setBrowserTitle("View Incident Reports List");
// Display the template
$gBitSystem->display( 'bitpackage:irlist/list.tpl');

?>
