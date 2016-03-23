# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class PostGIS < Package
      name 'postgis'
      version '2.1.8'
      description "PostGIS: Spatial and Geographic objects for PostgreSQL"
      category Category::LIBRARIES

      source_url 'http://download.osgeo.org/postgis/source/postgis-2.1.8.tar.gz'
      source_sha1 'cfb3b7a01449fbbdb3a052002cebd23537ea6c93'
      source_filetype 'tar.gz'

      depends_on 'postgresql'
      depends_on 'geos'
      depends_on 'proj'
      depends_on 'gdal'
      depends_on 'jsonc'

      def compile
        Dir.chdir(name_with_version) do
          args = [
            '--disable-nls',
            '--disable-debug',

            "--prefix=#{prefix_path}",
            "--bindir=#{bin_path}",
            "--sysconfdir=#{Path.etc}",
            "--libdir=#{lib_path}",
            "--includedir=#{include_path}",
            "--datarootdir=#{share_path}/#{name}",
            "--datadir=#{share_path}/#{name}",
            "--mandir=#{man_path}",
            "--docdir=#{doc_path}",
 
            "--with-pgconfig=#{postgres_dependency.bin_path}/pg_config",
            "--with-geosconfig=#{get_dependency('geos').bin_path}/geos-config",
            "--with-projdir=#{get_dependency('proj').prefix_path}",
            "--with-gdalconfig=#{get_dependency('gdal').bin_path}/gdal-config",
            "--with-jsondir=#{get_dependency('jsonc').prefix_path}",
          ]

          execute './configure', *args
          execute 'make'
        end
      end

      def postgres_dependency
        @postgres ||= get_dependency('postgresql')
      end

      def install
        Dir.chdir(name_with_version) do
          execute 'make install'
          #execute 'mkdir stage'
          #execute "make", "install", "DESTDIR=#{buildpath}/stage"

          #bin.install Dir["stage/**/bin/*"]
          #lib.install Dir["stage/**/lib/*"]
          #include.install Dir["stage/**/include/*"]
          #(doc/"postgresql/extension").install Dir["stage/**/share/doc/postgresql/extension/*"]
          #(share/"postgresql/extension").install Dir["stage/**/share/postgresql/extension/*"]
          #pkgshare.install Dir["stage/**/contrib/postgis-*/*"]
          #(share/"postgis_topology").install Dir["stage/**/contrib/postgis_topology-*/*"]

          ## Extension scripts
          #bin.install %w[
          #  utils/create_undef.pl
          #  utils/postgis_proc_upgrade.pl
          #  utils/postgis_restore.pl
          #  utils/profile_intersects.pl
          #  utils/test_estimation.pl
          #  utils/test_geography_estimation.pl
          #  utils/test_geography_joinestimation.pl
          #  utils/test_joinestimation.pl
          #]

          #man1.install Dir["doc/**/*.1"]
        end
      end
    end
  end
end
