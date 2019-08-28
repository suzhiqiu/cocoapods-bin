
module Pod
  class Command
    class Bin < Command
      class Add < Bin
        self.summary = '再不删除二进制的情况下为组件添加源码调试能力,多个组件名称用逗号分隔'

     #   def initialize(argv)
      #    @nameArgv = argv.shifint_argument
     #     UI.puts "add输入参数:#{@nameArgv}".red
      #    super
      #  end

        def run        
          addSource
        end

        def addSource()
          nameArray = @nameArgv.split
          if nameArray.length == 0
           UI.puts "请输入要下载组件源码名称".red
           return 
          end
          nameArray.each_index {|index|
           item = nameArray[index]
           UI.puts "#{item}".red
           downSource(item)
         }
         UI.puts "下载完成...".red

        end

        def downSource(name)
          command = 'dwarfdump /Users/suzhiqiu/Library/Developer/Xcode/DerivedData/LibSource-gvmdthzquecjhpdskogxxrkgtmhc/Build/Products/Debug-iphonesimulator/libLibSource.a | grep \'DW_AT_comp_dir\''
  
          UI.puts "#{command}".red    
         # if output.empty
          #  UI.puts "没找到二进制编译路径信息".red
         # end
          serverPath = 'https://github.com/suzhiqiu/UCARRobot'
          localPath = '~/Downloads/q'

          UI.puts "开始下载#{name}".red
          command = `git clone  #{serverPath}  #{localPath}`
          output = `#{command}`.lines.to_a
          UI.puts "#{output}".red
        end

      end
    end
  end
end
