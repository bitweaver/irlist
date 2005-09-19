{if $gBitSystem->isPackageActive( 'pigeonholes' )}
	{include file="bitpackage:pigeonholes/display_paths.tpl"}
{/if}

<div class="display irlist">
	<div class="header">
		<h1>IR-{$contentInfo.ir_id}</h1>
	</div>
	<div class="date">
		{tr}Created by {displayname user=$contentInfo.creator_user user_id=$contentInfo.creator_user_id real_name=$contentInfo.creator_real_name}, Last modification by {displayname user=$contentInfo.modifier_user user_id=$contentInfo.modifier_user_id real_name=$contentInfo.modifier_real_name} on {$contentInfo.last_modified|bit_short_datetime}{/tr}
	</div>

	{if $comments_at_top_of_page eq 'y' and $print_page ne 'y'}
		{include file="bitpackage:liberty/comments.tpl"}
	{/if}

	{if $gBitSystem->isPackageActive( 'stickies' )}
		{include file="bitpackage:stickies/display_bitsticky.tpl"}
	{/if}

	{include file="bitpackage:irlist/page_display.tpl"}

	{if $print_page ne 'y'}
		{include file="bitpackage:irlist/page_action_bar.tpl"}
	{/if}
</div>
{if $comments_at_top_of_page ne 'y' and $print_page ne 'y'}
	{include file="bitpackage:liberty/comments.tpl"}
{/if}

{if $gBitSystem->isPackageActive( 'pigeonholes' )}
	{include file="bitpackage:pigeonholes/display_members.tpl"}
{/if}