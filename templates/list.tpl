{strip}

<div class="floaticon">{bithelp}</div>

<div class="listing irs">
	<div class="header">
		<h1>{tr}Incident Reports{/tr}</h1>
	</div>

	<div class="body">

		{include file="bitpackage:irlist/display_list_header.tpl"}

		<div class="navbar">
			<ul>
				<li>{biticon ipackage=liberty iname=sort iexplain="sort by"}</li>
				{if $gBitSystem->isFeatureActive( 'ir_list_title' )}
					<li>{smartlink ititle="IR Number" isort="ir_id" idefault=1 iorder=desc offset=$offset ihash=$listInfo.ihash}</li>
					<li>{smartlink ititle="Title" isort="title" offset=$offset ihash=$listInfo.ihash}</li>
				{/if}
				{if $gBitSystem->isFeatureActive( 'ir_list_created' )}
					<li>{smartlink ititle="Created" isort="created" iorder=desc offset=$offset ihash=$listInfo.ihash}</li>
				{/if}
				{if $gBitSystem->isFeatureActive( 'ir_list_lastmodif' )}
					<li>{smartlink ititle="Last Modified" isort="last_modified" iorder=desc offset=$offset ihash=$listInfo.ihash}</li>
				{/if}
				{if $gBitSystem->isFeatureActive( 'ir_list_user' )}
					<li>{smartlink ititle="Creator" isort="user" offset=$offset ihash=$listInfo.ihash}</li>
				{/if}
				{if $gBitSystem->isFeatureActive( 'ir_list_project' )}
					<li>{smartlink ititle="Project" isort="project_name" iorder=desc offset=$offset ihash=$listInfo.ihash}</li>
				{/if}
				{if $gBitSystem->isFeatureActive( 'ir_list_version' )}
					<li>{smartlink ititle="Version" isort="revision" iorder=desc offset=$offset ihash=$listInfo.ihash}</li>
				{/if}
			</ul>
		</div>

		<ul class="clear data">
			{foreach item=changes from=$listirs}
				<li class="item {cycle values='odd,even'}">
					<div class="floaticon">
						{if ($gBitUser->mUserId and $changes.user_id eq $gBitUser->mUserId) or ($changes.public eq 'y')}
							<a title="{tr}edit{/tr}" href="{$smarty.const.IRLIST_PKG_URL}edit.php?content_id={$changes.content_id}">{biticon ipackage=liberty iname="edit" iexplain="edit"}</a>
						{/if}
						{if ($gBitUser->mUserId and $changes.user_id eq $gBitUser->mUserId)}
							{if ($gBitUser->isAdmin()) or ($changes.individual eq 'n')}
								<a title="{tr}remove{/tr}" href="{$smarty.const.IRLIST_PKG_URL}list.php?offset={$offset}&amp;sort_mode={$sort_mode}&amp;remove={$changes.content_id}">{biticon ipackage=liberty iname="delete" iexplain="delete"}</a>
							{/if}
						{/if}
					</div>

					{if $gBitSystem->isFeatureActive( 'ir_list_title' )}
						<h2><a title="{$changes.title}" href="{$changes.irlist_url}">
						IR-{$changes.ir_id} - {$changes.title}{if ($gBitUser->isAdmin()) or ($changes.individual eq 'n')}</a>{/if}</h2>
					{/if}

					{if $gBitSystem->isFeatureActive( 'ir_list_description' )}
						<p>{$changes.description}</p>
					{/if}

					<div class="date">
						{if $gBitSystem->isFeatureActive( 'ir_list_user' )}
							{tr}Created by {$changes.creator_real_name}{/tr}
						{/if}

						{if $gBitSystem->isFeatureActive( 'ir_list_created' )}
							{tr}{if $ir_list_user ne 'y'}<br />Created{/if} on {$changes.created|bit_short_date}{/tr}
							<br />
						{/if}

							{tr}Modified by {$changes.modifier_real_name}{/tr}
						{if $gBitSystem->isFeatureActive( 'ir_list_lastmodif' )}
							{tr} on {$changes.last_modified|bit_short_datetime}{/tr}
						{/if}
					</div>

					<div class="footer">
							{tr}Project{/tr}: {$changes.project_name}&nbsp;&bull;&nbsp;
							{tr}Version{/tr}: {$changes.revision}&nbsp;&bull;&nbsp;
							{tr}Status{/tr}: {$changes.status}&nbsp;&bull;&nbsp;
							{tr}Priority{/tr}: {$changes.priority}&nbsp;&bull;&nbsp;
						
						{if $ir_list_visits eq 'y'}
							{tr}Visits{/tr}: {$changes.hits}&nbsp;&bull;&nbsp;
						{/if}
						
						{if $ir_list_activity eq 'y'}
							{tr}Activity{/tr}: {$changes.activity|default:0}
						{/if}
					</div>

					<div class="clear"></div>
				<li>
			{foreachelse}
				<li class="item norecords">
					{tr}No records found{/tr}
				</li>
			{/foreach}
		</ul>

		{pagination}
	</div><!-- end .body -->
</div><!-- end .irlist -->

{/strip}
