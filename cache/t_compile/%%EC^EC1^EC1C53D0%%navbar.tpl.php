<?php /* Smarty version 2.6.26, created on 2015-03-24 04:26:21
         compiled from common/navbar.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'common/navbar.tpl', 20, false),array('function', 'translate', 'common/navbar.tpl', 20, false),array('function', 'call_hook', 'common/navbar.tpl', 68, false),array('block', 'iterate', 'common/navbar.tpl', 24, false),)), $this); ?>
 <?php 
    $templateMgr = TemplateManager::getManager();
    $journal =& Request::getJournal();
    $issueDao =& DAORegistry::getDAO('IssueDAO');
    $publishedIssuesIterator = $issueDao->getPublishedIssues($journal->getId(), $rangeInfo);
    $templateMgr->assign_by_ref('issues', $publishedIssuesIterator);
 ?>
<div id="navbar">
	<ul class="menu">
		<li id="home"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'index'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.home"), $this);?>
</a></li>
		<li id="about"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'pages','op' => 'view','path' => 'about'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.about"), $this);?>
</a></li>
				<li id="article"><a>Article &#9662;</a>
					<ul>
                                            <?php $this->_tag_stack[] = array('iterate', array('from' => 'issues','item' => 'issue')); $_block_repeat=true;$this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
						<li><a><?php echo $this->_tpl_vars['issue']->getYear(); ?>
 &#9656;</a>
							<ul>
                                                            <?php $this->assign('year', $this->_tpl_vars['issue']->getYear()); ?>
                                                            <?php 
                                                                $publishedIssuesByYear = $issueDao->getPublishedIssuesByNumber($journal->getId(), null, null, $this->get_template_vars('year'));
                                                                while($issueYear = $publishedIssuesByYear->next()){
                                                                //echo'a';    
                                                                    echo '<li><a href="'.Request::url(null, "issue", "view", $issueYear->getBestIssueId($currentJournal), null, null, false).'">'.$issueYear->getIssueIdentification().'</a></li>'; 
                                                                }
                                                             ?>
							</ul>
						</li>
                                             <?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
					</ul>
				</li>
                <li id="guide"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'pages','op' => 'view','path' => 'guide'), $this);?>
">Submission Guide</a></li>
                <li id="template"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'pages','op' => 'view','path' => 'templates'), $this);?>
">Templates</a></li>
                <li id="contact"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'pages','op' => 'view','path' => 'contact'), $this);?>
">Contact</a></li>
		<?php if ($this->_tpl_vars['isUserLoggedIn']): ?>
			<li id="userHome"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => 'wimba','page' => 'user'), $this);?>
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