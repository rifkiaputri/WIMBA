<?php /* Smarty version 2.6.26, created on 2015-03-16 03:41:21
         compiled from file:C:%5Cxampp2%5Chtdocs%5Cojs-2.4.5/plugins/generic/staticPages/content.tpl */ ?>
<?php $this->assign('pageTitleTranslated', $this->_tpl_vars['title']); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php echo $this->_tpl_vars['content']; ?>


<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>