<?php
/**
 * $Header$
 *
 * Copyright ( c ) 2004 bitweaver.org
 * All Rights Reserved. See below for details and a complete list of authors.
 * Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See http://www.gnu.org/copyleft/lesser.html for details
 *
 * @package irlist
 * @subpackage functions
 */

$project_array = $gContent->getProjectList();
$gBitSmarty->assign_by_ref('project_array', $project_array["data"]);

$status_array = array();
$status_array_p = array();
$status_array[] = 'A';
$status_array_p[] = 'All';
$status_array[] = 'O';
$status_array_p[] = 'Open';
$status_array[] = 'C';
$status_array_p[] = 'Closed';
$status_array[] = 'X';
$status_array_p[] = 'Invalid';
$gBitSmarty->assign('status_array', $status_array);
$gBitSmarty->assign('status_array_p', $status_array_p);

$priority_array = array();
$priority_array[] = 'A';
$priority_array[] = '1';
$priority_array[] = '2';
$priority_array[] = '3';
$gBitSmarty->assign('priority_array', $priority_array);
$gBitSmarty->assign('priority_array_p', $priority_array);

$gBitSmarty->assign_by_ref('listirs', $listirs);
$section = 'irlist';

?>