module Autoparts
  module Packages
    class Terraform < Package
      name 'terraform'
      version '0.6.16'
      description 'Terraform is a tool for building, changing, and combining infrastructure safely and efficiently'
      category Category::DEPLOYMENT
      source_url 'https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip'
      source_sha1 'efa41e723e42a9bc5a9d49a54dbd7b71b24a9133'
      source_filetype 'zip'

      def install
        prefix_path.parent.mkpath
        bin_path.mkpath
        Dir[extracted_archive_path + '*'].each do |file|
          execute 'mv', file, bin_path
        end
        #binary = extracted_archive_path + "#{name_with_version}.binary"
        #execute 'chmod', '+x', binary
        #execute 'mv', binary, bin_path + 'apex'
      end
    end
  end
end
