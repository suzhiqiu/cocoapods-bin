require 'cocoapods'

module Pod
  class Source
    # Returns the path of the specification with the given name and version.
    #
    # @param  [String] name
    #         the name of the Pod.
    #
    # @param  [Version,String] version
    #         the version for the specification.
    #
    # @return [Pathname] The path of the specification.
    #
    def specification_path(name, version)
      raise ArgumentError, 'No name' unless name
      raise ArgumentError, 'No version' unless version
      path = pod_path(name) + version.to_s

      specification_path =[
        "#{name}.podspec.json", 
        "#{name}.podspec", 
        # 支持 binary 后缀
        "#{name}.binary.podspec", 
        "#{name}.binary.podspec.json"
        ].map { |file| path + file }.find { |path| path.exist? }

      unless specification_path
        raise StandardError, "Unable to find the specification #{name} " \
          "(#{version}) in the #{self.name} source."
      end
      specification_path
    end
  end
end