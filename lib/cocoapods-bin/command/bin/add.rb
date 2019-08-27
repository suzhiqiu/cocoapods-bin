require 'cocoapods'

module Pod
  class Command
    class Bin < Command
      class Add < Bin
        self.summary = '再不删除二进制的情况下为组件添加源码调试能力,多个组件名称用空格分隔'



        def initialize(argv)
          @update = argv.flag?('update')
          @code  = argv.flag?('code')
          @diff  = argv.flag?('diff')
          super
        end

        def run

          command = 'dwarfdump /Users/suzhiqiu/Library/Developer/Xcode/DerivedData/LibSource-gvmdthzquecjhpdskogxxrkgtmhc/Build/Products/Debug-iphonesimulator/libLibSource.a | grep \'DW_AT_comp_dir\''
          UI.puts "#{command}".red
          output = `#{command}`.lines.to_a
          UI.puts "#{output}".red
         # if output.empty
          #  UI.puts "没找到二进制编译路径信息".red
         # end
         # https://github.com/suzhiqiu/UCARRobot.git
         # command = 'git clone  https://github.com/suzhiqiu/UCARRobot  ~/Downloads/'
         # output = `#{command}`.lines.to_a
        end

      end
    end
  end
end
