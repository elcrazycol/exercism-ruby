class LogLineParser
  def initialize(line)
    @line = line
  end

  def split(param)
    splited_line = @line.split(":")
    #["[<LEVEL>]", "<MESSAGE>"]
    if param == 'message'
      return splited_line[1].strip
    elsif param == 'log'
      return splited_line[0].strip
    end
  end
      
  def message
    split('message')
  end

  def log_level
    split('log').downcase.gsub('[', '').gsub(']', '')
  end

  def reformat
    message = split('message')
    log = split('log').gsub!('[', '').gsub!(']', '').downcase
    
    return "#{message} (#{log})"
    # => "Operation completed (info)"
  end
end
