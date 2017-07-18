# encoding: utf-8

##
# Backup Generated: rails_database
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t rails_database [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:rails_database, 'Backups of the Rails Database') do
  archive :mayak_archive do |archive|
    archive.add "/backup/"
  end

  database PostgreSQL do |db|
    db.name = ENV['DB_NAME']
    db.username = ENV['DB_USER_NAME']
    db.password = ENV['DB_PASSWORD']
    db.host = "localhost"
    db.port = 5432
    db.skip_tables  = []
    db.socket = '/var/run/postgresql'
    db.additional_options = ["-xc", "-E=utf8"]
  end

  store_with FTP do |server|
    server.username     = ENV['FTP_USER_NAME']
    server.password     = ENV['FTP_PASSWORD']
    server.ip           = ENV['FTP_IP']
    server.port         = 21
    server.path         = '/backup/'
    server.keep         = 5
    server.passive_mode = false
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = ENV['EMAIL_USER_NAME']
    mail.to                   = "worldnillin@gmail.com"
    mail.address              = "smtp.gmail.com"
    mail.port                 = 587
    mail.domain               = "gmail.com"
    mail.user_name            = ENV['EMAIL_USER_NAME']
    mail.password             = ENV['EMAIL_PASSWORD']
    mail.authentication       = "plain"
    mail.encryption           = :starttls
  end

end