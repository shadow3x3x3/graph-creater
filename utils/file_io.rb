# For File output
module FileIO
  PATH = './output/'.freeze

  def write_to_txt(file_name: Time.now.strftime('%Y-%m-%d_%H-%M-%S'), data: nil)
    unless data.class == Array || !data.nil?
      raise ArgumentError, ' worng type of data (need Array)'
    end
    File.open("#{PATH}#{file_name}.txt", 'w') do |f|
      data.each_with_index do |d, i|
        f.puts "#{i} #{d.join(' ')}"
      end
    end
  end
end
