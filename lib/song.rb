require 'pry'
class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # initializes a song and saves it to the `@@all` class variable 
    # either literally or through the class method `Song.all`
    song = self.new 
    self.all << song
    # return the song instance that was initialized and saved
    song 
    # Consider:
    # ```ruby
    # song = Song.create
    # Song.all.include?(song) #=> true
    # ```
  end

  # person = self.new # This is an important line.
  # person.name = name
  # person.age = age
  # person.company = company
  # person

  def self.new_by_name(name)
    # takes in the string name of a song  
    # returns a song instance with that name set as its name property
    # should return an instance of `Song` and not a simple string or anything else
    # binding.pry 
    song = self.new
    song.name = name
    song
    # ```ruby
    # song = Song.new_by_name("The Middle")
    # #=> #<Song @name="The Middle">
    # song.name #=> "The Middle"
    # ```
  end 

  def self.create_by_name(name)
    # takes in the string name of a song
    # returns a song instance with that name set as its name property and
    # the song being saved into the `@@all` class variable.
    song = self.new
    song.name = name
    self.all << song
    song 

    # Consider:
    # ```ruby
    # song = Song.create_by_name("The Middle")
    # #=> #<Song:0x007fd2a2989ff0 @name="The Middle">
    # song
    # #=> #<Song:0x007fd2a2989ff0 @name="The Middle">
    # Song.all.include?(song)
    # #=> true
    # ```
  end 

  def self.find_by_name(name)
    # accepts the string name of a song
    # returns the matching instance of the song with that name
    self.all.find{|song| song.name == name}
    # binding.pry 
    #Consider:
    # ```ruby
    # the_middle = Song.create_by_name("The Middle")
    # #=> #<Song @name="The Middle">
    # Song.find_by_name("The Middle")
    # #<Song @name="The Middle">
    # ```
  end

  def self.find_or_create_by_name(name)
    # Build to prevent duplicate songs being created that actually 
    # represent the same song (based on the song name)
    # accepts a string name for a song and either return a matching song instance 
    # with that name or create a new song with the name and return the song instance

    if self.find_by_name(name) || self.create_by_name(name)
      # binding.pry 
      self.find_by_name(name)
    else
      song = self.new
      song.name = name 
      song
    end

    # Consider:
    # ```ruby
    # song_1 = Song.find_or_create_by_name("Blank Space")
    # song_2 = Song.find_or_create_by_name("Blank Space")

    # # song_1 and song_2 are conceptually the same song and 
    # should return the same song instance because of `.find_or_create_by_name.`
    # song_1 == song_2 #=> true
    # ```
  end 

  def self.alphabetical
    # returns all the songs in ascending (a-z) alphabetical order.
    # Use [Array#sort_by](http://ruby-doc.org/core/Enumerable.html#method-i-sort_by)
    # binding.pry 
    self.all.sort_by { |song| song.name[0] }
  end 

  def self.new_from_filename(filename)
    # accepts a filename in the format of "<Artist Name> - <Song Name>.mp3", 
    # for example, "Taylor Swift - Blank Space.mp3"
      # pattern = /[.?!]+/
      # string.split(pattern).count
      pattern = /[-.]/
      files = filename.split(pattern)
          artist_name = files[0].strip
          song_name = files[1].strip
          # ext = files[2].strip
          # binding.pry
          song = self.new
          song.name = song_name
          song.artist_name = artist_name
          song

          # create_by_name(song_name) = 
          # file = self.new
          # file.artist_name = artist_name
          # file.name = name
          # file

    # return a new `Song` instance with the song name set to Blank Space and 
    # the artist_name set to Taylor Swift. The filename input sent to `Song.new_from_filename` 
    # in the format of `Taylor Swift - Blank Space.mp3` must be parsed for the relevant components
    # Separate the artist name from the rest of the data based on the `-` delimiter. 

    # Don't forget that when you parse the song name, you have to remove the `'.mp3'` part of the string.

    # ```ruby
    # song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
    # song.name #=> "Blank Space"
    # song.artist_name #=> "Taylor Swift"
    # ```

    # def self.new_from_csv(csv_data)
    #   # Split the CSV data into an array of individual rows.
    #   rows = csv_data.split("\n")
    #   # For each row, let's collect a Person instance based on the data
    #   people = rows.collect do |row|
    #     # Split the row into 3 parts, name, age, company, at the ", "
    #     data = row.split(", ")
    #     name = data[0]
    #     age = data[1]
    #     company = data[2]
   
    #     # Make a new instance
    #     person = self.new # self refers to the Person class. This is Person.new
    #     # Set the properties on the person.
    #     person.name = name
    #     person.age = age
    #     person.company = company
    #     # Return the person to collect
    #     person
    #   end
    #   # Return the array of newly created people.
    #   people
  end

  def self.create_from_filename(filename)
    # accepts a filename in the format of "<Artist Name> - <Song Name>.mp3", 
    # for example "Taylor Swift - Blank Space.mp3"
    # should not only parse the filename correctly but should also save the Song instance that was created
    pattern = /[-.]/
    files = filename.split(pattern)
        artist_name = files[0].strip
        song_name = files[1].strip
        # ext = files[2].strip
        # binding.pry
        song = self.new
        song.name = song_name
        song.artist_name = artist_name
        song.save
  end 

  def self.destroy_all
    # should reset the state of the `@@all` class variable 
    # to an empty array thereby deleting all previous song instances
    self.all.clear
  end

end 