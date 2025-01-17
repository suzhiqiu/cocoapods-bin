module Pod
  class Command
    class Bin < Command
      class Lista < Bin 
        self.summary = '展示所有已经下载的源码以及大小'
        
        def initialize(argv)
          @update = argv.flag?('update')
          @code  = argv.flag?('code')
          @diff  = argv.flag?('diff')
          super
        end

        def run
          update_if_necessary!

          source = @code ? code_source : binary_source

          sets = if @diff 
                  binary_pod_set_names = binary_source.pod_sets.map(&:name)
                  sets = code_source.pod_sets.reject { |set| binary_pod_set_names.include?(set.name) }
                else
                  source.pod_sets
                end

          sets.each { |set| UI.pod(set, :name_and_version) }
          UI.puts "\n#{sets.count} pods were found"
        end

        def update_if_necessary!
          UI.section("\nUpdating Spec Repositories\n".yellow) do
            Pod::Command::Bin::Repo::Update.new(CLAide::ARGV.new([])).run 
          end if @update 
        end
      end
    end
  end
end
