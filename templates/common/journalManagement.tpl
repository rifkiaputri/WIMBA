<div id="adminSidebar">
	<div id="content">
		<ul>
			<li class="title">Management Pages</li>
			<li>
                                {assign var="pathPlugin" value="generic/staticpagesplugin/edit/1"}
				<a href="{url op="plugin" path=$pathPlugin|explode:"/"}">
					<span><img src="{$baseUrl}/icon/glyphicons-319-more-items.png">Edit Templates</span>
				</a>
			</li>
                        <li>
                                {assign var="pathPlugin" value="generic/staticpagesplugin/edit/2"}
				<a href="{url op="plugin" path=$pathPlugin|explode:"/"}">
					<span><img src="{$baseUrl}/icon/glyphicons-319-more-items.png">Edit Contact</span>
				</a>
			</li>
                        <li>
                                {assign var="pathPlugin" value="generic/staticpagesplugin/edit/3"}
				<a href="{url op="plugin" path=$pathPlugin|explode:"/"}">
					<span><img src="{$baseUrl}/icon/glyphicons-319-more-items.png">Edit Guide</span>
				</a>
			</li>
                        <li>
                                {assign var="pathPlugin" value="generic/staticpagesplugin/edit/4"}
				<a href="{url op="plugin" path=$pathPlugin|explode:"/"}">
					<span><img src="{$baseUrl}/icon/glyphicons-319-more-items.png">Edit About</span>
				</a>
			</li>
                        
                        {if $enableAnnouncements}
                            <li id="announcements"><a href="{url op="announcements"}"><span><img src="{$baseUrl}/icon/glyphicons-319-more-items.png">Edit Announcement</span></a></li>
                        {/if}{* enableAnnouncements *}
			<li>
				<a href="{url op="files"}">
					<span><img src="{$baseUrl}/icon/glyphicons-28-search.png">Files Browser</span>
				</a>
			</li>
			{*<li>
				<a href="{url op="sections"}">
					<span><img src="{$baseUrl}/icon/glyphicons-609-newspaper.png">Journal Sections</span>
				</a>
			</li>*}
			<li>
				<a href="{url op="reviewForms"}">
					<span><img src="{$baseUrl}/icon/glyphicons-40-notes.png">Review Forms</span>
				</a>
			</li>
			{*<li>
				<a href="{url op="languages"}">
					<span><img src="{$baseUrl}/icon/glyphicons-245-conversation.png">Languages</span>
				</a>
			</li>*}
			<li>
				<a href="{url op="setup" path="3"}">
					<span><img src="{$baseUrl}/icon/glyphicons-281-settings.png">Setup</span>
				</a>
			</li>
                       
			{*<li>
				<a href="{url op="statistics"}">
					<span><img src="{$baseUrl}/icon/glyphicons-41-stats.png">Stats & Reports</span>
				</a>
			</li>*}

			{*<li class="title">Users</li>
			<li>
				<a href="http://localhost/ojs-2.4.5/index.php/apa/manager/people/all">
					<span><img src="http://localhost/ojs-2.4.5/icon/glyphicons-522-user-lock.png">Users Enrolled in this Journal</span>
				</a>
			</li>
			<li>
				<a href="http://localhost/ojs-2.4.5/index.php/apa/manager/enrollSearch">
					<span><img src="http://localhost/ojs-2.4.5/icon/glyphicons-526-user-key.png">Enroll a User from this Site in this Journal</span>
				</a>
			</li>
			<li>
				<a href="http://localhost/ojs-2.4.5/index.php/apa/manager/showNoRole">
					<span><img src="http://localhost/ojs-2.4.5/icon/glyphicons-521-user-ban.png">Show Users with No Role</span>
				</a>
			</li>
			<li>
				<a href="http://localhost/ojs-2.4.5/index.php/apa/manager/createUser?source=http%3A%2F%2Flocalhost%2Fojs-2.4.5%2Findex.php%2Fapa%2Fmanager">
					<span><img src="http://localhost/ojs-2.4.5/icon/glyphicons-524-user-asterisk.png">Create New User</span>
				</a>
			</li>
			<li>
				<a href="http://localhost/ojs-2.4.5/index.php/apa/manager/mergeUsers">
					<span><img src="http://localhost/ojs-2.4.5/icon/glyphicons-25-parents.png">Merge Users</span>
				</a>
			</li>*}

			<li class="title">Roles</li>
			<li>
				<a href="{url op="people" path="managers"}">
					<span><img src="{$baseUrl}/icon/glyphicons-145-folder-open.png">Journal Managers</span>
				</a>
			</li>
			<li>
				<a href="{url op="people" path="editors"}">
					<span><img src="{$baseUrl}/icon/glyphicons-31-pencil.png">Editors</span>
				</a>
			</li>
			{*<li>
				<a href="http://localhost/ojs-2.4.5/index.php/apa/manager/people/sectionEditors">
					<span><img src="http://localhost/ojs-2.4.5/icon/glyphicons-353-nameplate.png">Section Editors</span>
				</a>
			</li>*}
			<li>
				<a href="{url op="people" path="reviewers"}">
					<span><img src="{$baseUrl}/icon/glyphicons-52-eye-open.png">Reviewers</span>
				</a>
			</li>
			<li>
				<a href="{url op="people" path="authors"}">
					<span><img src="{$baseUrl}/icon/glyphicons-35-old-man.png">Authors</span>
				</a>
			</li>
			{*<li>
				<a href="http://localhost/ojs-2.4.5/index.php/apa/manager/people/readers">
					<span><img src="http://localhost/ojs-2.4.5/icon/glyphicons-352-book-open.png">Readers</span>
				</a>
			</li>*}
			{*<li>
				<a href="http://localhost/ojs-2.4.5/index.php/apa/manager/people/subscriptionManagers">
					<span><img src="http://localhost/ojs-2.4.5/icon/glyphicons-33-wifi-alt.png">Subscription Managers</span>
				</a>
			</li>*}
		</ul>
	</div>
</div>