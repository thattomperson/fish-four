function f -d "Jump to four project"
  set -l cur $argv[1]
  set -l files $PROJECTS_DIR/$cur*
  if count $files >/dev/null
    cd $files[1];
  end
end
