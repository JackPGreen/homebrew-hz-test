class HazelcastManagementCenter < Formula
    desc "Tool to run Hazelcast Management Center"
    homepage "https://github.com/hazelcast/hazelcast-command-line"
    version "5.0.4"
    url "https://repository.hazelcast.com/download/management-center/hazelcast-management-center-5.1.2.tar.gz"
    sha256 "ef946f2a240750cb67dad6bd9c751beef2ebdc8311f35b7ab0b6d289783c3ce5"

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
