# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Elixir < Package
      name 'elixir'
      version '1.3.2'
      description 'Elixir: A functional, meta-programming aware language built on top of the Erlang VM'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'https://github.com/elixir-lang/elixir/archive/v1.3.2.tar.gz'
      source_sha1 '52ad748b6debed964496bb099b74adeeb3d1240c'
      source_filetype 'tar.gz'

      depends_on 'erlang'

      def compile
        Dir.chdir(name_with_version) do
          execute 'make'
        end
      end

      def install
        Dir.chdir(name_with_version) do
          prefix_path.mkpath
          bin_path.mkpath
          lib_path.mkpath

          (Dir['bin/*'] - Dir['bin/*.bat']).each do |f|
            execute 'mv', f, bin_path
          end

          Dir['lib/*'].each do |f|
            execute 'mv', f, lib_path
          end
        end
      end
    end
  end
end
