{strip}
<ul>
	<li><a class="item" href="{$smarty.const.IRLIST_PKG_URL}list.php">{tr}List Incident Reports{/tr}</a></li>
	{if $gBitUser->isAdmin() or $gBitUser->hasPermission( 'bit_p_edit_irlist' ) }
		<li><a class="item" href="{$smarty.const.IRLIST_PKG_URL}edit.php">{tr}Create an Incident Report{/tr}</a></li>
	{/if}
</ul>
{/strip}