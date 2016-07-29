module Autoparts
  module Packages
    class Apex < Package
      name 'apex'
      version '0.10.2'
      description 'Build, deploy and manage AWS Lambda functions with ease.'
      category Category::DEPLOYMENT
      source_url 'https://github.com/apex/apex/releases/download/v0.10.2/apex_linux_amd64'
      source_sha1 'a3430ff23c962c3da1f81f9f0a9b7b3fa9564f2e'
      source_filetype 'binary'

      def install
        prefix_path.parent.mkpath
        bin_path.mkpath
        binary = extracted_archive_path + "#{name_with_version}.binary"
        execute 'chmod', '+x', binary
        execute 'mv', binary, bin_path + 'apex'
      end
    end
  end
end
