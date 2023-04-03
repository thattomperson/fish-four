function f -d "Jump to four project"
  set -l cur $argv[1]
  set -l files $PROJECTS_DIR/$cur*
  if count $files >/dev/null
    cd $files[1];
  end
end

function tickle -d "Force all deployments to sync"
  command $PROJECTS_DIR/global/symfony four:tickle;
end

function flushdb -d "Flush the redis database"
  pushd $PROJECTS_DIR/tools-deployment;
  command vagrant ssh --command "docker exec redis redis-cli flushdb"
  popd;
end

function redis -d "Open a redis-cli shell"
  pushd $PROJECTS_DIR/tools-deployment;
  command vagrant ssh --command "docker exec -it redis redis-cli $argv"
  popd;
end

function vssh -d "SSH into the vagrant box and cd into the current project"
  set project $(basename $(pwd))
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

function v -d "Run a vagrant command"
  pushd $PROJECTS_DIR/tools-deployment;
  vagrant $argv;
  popd;
end
