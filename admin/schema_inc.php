<?php
$tables = array(

'irlist_secondary' => "
  ir_id I4 PRIMARY,
  parent_id I4 NOTNULL,
  content_id I4 NOTNULL,
  project_name	C(10),
  revision C(10),
  assigned I8,
  assigned_user_id I4,
  closed I8,
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
	'version' => '0.2',
	'state' => 'beta',
	'dependencies' => '',
) );

// ### Sequences
$sequences = array (
	'ir_id_seq' => array( 'start' => 1 )
);

$gBitInstaller->registerSchemaSequences( IRLIST_PKG_NAME, $sequences );

// ### Defaults

// ### Default User Permissions
$gBitInstaller->registerUserPermissions( IRLIST_PKG_NAME, array(
	array('p_view_irlist', 'Can browse the IR List', 'basic', IRLIST_PKG_NAME),
	array('p_edit_irlist', 'Can edit the IR List', 'registered', IRLIST_PKG_NAME),
) );

// ### Default Preferences
$gBitInstaller->registerPreferences( IRLIST_PKG_NAME, array(
	array( IRLIST_PKG_NAME, 'ir_list_created','y'),
	array( IRLIST_PKG_NAME, 'ir_list_lastmodif','y'),
	array( IRLIST_PKG_NAME, 'ir_list_project','y'),
	array( IRLIST_PKG_NAME, 'ir_list_version','y'),
	array( IRLIST_PKG_NAME, 'ir_list_title','y'),
	array( IRLIST_PKG_NAME, 'ir_list_user','y'),
	array( IRLIST_PKG_NAME, 'irlist_comments','y'),
) );

?>
