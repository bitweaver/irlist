<?php
$tables = array(

'bit_irlist_secondary' => "
  ir_id I4 PRIMARY,
  parent_id I4 NOTNULL,
  content_id I4 NOTNULL,
  project_name	C(10),
  revision C(10),
  closed I4,
  closed_user_id I4,
  status C(5),
  priority I2
",

);

global $gBitInstaller;

$gBitInstaller->makePackageHomeable('irlist');

foreach( array_keys( $tables ) AS $tableName ) {
	$gBitInstaller->registerSchemaTable( IRLIST_PKG_NAME, $tableName, $tables[$tableName] );
}

$gBitInstaller->registerPackageInfo( IRLIST_PKG_NAME, array(
	'description' => "Incident Report Tracker with management of project reports",
	'license' => '<a href="http://www.gnu.org/licenses/licenses.html#LGPL">LGPL</a>',
	'version' => '0.1',
	'state' => 'beta',
	'dependencies' => '',
) );

// ### Defaults

// ### Default User Permissions
$gBitInstaller->registerUserPermissions( IRLIST_PKG_NAME, array(
	array('bit_p_view_irlist', 'Can browse the IR List', 'basic', IRLIST_PKG_NAME),
	array('bit_p_edit_irlist', 'Can edit the IR List', 'registered', IRLIST_PKG_NAME),
) );

?>
