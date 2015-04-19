git init
composer install --prefer-source --no-interaction
echo '<?php echo "foo";' > foo.php
git add foo.php
git commit -m 'Adds fixed PHP file'
