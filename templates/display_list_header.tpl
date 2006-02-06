<div class="find">
	{form class="find" legend="Find in Incident Report entries"}
		{foreach from=$hidden item=value key=name}
			<input type="hidden" name="{$name}" value="{$value}" />
		{/foreach}
		{formlabel label="Project" for="project_name"}
		{forminput}
			{html_options values="$project_array" output="$project_array" name=project selected=`$listInfo.ihash.project` id=project}
		{/forminput}
		{formlabel label="Version" for="version"}
		{forminput}
			<input type="text" size="12" maxlength="10" name="version" id="version" value="{$listInfo.ihash.version}" />
		{/forminput}
		{formlabel label="Status" for="status"}
		{forminput}
			{html_options values="$status_array" output="$status_array_p" name=status selected=`$listInfo.ihash.status` id=status}
		{/forminput}
		{formlabel label="Priority" for="priority"}
		{forminput}
			{html_options values="$priority_array" output="$priority_array_p" name=priority selected=`$listInfo.ihash.priority` id=priority}
		{/forminput}
		<input type="submit" name="search" value="{tr}Filter{/tr}" />&nbsp;
		<input type="button" onclick="location.href='{$smarty.server.PHP_SELF}{if $hidden}?{/if}{foreach from=$hidden item=value key=name}{$name}={$value}&amp;{/foreach}'" value="{tr}Reset{/tr}" />
	{/form}
</div>

