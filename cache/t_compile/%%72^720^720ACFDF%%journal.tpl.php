<?php /* Smarty version 2.6.26, created on 2015-04-30 05:44:25
         compiled from index/journal.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'call_hook', 'index/journal.tpl', 20, false),array('function', 'translate', 'index/journal.tpl', 23, false),array('modifier', 'escape', 'index/journal.tpl', 23, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitleTranslated', $this->_tpl_vars['siteTitle']); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<?php if ($this->_tpl_vars['journalDescription']): ?>
	<div id="journalDescription"><?php echo $this->_tpl_vars['journalDescription']; ?>
</div>
<?php endif; ?>

<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Index::journal"), $this);?>


<?php if ($this->_tpl_vars['homepageImage']): ?>
<div id="homepageImage"><img src="<?php echo $this->_tpl_vars['publicFilesDir']; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['homepageImage']['uploadName'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'url')); ?>
" width="<?php echo ((is_array($_tmp=$this->_tpl_vars['homepageImage']['width'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" height="<?php echo ((is_array($_tmp=$this->_tpl_vars['homepageImage']['height'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" <?php if ($this->_tpl_vars['homepageImageAltText'] != ''): ?>alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['homepageImageAltText'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"<?php else: ?>alt="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.journalHomepageImage.altText"), $this);?>
"<?php endif; ?> /></div>
<?php endif; ?>

<?php if ($this->_tpl_vars['additionalHomeContent']): ?>
<div id="additionalHomeContent"><?php echo $this->_tpl_vars['additionalHomeContent']; ?>
</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['enableAnnouncementsHomepage']): ?>
		<div id="announcementsHome">
				<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "announcement/list.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>	
			</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['issue'] && $this->_tpl_vars['currentJournal']->getSetting('publishingMode') != @PUBLISHING_MODE_NONE): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "issue/view.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
