function neo -d "Open neovide in a FOUR project"
  set -l cur $argv[1]
  set -l files $PROJECTS_DIR/$cur*
  if count $files >/dev/null
    pushd $files[1];
    command neovide .;
    popd

  end
end
