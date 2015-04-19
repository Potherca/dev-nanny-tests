git init
source 'tests/helperRemoveRequiredSectionFromComposerJson.sh'
composer require 'dev-nanny/dev-nanny' --prefer-source --no-interaction | grep --quiet 'Installed dev-nanny pre-commit hook'
