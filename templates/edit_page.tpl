{* $Header$ *}
<div class="floaticon">{bithelp}</div>

{assign var=serviceEditTpls value=$gLibertySystem->getServiceValues('content_edit_tpl')}

<div class="admin irlist">
	<div class="header">
		<h1>
		{* this weird dual assign thing is cause smarty wont interpret backticks to object in assign tag - spiderr *}
		{assign var=conDescr value=$gContent->getContentTypeName()}
		{if $contentInfo.ir_id}
			{assign var=editLabel value="{tr}Edit{/tr} $conDescr"}
			{tr}{tr}Edit{/tr} {$contentInfo.title}{/tr}
		{else}
			{assign var=editLabel value="{tr}Create{/tr} $conDescr"}
			{tr}{$editLabel}{/tr}
		{/if}
		</h1>
	</div>

	{* Check to see if there is an editing conflict *}
	{if $errors.edit_conflict}
		<script language="javascript" type="text/javascript">
			<!--
				alert( "{$errors.edit_conflict|strip_tags}" );
			-->
		</script>
		{formfeedback warning=`$errors.edit_conflict`}
	{/if}

	{strip}
	<div class="body">
		{form enctype="multipart/form-data" id="editpageform"}
			{jstabs}
				{jstab title="$editLabel Body"}
					{legend legend="`$editLabel` Body"}
						<input type="hidden" name="content_id" value="{$contentInfo.content_id}" />
						<input type="hidden" name="ir_id" value="{$contentInfo.ir_id}" />

						<div class="row">
							{formfeedback warning=`$errors.title`}

							{if !$contentInfo.page_id}
							{formlabel label="$conDescr IRNumber" for="irno"}
								{forminput}
									New Incident Report
								{/forminput}
							{/if}
							<table>
								<tr>
									<td width="30%">
									</td>
									<td width="35%">
										{formlabel label="Project" for="project_name"}
										{forminput}
											<input type="text" size="12" maxlength="10" name="project_name" id="project_name" value="{$contentInfo.project_name}" />
										{/forminput}
									</td>
									<td width="35%">
										{formlabel label="Revision" for="revision"}
										{forminput}
											<input type="text" size="12" maxlength="10" name="revision" id="revision" value="{$contentInfo.revision}" />
										{/forminput}
									</td>
								</tr>
								<tr>
									<td width="30%">
									</td>
									<td width="35%">
										{formlabel label="Status" for="status"}
										{forminput}
											{html_options values="$status_array" output="$status_array_p" name=status selected="$info.status" id=status}
										{/forminput}
									</td>
									<td width="35%">
										{formlabel label="Priority" for="priority"}
										{forminput}
											{html_options values="$priority_array" output="$priority_array_p" name=priority selected="$info.priority" id=priority}
										{/forminput}
									</td>
								</tr>
							</table>
							{formlabel label="$conDescr Title" for="title"}
							{forminput}
								{if $gBitUser->hasPermission( 'bit_p_rename' ) || !$contentInfo.page_id}
									<input type="text" size="50" maxlength="200" name="title" id="title" value="{$contentInfo.title}" />
								{else}
									{$page} {$contentInfo.title}
								{/if}
							{/forminput}

						</div>

						{if $gBitSystem->isPackageActive( 'quicktags' )}
							{include file="bitpackage:quicktags/quicktags_full.tpl"}
						{/if}

						<div class="row">
							{forminput}
								<textarea id="{$textarea_id}" name="edit" rows="{$rows|default:20}" cols="{$cols|default:80}">{$contentInfo.data|escape:html}</textarea>
							{/forminput}
						</div>

						{if $page ne 'SandBox'}
							<div class="row">
								{formlabel label="Comment" for="comment"}
								{forminput}
									<input size="50" type="text" name="comment" id="comment" value="{$contentInfo.comment}" />
									{formhelp note="Add a comment to illustrate your most recent changes."}
								{/forminput}
							</div>
						{/if}

						{include file="bitpackage:liberty/edit_services_inc.tpl" serviceFile="content_edit_mini_tpl"}

						<div class="row submit">
							<input type="submit" name="fCancel" value="{tr}Cancel{/tr}" />&nbsp;
							<input type="submit" name="fSavePage" value="{tr}Save{/tr}" />
						</div>

					{/legend}
				{/jstab}
			{/jstabs}
		{/form}

		<br /><br />
		{include file="bitpackage:liberty/edit_help_inc.tpl"}

	</div><!-- end .body -->
</div><!-- end .admin -->

{/strip}
