function add_to_path
  set -l p $(pwd)/$argv[1]
  set -gx PATH $p $PATH 
  echo "Added $p to PATH"
end 


