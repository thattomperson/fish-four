function tickle -d "Force all deployments to sync"
  command $PROJECTS_DIR/global/symfony four:tickle;
end
