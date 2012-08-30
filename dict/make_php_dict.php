<?php
  /**
   * Usage:
   *   $ php make_php_dict.php > php.dict
   */
  $functions = get_defined_functions();
  sort($functions['internal']);
  echo implode("\n", $functions['internal']);
