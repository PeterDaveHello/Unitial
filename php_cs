<?php

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__);

return PhpCsFixer\Config::create()
    ->setRules(array(
        'concat_space' => array('spacing' => 'one'),
    ))
    ->setFinder($finder);
