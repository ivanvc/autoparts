module Autoparts
  module Packages
    class AWSCLI < Package
      name 'awscli'
      version '1.10.38'
      description "AWS Command Line Interface"
      category Category::DEPLOYMENT

      source_url 'https://s3.amazonaws.com/aws-cli/awscli-bundle-1.10.38.zip'
      source_sha1 '513b1e941e846cca64f06aad30f942d100f7c2d0'
      source_filetype 'zip'

      def install
        Dir.chdir('awscli-bundle') do
          execute './install', '-i', prefix_path
        end
      end
    end
  end
end
