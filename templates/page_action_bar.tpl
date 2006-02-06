{if $print_page ne 'y'}
<div class="navbar">
	<ul>
		{if $gBitUser->hasPermission( 'bit_p_view_tabs_and_tools' )}
			{if !$lock}
				{assign var=format_guid value=$contentInfo.format_guid}
				{if $gLibertySystem->mPlugins.$format_guid.is_active eq 'y'}
					{if $gBitUser->hasPermission( 'bit_p_edit' ) }
						<li><a href="{$smarty.const.IRLIST_PKG_URL}edit.php?content_id={$contentInfo.content_id}">{tr}Edit{/tr}</a></li>
					{/if}
				{/if}
			{/if}
			{if $page}
				{if $gBitSystem->isFeatureActive( 'content_history' )}
					<li><a href="{$smarty.const.IRLIST_PKG_URL}page_history.php?content_id={$contentInfo.content_id}">{tr}History{/tr}</a></li>
				{/if}
			{/if}
			{if $gBitSystem->isFeatureActive( 'like_pages' )}
				<li><a href="{$smarty.const.IRLIST_PKG_URL}like_pages.php?content_id={$contentInfo.content_id}">{tr}Project{/tr}</a></li>
			{/if}
		{/if}
	</ul>
</div>
{/if}
