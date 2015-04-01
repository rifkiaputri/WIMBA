<?php /* Smarty version 2.6.26, created on 2015-04-01 12:03:46
         compiled from common/journalManagement.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'common/journalManagement.tpl', 7, false),array('modifier', 'explode', 'common/journalManagement.tpl', 7, false),)), $this); ?>
<div id="adminSidebar">
	<div id="content">
		<ul>
			<li class="title">Management Pages</li>
			<li>
                                <?php $this->assign('pathPlugin', "generic/staticpagesplugin/edit/1"); ?>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'plugin','path' => ((is_array($_tmp=$this->_tpl_vars['pathPlugin'])) ? $this->_run_mod_handler('explode', true, $_tmp, "/") : $this->_plugins['modifier']['explode'][0][0]->smartyExplode($_tmp, "/"))), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-319-more-items.png">Edit Templates</span>
				</a>
			</li>
                        <li>
                                <?php $this->assign('pathPlugin', "generic/staticpagesplugin/edit/2"); ?>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'plugin','path' => ((is_array($_tmp=$this->_tpl_vars['pathPlugin'])) ? $this->_run_mod_handler('explode', true, $_tmp, "/") : $this->_plugins['modifier']['explode'][0][0]->smartyExplode($_tmp, "/"))), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-319-more-items.png">Edit Contact</span>
				</a>
			</li>
                        <li>
                                <?php $this->assign('pathPlugin', "generic/staticpagesplugin/edit/3"); ?>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'plugin','path' => ((is_array($_tmp=$this->_tpl_vars['pathPlugin'])) ? $this->_run_mod_handler('explode', true, $_tmp, "/") : $this->_plugins['modifier']['explode'][0][0]->smartyExplode($_tmp, "/"))), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-319-more-items.png">Edit Guide</span>
				</a>
			</li>
                        <li>
                                <?php $this->assign('pathPlugin', "generic/staticpagesplugin/edit/4"); ?>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'plugin','path' => ((is_array($_tmp=$this->_tpl_vars['pathPlugin'])) ? $this->_run_mod_handler('explode', true, $_tmp, "/") : $this->_plugins['modifier']['explode'][0][0]->smartyExplode($_tmp, "/"))), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-319-more-items.png">Edit About</span>
				</a>
			</li>
                        
                        <?php if ($this->_tpl_vars['enableAnnouncements']): ?>
                            <li id="announcements"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'announcements'), $this);?>
"><span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-319-more-items.png">Edit Announcement</span></a></li>
                        <?php endif; ?>			<li>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'files'), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-28-search.png">Files Browser</span>
				</a>
			</li>
						<li>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'reviewForms'), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-40-notes.png">Review Forms</span>
				</a>
			</li>
						<li>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'setup','path' => '3'), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-281-settings.png">Setup</span>
				</a>
			</li>
                       
			
			
			<li class="title">Roles</li>
			<li>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'people','path' => 'managers'), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-145-folder-open.png">Journal Managers</span>
				</a>
			</li>
			<li>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'people','path' => 'editors'), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-31-pencil.png">Editors</span>
				</a>
			</li>
						<li>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'people','path' => 'reviewers'), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-52-eye-open.png">Reviewers</span>
				</a>
			</li>
			<li>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'people','path' => 'authors'), $this);?>
">
					<span><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/icon/glyphicons-35-old-man.png">Authors</span>
				</a>
			</li>
								</ul>
	</div>
</div>