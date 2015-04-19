git init
echo '<?php foo' > foo.php
git add foo.php

sOutput=$(git commit -m 'Adds broken PHP file' 2>&1) || echo "${sOutput}" | grep --quiet 'Parse error: parse error in foo.php on line 2'
