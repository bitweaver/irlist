{strip}
<div class="body"{if $user_dbl eq 'y' and $dblclickedit eq 'y' and $gBitUser->hasPermission( 'bit_p_edit' )} ondblclick="location.href='{$smarty.const.IRLIST_PKG_URL}edit.php?content_id={$contentInfo.content_id}';"{/if}>
	<div class="header">
		{tr}<h1>Project-{$contentInfo.project_name}{/tr}{tr} Version-{$contentInfo.revision}</h1>{/tr}
	</div>
	{if $contentInfo.status=='C' }
	<div class="date">
		{tr}Closed by {displayname user=$contentInfo.closed_user user_id=$contentInfo.closed_user_id real_name=$contentInfo.closed_real_name} on {$contentInfo.closed|bit_short_datetime}{/tr}
	</div>
	{/if}
	{if $contentInfo.status=='O' }
	<div class="date">
		{tr}Incident Report Open - Priority {$contentInfo.priority} {/tr}
	</div>
	{/if}
	{if $contentInfo.status=='X' }
	<div class="date">
		{tr}Incident Report Cancelled{/tr}
	</div>
	{/if}
	<div class="header">
		{tr}<h1>{$contentInfo.title}</h1>{/tr}
	</div>
	<div class="content">
		{$parsed}
		<div class="clear"></div>
	</div> <!-- end .content -->
</div> <!-- end .body -->
{/strip}
