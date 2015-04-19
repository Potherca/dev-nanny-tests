git init
source 'tests/helperRemoveRequiredSectionFromComposerJson.sh'
composer require 'dev-nanny/dev-nanny' | grep --quiet 'Installed dev-nanny pre-commit hook'
