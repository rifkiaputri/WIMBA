<?php /* Smarty version 2.6.26, created on 2015-03-24 00:30:42
         compiled from sectionEditor/submission/proofread.tpl */ ?>
<?php $this->assign('proofSignoff', $this->_tpl_vars['submission']->getSignoff('SIGNOFF_PROOFREADING_PROOFREADER')); ?>
<?php $this->assign('proofreader', $this->_tpl_vars['submission']->getUserBySignoffType('SIGNOFF_PROOFREADING_PROOFREADER')); ?>
