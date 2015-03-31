{**
 * plugins/generic/staticPages/content.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display Static Page content
 *
 *}
{assign var="pageTitleTranslated" value=$title}
{include file="common/header.tpl"}

{$content}

<form id="inquiry" method="post" action="{url page="about" op="sendInquiry"}">
	<table class="data" width="100%">
		<tr>
			<td width="20%" class="label">{fieldLabel name="name" key="common.email.name"}</td>
			<td width="80%" class="value"><input type="text" name="name" size="30" maxlength="32" class="textField" required></td>
		</tr>
		<tr>
			<td width="20%" class="label">{fieldLabel name="email" key="common.email.address"}</td>
			<td width="80%" class="value"><input type="text" name="email" size="30" maxlength="90" class="textField" required></td>
		</tr>
		<tr>
			<td width="20%" class="label">{fieldLabel name="message" key="common.email.content"}</td>
			<td width="80%" class="value">
				<textarea id="message" name="message" rows="5" cols="40" class="textArea"></textarea>
			</td>
		</tr>
		<tr>
			<td width="20%">&nbsp;</td>
			<td width="80%"><input type="submit" value="{translate key="common.email.submit"}" class="button defaultButton"></td>
		</tr>
	</table>
</form>

{include file="common/footer.tpl"}
