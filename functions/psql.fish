function psql -d "Open a psql shell for the current project"
  set project $(basename $(pwd))
  pushd $PROJECTS_DIR/tools-deployment;
  if test -e $PROJECTS_DIR/$project
    vagrant ssh --command "psql -U postgres $project $argv"
  else
    vagrant ssh --command "psql -U postgres $argv"
  end
  popd;
end
