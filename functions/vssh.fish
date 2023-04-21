function vssh -d "SSH into the vagrant box and cd into the current project"
  set -f project $(basename $(pwd))
  pushd $PROJECTS_DIR/tools-deployment;

  if count $argv > /dev/null
    set -f command $argv
  else
    set -f command bash
  end

  if test -e $PROJECTS_DIR/$project
    vagrant ssh --command "sh -c 'cd $PROJECTS_DIR/$project; $command'"
  else
    vagrant ssh --command "$command";
  end
  popd;
end