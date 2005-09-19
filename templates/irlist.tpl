{* $Header: /cvsroot/bitweaver/_bit_irlist/templates/Attic/irlist.tpl,v 1.1 2005/09/19 13:47:49 lsces Exp $ *}

<div class="floaticon">
{if $bit_p_admin_calendar eq 'y' or $bit_p_admin eq 'y'}
  <a href="{$gBitLoc.IRLIST_PKG_URL}admin/index.php"><img class="icon" src="{$gBitLoc.LIBERTY_PKG_URL}icons/config.gif"  alt="{tr}admin{/tr}" /></a>
{/if}
</div>

<div class="display irlist">
<div class="header">
<h1><a href="{$gBitLoc.IRLIST_PKG_URL}index.php?view={$view}">{tr}Incident Report List{/tr}</a></h1>
</div>

