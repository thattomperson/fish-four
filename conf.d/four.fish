function _four_install --on-event four_install
  set --universal --export set PROJECTS_DIR /opt/vhosts;
  # Set universal variables, create bindings, and other initialization logic.
end

function _four_update --on-event four_update
  # Migrate resources, print warnings, and other update logic.
end

function _four_uninstall --on-event four_uninstall
  # Erase "private" functions, variables, bindings, and other uninstall logic.
end
