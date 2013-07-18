# Based from:
# https://github.com/meineerde/dotfiles/blob/master/Rakefile    

require 'fileutils'

desc "installs everything"
task :install => "install:all"
namespace :install do

    def files(name, *files)
        desc "installs #{name} configuration"
        task(name) do
            Dir[*files].collect do |file|
                full = File.join File.dirname(__FILE__), file
                Dir.chdir ENV["HOME"] do
                    mkdir_p File.dirname(file)
                    File.delete(file) if (File.exist? file and File.directory? full)
                    sh "ln -sf #{full} #{file}"
                end
            end
        end
        task :all => name
    end

    files :dot, *%w(.bash_aliases .bash_home_aliases .bash_logout .bash_profile .bashrc .dircolors .gitconfig .vimrc .xinitrc)
    files :bin, "bin/*"

end
