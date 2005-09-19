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
				{if $ir_list_title eq 'y'}
					<li>{smartlink ititle="IR Number" isort="ir_id" idefault=1 iorder=desc offset=$offset ihash=$ihash}</li>
					<li>{smartlink ititle="Title" isort="title" offset=$offset ihash=$ihash}</li>
				{/if}
				{if $ir_list_created eq 'y'}
					<li>{smartlink ititle="Created" isort="created" iorder=desc offset=$offset ihash=$ihash}</li>
				{/if}
				{if $ir_list_lastmodif eq 'y'}
					<li>{smartlink ititle="Last Modified" isort="last_modified" iorder=desc offset=$offset ihash=$ihash}</li>
				{/if}
				{if $ir_list_user eq 'y'}
					<li>{smartlink ititle="Creator" isort="user" offset=$offset ihash=$ihash}</li>
				{/if}
				{if $ir_list_notes eq 'y'}
					<li>{smartlink ititle="Notes" isort="notes" iorder=desc offset=$offset ihash=$ihash}</li>
				{/if}
			</ul>
		</div>

		<ul class="clear data">
			{section name=changes loop=$listirs}
				<li class="item {cycle values='odd,even'}">
					<div class="floaticon">
						{if ($gBitUser->mUserId and $listirs[changes].user_id eq $gBitUser->mUserId) or ($listirs[changes].public eq 'y')}
							<a title="{tr}edit{/tr}" href="{$smarty.const.IRLIST_PKG_URL}edit.php?content_id={$listirs[changes].content_id}">{biticon ipackage=liberty iname="edit" iexplain="edit"}</a>
						{/if}
						{if ($gBitUser->mUserId and $listirs[changes].user_id eq $gBitUser->mUserId)}
							{if ($gBitUser->isAdmin()) or ($listirs[changes].individual eq 'n')}
								<a title="{tr}remove{/tr}" href="{$smarty.const.IRLIST_PKG_URL}list.php?offset={$offset}&amp;sort_mode={$sort_mode}&amp;remove={$listirs[changes].content_id}">{biticon ipackage=liberty iname="delete" iexplain="delete"}</a>
							{/if}
						{/if}
					</div>

					{if $ir_list_title eq 'y'}
						<h2><a title="{$listirs[changes].title}" href="{$listirs[changes].irlist_url}">
						IR-{$listirs[changes].ir_id} - {$listirs[changes].title}{if ($gBitUser->isAdmin()) or ($listirs[changes].individual eq 'n')}</a>{/if}</h2>
					{/if}

					{if $ir_list_description eq 'y'}
						<p>{$listirs[changes].description}</p>
					{/if}

					<div class="date">
						{if $ir_list_user eq 'y'}
							{tr}Created by {$listirs[changes].creator_real_name}{/tr}
						{/if}

						{if $ir_list_created eq 'y'}
							{tr}{if $ir_list_user ne 'y'}<br />Created{/if} on {$listirs[changes].created|bit_short_date}{/tr}
							<br />
						{/if}

							{tr}Modified by {$listirs[changes].modifier_real_name}{/tr}
						{if $ir_list_lastmodif eq 'y'}
							{tr} on {$listirs[changes].last_modified|bit_short_datetime}{/tr}
						{/if}
					</div>

					<div class="footer">
							{tr}Project{/tr}: {$listirs[changes].project_name}&nbsp;&bull;&nbsp;
							{tr}Version{/tr}: {$listirs[changes].revision}&nbsp;&bull;&nbsp;
							{tr}Status{/tr}: {$listirs[changes].status}&nbsp;&bull;&nbsp;
							{tr}Priority{/tr}: {$listirs[changes].priority}&nbsp;&bull;&nbsp;
						
						{if $ir_list_visits eq 'y'}
							{tr}Visits{/tr}: {$listirs[changes].hits}&nbsp;&bull;&nbsp;
						{/if}
						
						{if $ir_list_activity eq 'y'}
							{tr}Activity{/tr}: {$listirs[changes].activity|default:0}
						{/if}
					</div>

					<div class="clear"></div>
				<li>
			{sectionelse}
				<li class="item norecords">
					{tr}No records found{/tr}
				</li>
			{/section}
		</ul>

		{libertypagination numPages=$cant_pages page=$actual_page ihash=$ihash}
	</div><!-- end .body -->
</div><!-- end .irlist -->

{/strip}
