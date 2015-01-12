module RBFS
  puts "Wow"

  class File
    def initialize(data = nil)
      self.data = data
    end 

    attr :data_type, :data

    def data=(value)
      @data = value
      case value
        when nil
          @data_type = :nil
        when String
          @data_type = :string
        when Symbol
          @data_type = :symbol
        when Numeric
          @data_type = :number
        when !!value
          @data_type = :boolean
      end
    end

    def serialize
      "#{data_type}:#{data}"
    end

    def self.parse(string_data)
      # to do...
    end
  end

  class Directory
    attr :files, :directories

    def initialize
      @files = {}
      @directories = {}
    end

    def add_file(name, file)
      files[name] = file
    end

    def add_directory(name, directory)
      directories[name] = directory
    end

    def [](name)
      if directories.has_key? name
        directories[name]
      else
        files[name]
      end
    end

    def serialize
      "#{files.count}:#{serialize_collection files}" +
      "#{directories.count}:#{serialize_collection directories}"
    end

    private
    def serialize_collection(hash)
      hash.reduce("") do |str, (item_name, item)|
         str += serialize_item(item_name, item)
      end
    end

    private
    def serialize_item(name, item)
      content = item.serialize
      "#{name}:#{content.size}:#{content}"
    end

    def self.parse(string_data)
      string_data, files = parse_files(string_data)
      directories = parse_directories(string_data)
    end

    def self.parse_files(string_data)
      
    end

    def self.parse_directories(string_data)

    end

    def self.parse_collection(string_data)
      count, string_data = parse_elem     

      count.to_i.times do
    end

    def self.parse_elem(string_data)
      string_data.split(':', 2)
    end
  end
end