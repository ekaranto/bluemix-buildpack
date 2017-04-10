class LanguagePack::MqlibsInstaller


  MQLIBS_BASE_URL = 'https://wireframe.ferocia.com.au/'

  def initialize(stack)
    @fetcher = LanguagePack::Fetcher.new(MQLIBS_BASE_URL)
    @vendor_dir = 'vendor/mqm'
  end

  def version
      '8.0.0.6'
  end

  def install
     FileUtils.mkdir_p(@vendor_dir)
     Dir.chdir(@vendor_dir) do
       @fetcher.fetch_untar("mqlibs-8.0.0.6-WS-MQC-Redist-LinuxX64.tar.gz")
     end
     FileUtils.rm_rf('mqlibs-8.0.0.6-WS-MQC-Redist-LinuxX64')
  end

end
