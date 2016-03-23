# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Proj < Package
      name 'proj'
      version '4.9.2'
      description 'PROJ.4: Cartographic Projections Library'
      category Category::LIBRARIES

      source_url 'https://github.com/OSGeo/proj.4/archive/4.9.2.tar.gz'
      source_sha1 '687123e5991d6f8b34d0f0bceed0b05a83882f27'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir("proj.4-#{version}") do
          execute './configure', "--prefix=#{prefix_path}"
          execute 'make'
        end
      end

      def install
        Dir.chdir("proj.4-#{version}") do
          execute 'make install'
        end
      end
    end
  end
end
