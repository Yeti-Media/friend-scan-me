class Manifest

  attr_accessor :dirs, :files

  def initialize(dirs = {},files = [])
    @files = files
    @dirs = dirs
  end



  def manifest!
    manifest = "CACHE MANIFEST\n"
    add_files(manifest)
    manifest
  end


  private

  def add_files(manifest)
    file_list = files
    add_files_from_dirs(file_list)
    file_list = file_list.sort{|a,b| a <=> b }
    manifest << file_list.join("\n")
  end

  def add_files_from_dirs(file_list)
    dirs.each do |root,paths|
      paths.each do |path|
        Dir[[root, path].join('/')].each do |file|
          file_list << file.gsub(root, '')
        end
      end
    end
  end

end
