# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class GDAL < Package
      name 'gdal'
      version '2.0.2'
      description 'GDAL: Geospatial Data Abstraction Library'
      category Category::LIBRARIES

      source_url 'http://download.osgeo.org/gdal/2.0.2/gdal-2.0.2.tar.gz'
      source_sha1 'c7a264ae756bba4608b6a1d159ef7731e004f56a'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          execute './configure', "--prefix=#{prefix_path}"
          execute 'make'
        end
      end

      def install
        Dir.chdir(name_with_version) do
          execute 'make install'
        end
      end
    end
  end
end

