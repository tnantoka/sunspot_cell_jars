module SunspotCellJars
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def install_sunspot_cell_jars
        if File.exists?('solr')

          Dir.mkdir("solr/lib") unless File.exists?("solr/lib")

          files = Dir.glob(File.dirname(__FILE__) + "/templates/*.jar").map { |f| File.basename(f) }

          files.each do |file|
            copy_file file, "solr/lib/#{file}"
          end
        else
          say "You need to have a solr directory created in your rails root before I can proceed"
        end
      end
    end
  end
end
