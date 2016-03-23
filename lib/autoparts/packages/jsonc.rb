# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class JSONC < Package
      name 'jsonc'
      version '537f8bcbdbdc10ffa7673199a0be82ca4eb56ec8'
      description 'JSON-C: A JSON implementation in C'
      category Category::LIBRARIES

      source_url 'https://github.com/json-c/json-c/archive/537f8bcbdbdc10ffa7673199a0be82ca4eb56ec8.tar.gz'
      source_sha1 '67f003e0e309d680d107a7fa8296a4d3047e2c42'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir("json-c-#{version}") do
          execute 'sh autogen.sh'
          execute './configure', "--prefix=#{prefix_path}"
          execute 'make'
        end
      end

      def install
        Dir.chdir("json-c-#{version}") do
          execute 'make install'
        end
      end
    end
  end
end
