<?php

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__);

return PhpCsFixer\Config::create()
    ->setRules(array(
        '@Symfony' => true,
        'single_quote' => false,
        'ordered_imports' => true,
        'increment_style' => false,
        'align_multiline_comment' => true,
        'single_line_comment_style' => true,
        'method_chaining_indentation' => true,
        'concat_space' => array('spacing' => 'one'),
        'multiline_comment_opening_closing' => true,
        'trailing_comma_in_multiline_array' => false,
        'method_argument_space' => ['ensure_fully_multiline' => true],
        'no_useless_else' => true,
        'no_useless_return' => true,
        'no_short_echo_tag' => true,
        'no_superfluous_elseif' => true,
        'no_unneeded_curly_braces' => true,
        'no_unneeded_final_method' => true,
    ))
    ->setFinder($finder);
