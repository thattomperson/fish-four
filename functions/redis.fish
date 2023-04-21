
function redis -d "Open a redis-cli shell"
  pushd $PROJECTS_DIR/tools-deployment;
  command vagrant ssh --command "docker exec -it redis redis-cli $argv"
  popd;
end
