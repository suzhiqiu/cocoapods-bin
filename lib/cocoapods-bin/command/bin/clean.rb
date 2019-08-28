module Pod
  class Command
    class Bin < Command
      class Clean < Bin
        self.summary = '删除所有已经下载的源码'
        self.arguments = []

        def run
         path = '/Users/suzhiqiu/Downloads/q'
         delete(path)
        end
        
        def delete(path)
            UI.puts "#{path}".red
            UI.puts "开始删除中,请稍候...".red
            # @path = ''
            command = `rm -rf  #{path}`
            UI.puts "结束删除...".red
        end
   
      end
    end
  end
end
