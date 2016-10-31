require 'open3'

module PsppRb
  class Pspp
    attr_reader :log, :pspp_cli_path

    def initialize(pspp_cli_path: 'pspp')
      self.pspp_cli_path = Shellwords.shellescape(pspp_cli_path)
      raise PsppError, "cannot execute '#{command}' program" unless system(self.pspp_cli_path, '--version')
    end

    def execute(commands)
      self.log = nil
      Open3.popen3(pspp_cli_path + ' --batch') do |i, o, _, _|
        i.write(commands)
        i.close
        self.log = o.read
      end
      success?
    end

    def errors
      return [] unless log
      log.scan(/(error.*)/).flatten
    end

    def success?
      errors.empty?
    end

    private

    attr_writer :log, :pspp_cli_path
  end
end
