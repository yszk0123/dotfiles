# ------------------------------------------------------------------------------
# Alias
# ------------------------------------------------------------------------------

if status --is-interactive
  set -g fish_user_abbreviations

  # Dangerous
  abbr --add rm    'rm -i'
  abbr --add cp    'cp -i'
  abbr --add mv    'mv -i'

  # Find
  abbr --add findi 'find . \( -path ./.git -o -path \*/node_modules -o -path ./.tmp -o -path ./tmp \) -prune -o -type d -print'
  abbr --add treei 'tree -I ".git|node_modules|bower_components|.tmp|tmp|vendor"'

  # Format
  abbr --add agf   'ag --group --color'
  abbr --add grepf 'grep --color=always'
  abbr --add lessf 'less --tabs=1,5 -R'
  abbr --add difff 'diff-so-fancy | less --tabs=1,5 -R'

  # Manipulation
  abbr --add pu    'pushd'
  abbr --add po    'popd'

  # Git
  abbr --add ga    'git add'
  abbr --add gau   'git add -u'
  abbr --add ge    'git exec '

  abbr --add gb    'git branch'

  abbr --add gc    'git commit'
  abbr --add gca   'git commit --amend'
  abbr --add gcar  'git commit --amend --reuse-message=HEAD'

  abbr --add gco   'git checkout'

  abbr --add gd    'git diff --color'
  abbr --add gds   'git diff --stat --color'
  abbr --add gdst  'git diff --staged --color'
  abbr --add gdf   'git diff --color | diff-so-fancy | less --tabs=1,5 -R'
  abbr --add gdstf 'git diff --staged --color | diff-so-fancy | less --tabs=1,5 -R'

  abbr --add gf    'git fetch origin'

  abbr --add gl    'git log --pretty=format:"%C(yellow)%h %Cblue%ad %Creset%s" --date=short --all'
  abbr --add glg   'git log --graph --oneline --decorate --all --color'
  abbr --add gll   'git log --color'
  abbr --add gls   'git ls-files'
  abbr --add glsi  'git ls-files --others --i --exclude --standard'

  abbr --add gs    'git status'
  abbr --add gss   'git status -s'

  abbr --add gst   'git stash'
  abbr --add gsta  'git stash apply'
  abbr --add gstl  'git stash list'
  abbr --add gstp  'git stash pop'
  abbr --add gsts  'git stash show'

  abbr --add gm    'git merge'
  abbr --add gpic  'git cherry-pick'
  abbr --add gpul  'git pull origin '
  abbr --add gpus  'git push -u origin '
  abbr --add greb  'git rebase'
  abbr --add grebi 'git rebase -i'
  abbr --add gres  'git reset'
  # abbr --add gpusforce 'git push --force-with-lease -u origin '

  # Editor
  abbr --add v     'env LANG=ja_JP.UTF-8 vim'
  abbr --add vi    'env LANG=ja_JP.UTF-8 vim'

  # docker
  abbr --add dc    'docker-compose'
  abbr --add de    'docker exec -it -e COLUMNS=200 -e LINES=50'
  abbr --add dr    'docker run -it --rm'

  # fzf
  abbr --add fzf 'fzf --height 40% --reverse'
end
