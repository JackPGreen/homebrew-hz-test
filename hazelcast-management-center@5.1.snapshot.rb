class HazelcastManagementCenterAT51Snapshot < Formula
    desc "Tool to run Hazelcast Management Center"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    version "5.1.snapshot"
    url "https://repository.hazelcast.com/download/management-center/hazelcast-management-center-latest-snapshot.tar.gz"
    sha256 "10255ebc46c22a7211a902301fae8ee8ed7e153c8e9c59902cc0481286de7aec"

    depends_on "openjdk" => :recommended

    def install
      libexec.install Dir["*"]
      Dir["#{libexec}/bin/*mc*"].each do |path|
        executable_name = File.basename(path)
        if executable_name.end_with? ".bat"
          next
        end
        (bin/executable_name).write_env_script libexec/"bin/#{executable_name}", Language::Java.overridable_java_home_env
      end
      prefix.install_metafiles
    end
  
    def post_install
      exec "echo Hazelcast Management Center has been installed."
    end

  end
