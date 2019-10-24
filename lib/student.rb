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
    DB[:conn].execute("DROP TABLE IF EXISTS students")
  end
  
   def save
    if self.id
      self.update
    else
      sql = <<-SQL 
        INSERT INTO students (name, grade)
        VALUES (?,?)
      SQL
     
       DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end
  end
    
    def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
  end
end  