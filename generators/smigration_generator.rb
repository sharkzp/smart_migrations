class SmigrationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :migration_name, :type => :string  
  argument :settings, :type => :hash
  def copy_files
    @migration_name = migration_name
    copy_file "migration.rb", "db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_#{@migration_name.tableize}.rb"
  end
end
