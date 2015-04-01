{**
 * templates/common/navbar.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}
 {php}
    $templateMgr = TemplateManager::getManager();
    $journal =& Request::getJournal();
    $issueDao =& DAORegistry::getDAO('IssueDAO');
    $publishedIssuesIterator = $issueDao->getPublishedIssues($journal->getId(), $rangeInfo);
    $templateMgr->assign_by_ref('issues', $publishedIssuesIterator);
{/php}
<div id="navbar">
	<ul class="menu">
		<li id="home"><a href="{url page="index"}">{translate key="navigation.home"}</a></li>
                <li><a>|</a></li>
		<li id="about"><a href="{url page="pages" op="view" path="about"}">{translate key="navigation.about"}</a></li>
                <li><a>|</a></li>
                <li id="article"><a>Article &#9662;</a>
                        <ul>
                            {iterate from=issues item=issue}
                                <li><a>{$issue->getYear()} &#9656;</a>
                                        <ul>
                                            {assign var="year" value=$issue->getYear()}
                                            {php}
                                                $publishedIssuesByYear = $issueDao->getPublishedIssuesByNumber($journal->getId(), null, null, $this->get_template_vars('year'));
                                                while($issueYear = $publishedIssuesByYear->next()){
                                                //echo'a';    
                                                    echo '<li><a href="'.Request::url(null, "issue", "view", $issueYear->getBestIssueId($currentJournal), null, null, false).'">'.$issueYear->getIssueIdentification().'</a></li>'; 
                                                }
                                            {/php}
                                        </ul>
                                </li>
                             {/iterate}
                        </ul>
                </li>
                <li><a>|</a></li>
                <li id="guide"><a href="{url page="pages" op="view" path="guide"}">Submission Guide</a></li>
                <li><a>|</a></li>
                <li id="contact"><a href="{url page="pages" op="view" path="contact"}">Contact</a></li>
		<li><a>|</a></li>
                {if $isUserLoggedIn}
			<li id="userHome"><a href="{url journal="wimba" page="user"}">{translate key="navigation.userHome"}</a></li>
		{else}
			{if !$hideRegisterLink}
				<li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
			{/if}
		{/if}{* $isUserLoggedIn *}

		{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="search" op="categories"}">{translate key="navigation.categories"}</a></li>
		{/if}{* $categoriesEnabled *}
                {*
		{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="search"><a href="{url page="search"}">{translate key="navigation.search"}</a></li>
		{/if}
		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="current"><a href="{url page="issue" op="current"}">{translate key="navigation.current"}</a></li>
			<li id="archives"><a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a></li>
		{/if}
                *}
                
                {*

		{if $enableAnnouncements}
			<li id="announcements"><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
		{/if}{* enableAnnouncements 
                
                *}

		{call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}
                {*
		{foreach from=$navMenuItems item=navItem key=navItemKey}
			{if $navItem.url != '' && $navItem.name != ''}
				<li class="navItem" id="navItem-{$navItemKey|escape}"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
                *}
	</ul>
</div>
