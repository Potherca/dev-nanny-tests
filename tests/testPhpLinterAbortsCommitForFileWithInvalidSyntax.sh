git init
composer install --prefer-source --no-interaction
echo '<?php foo' > foo.php
git add foo.php

sOutput=$(git commit -m 'Adds broken PHP file' 2>&1) || echo "${sOutput}" | grep --quiet -E 'Parse error: *(syntax|parse) error(, unexpected end of file)? in foo.php on line 2'
