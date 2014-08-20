#!/usr/bin/env bash

if [[ -z "$(git status --untracked-files=no --porcelain)" ]] ; then
    APP="evening-wildwood-3251"
    DATABASE_URL=$(heroku config:get --app ${APP} DATABASE_URL)
    sqitch revert -y -t ${DATABASE_URL}
    sqitch deploy -t ${DATABASE_URL}
    git push heroku
else
    echo 'You still have things to commit.'
fi
