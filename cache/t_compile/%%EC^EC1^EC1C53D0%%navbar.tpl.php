<?php /* Smarty version 2.6.26, created on 2015-03-07 07:52:47
         compiled from common/navbar.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'common/navbar.tpl', 13, false),array('function', 'translate', 'common/navbar.tpl', 13, false),array('function', 'call_hook', 'common/navbar.tpl', 43, false),)), $this); ?>
<div id="navbar">
	<ul class="menu">
		<li id="home"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'index'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.home"), $this);?>
</a></li>
		<li id="about"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.about"), $this);?>
</a></li>
                <li id="guide"><a href="http://localhost/ojs-2.4.5/index.php/test/pages/view/guide">Submission Guide</a></li>
                <li id="template"><a href="http://localhost/ojs-2.4.5/index.php/test/pages/view/templates">Templates</a></li>
                <li id="contact"><a href="http://localhost/ojs-2.4.5/index.php/test/pages/view/contact">Contact</a></li>
		<?php if ($this->_tpl_vars['isUserLoggedIn']): ?>
			<li id="userHome"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => 'index','page' => 'user'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.userHome"), $this);?>
</a></li>
		<?php else: ?>
			<?php if (! $this->_tpl_vars['hideRegisterLink']): ?>
				<li id="register"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'register'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.register"), $this);?>
</a></li>
			<?php endif; ?>
		<?php endif; ?>
		<?php if ($this->_tpl_vars['siteCategoriesEnabled']): ?>
			<li id="categories"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => 'index','page' => 'search','op' => 'categories'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.categories"), $this);?>
</a></li>
		<?php endif; ?>                
		<?php if ($this->_tpl_vars['enableAnnouncements']): ?>
			<li id="announcements"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'announcement'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "announcement.announcements"), $this);?>
</a></li>
		<?php endif; ?>
		<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Common::Header::Navbar::CurrentJournal"), $this);?>

                	</ul>
</div>