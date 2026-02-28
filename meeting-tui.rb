class MeetingTui < Formula
  desc "Terminal-based meeting companion with live transcription and AI chat"
  homepage "https://github.com/dimanngo/meeting-companion"
  # URL should point to the source tarball of the specific release you are packaging, e.g:
  # url "https://github.com/dimanngo/meeting-companion/archive/refs/tags/v0.1.0.tar.gz"
  # sha256 "...the sha256 checksum of the tarball..."
  license "MIT"

  depends_on "python@3.11"
  depends_on "portaudio"

  def install
    # meeting-tui lives in a subdirectory of the repo
    cd "meeting-tui" do
      # Install using pip and virtualenv so dependencies do not conflict with system Python
      virtualenv_install_with_resources
    end
  end

  test do
    # Verify the application runs and can display its help menu.
    system "#{bin}/meeting-tui", "--help"
  end
end
