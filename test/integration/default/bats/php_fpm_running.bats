#!/usr/bin/env bats

@test php_fpm_running {
  run "ps aux | grep -v grep | grep php-fpm"
}
