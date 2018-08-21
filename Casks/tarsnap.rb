cask 'tarsnap' do
  version '1.0.3'
  sha256 'e951aaa9da9448eec84cfab35742e490c0c3a641fb49d3ddd2c112b579ff2c6f'

  # github.com/shawwn/tarsnap-gui was verified as official when first introduced to the cask
  url 'https://github.com/shawwn/tarsnap-gui/releases/download/v1.0.3/Tarsnap.zip'
  appcast 'https://github.com/shawwn/tarsnap-gui/releases.atom'
  name 'Tarsnap'
  homepage 'https://www.tarsnap.com/'

  auto_updates true
  conflicts_with formula: 'tarsnap-gui'
  depends_on formula: 'qt'
  depends_on formula: 'tarsnap'

  app 'Tarsnap.app'
  binary "#{appdir}/Tarsnap.app/Contents/MacOS/bin/tarsnap-gui"

  postflight do
    system_command "#{appdir}/Tarsnap.app/Contents/MacOS/bin/tarsnap-gui-postinstall"
  end

  uninstall launchctl: 'com.tarsnap.gui'
end
