 class Student
  attr_accessor :name, :grade,
  attr_reader :id
  @@all = []
  
  def initialize(name, grade, id)
    @name = name
    @grade = grade
    @id = id=nil
  end
  
    def self.create_table
      sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name VARCHAR(255),
      body TEXT
      )
      SQL
      DB[:conn].execute(sql)
     end  
      
    def self.drop_table
    end
  
    def save
      @@all << self 
      self.id = @@all.size
    end
    
    def self.create(name, grade)
      Student.new(name, grade)
      
    end  
end
