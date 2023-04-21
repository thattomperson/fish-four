function v -d "Run a vagrant command" --wraps=vagrant
  pushd $PROJECTS_DIR/tools-deployment;
  vagrant $argv;
  popd;
end
