{**
 * plugins/generic/counter/index.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Counter plugin index
 *}
{strip}
{assign var="pageTitle" value="plugins.reports.counter"}
{include file="common/header.tpl"}
{/strip}

<p>{translate key="plugins.reports.counter.description"}</p>

<ul class="plain">
	<li>&#187; {translate key="plugins.reports.counter.1a.title"}{foreach from=$years item=year}&nbsp;&nbsp;<a href="{url path="CounterReportPlugin" type="report" year=$year}">{$year|escape}</a>{/foreach}</li>
	<li>&#187; XML version {foreach from=$years item=year}&nbsp;&nbsp;<a href="{url path="CounterReportPlugin" type="reportxml" year=$year}">{$year|escape}</a>{/foreach}</li>
</ul>

{if $legacyYears}
	<p>{translate key="plugins.reports.counter.legacyStats"}</p>
	<ul class="plain">
		<li>&#187; {translate key="plugins.reports.counter.1a.title"}{foreach from=$legacyYears item=year}&nbsp;&nbsp;<a href="{url path="CounterReportPlugin" type="report" year=$year useOldCounterStats=true}">{$year|escape}</a>{/foreach}</li>
		<li>&#187; XML version {foreach from=$legacyYears item=year}&nbsp;&nbsp;<a href="{url path="CounterReportPlugin" type="reportxml" year=$year useOldCounterStats=true}">{$year|escape}</a>{/foreach}</li>
	</ul>
{/if}

{include file="common/footer.tpl"}
