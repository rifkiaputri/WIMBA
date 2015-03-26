<?php /* Smarty version 2.6.26, created on 2015-03-26 16:03:34
         compiled from file:/var/www/html/wimba/plugins/generic/staticPages/content.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'file:/var/www/html/wimba/plugins/generic/staticPages/content.tpl', 16, false),array('function', 'fieldLabel', 'file:/var/www/html/wimba/plugins/generic/staticPages/content.tpl', 19, false),array('function', 'translate', 'file:/var/www/html/wimba/plugins/generic/staticPages/content.tpl', 34, false),)), $this); ?>
<?php $this->assign('pageTitleTranslated', $this->_tpl_vars['title']); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php echo $this->_tpl_vars['content']; ?>


<form id="inquiry" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about','op' => 'sendInquiry'), $this);?>
">
	<table class="data" width="100%">
		<tr>
			<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'name','key' => "common.email.name"), $this);?>
</td>
			<td width="80%" class="value"><input type="text" name="name" size="30" maxlength="32" class="textField"></td>
		</tr>
		<tr>
			<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'email','key' => "common.email.address"), $this);?>
</td>
			<td width="80%" class="value"><input type="text" name="email" size="30" maxlength="90" class="textField"></td>
		</tr>
		<tr>
			<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'message','key' => "common.email.content"), $this);?>
</td>
			<td width="80%" class="value">
				<textarea id="message" name="message" rows="5" cols="40" class="textArea"></textarea>
			</td>
		</tr>
		<tr>
			<td width="20%">&nbsp;</td>
			<td width="80%"><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.email.submit"), $this);?>
" class="button defaultButton"></td>
		</tr>
	</table>
</form>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>