function flushdb -d "Flush the redis database"
  pushd $PROJECTS_DIR/tools-deployment;
  command vagrant ssh --command "docker exec redis redis-cli flushdb"
  popd;
end
