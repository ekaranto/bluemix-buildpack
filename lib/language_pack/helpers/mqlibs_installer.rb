class LanguagePack::MqlibsInstaller


  MQLIBS_BASE_URL = 'https://wireframe.ferocia.com.au/'

  def initialize(stack)
    @fetcher = LanguagePack::Fetcher.new(MQLIBS_BASE_URL)
  end

  def version
      '8.0.0.6'
  end

  def install
      @fetcher.fetch_untar("mqlibs-8.0.0.6-WS-MQC-Redist-LinuxX64.tar.gz")
      FileUtils.rm_rf('mqlibs-8.0.0.6-WS-MQC-Redist-LinuxX64')
  end

  def self.default_node_version
    bin_path = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "..", "compile-extensions", "bin"))
    manifest_path = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "..", "manifest.yml"))
    `#{bin_path}/default_version_for #{manifest_path} mqlibs`.chomp
  end
end
