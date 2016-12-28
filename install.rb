puts "Ruby script to install the dot files into home directory"
#heavily based on Ben Orenstein (https://github.com/r00k) rakefile

def replace(file)
  puts "removing file ~/.#{file}"
  file_path = File.join(Dir.home, ".#{file}")
  cmd = "rm #{file_path}"
  system(cmd)
  create_symbolic_link(file)
end

def create_symbolic_link(file)
  puts "creating symbolic link ~/.#{file}"
  cmd = "ln -s ~/dotfiles/#{file} ~/.#{file}"
  system(cmd)
end

%w{pryrc tmux.conf vimrc bash_aliases zshrc rspec gitconfig}.each do |file|
  replace_all_files = false

  if File.exists?(File.join(Dir.home, ".#{file}"))
    if replace_all_files
      replace(file)
    else
      print "overwrite ~/.#{file}? [ynaq] "
      case gets.chomp
      when 'a'
        replace_all_files = true
        replace(file)
      when 'y'
        replace(file)
      when 'q'
        exit
      else
        puts "skipping ~/.#{file}"
      end
    end
  else
    create_symbolic_link(file)
  end
end
