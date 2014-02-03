class Findpost < ActiveRecord::Base
  attr_accessible :c1, :course1, :number1, :course2, :number2, :course3, :number3, :course4, :number4, :course5, :number5
  belongs_to :user
  before_save :coursecode1, :coursecode2, :coursecode3, :coursecode4, :coursecode5

  validates :user_id, presence: true
  validates :c1, presence: true
  validates :course1, presence: true
  validates :number1, presence: true

  def course1
    @course1
  end
  def number1
    @number1 
  end
  def course1=(course)
    @course1 = course
  end
  def number1=(number)
    @number1 = number
  end

  def course2
    @course2
  end
  def number2
    @number2
  end
  def course2=(course)
    @course2 = course
  end
  def number2=(number)
    @number2 = number
  end

  def course3
    @course3
  end
  def number3
    @number3
  end
  def course3=(course)
    @course3 = course
  end
  def number3=(number)
    @number3 = number
  end

  def course4
    @course4
  end
  def number4
    @number4
  end
  def course4=(course)
    @course4 = course
  end
  def number4=(number)
    @number4 = number
  end

  def course5
    @course5
  end
  def number5
    @number5
  end
  def course5=(course)
    @course5 = course
  end
  def number5=(number)
    @number5 = number
  end

  def coursecode1
    self.c2 = "#{@course1} #{@number1}"
  end

  def coursecode2
    self.c3 = "#{@course2} #{@number2}"
  end

  def coursecode3
    self.c4 = "#{@course3} #{@number3}"
  end

  def coursecode4
    self.c5 = "#{@course4} #{@number4}"
  end

  def coursecode5
    self.c6 = "#{@course5} #{@number5}"
  end

  default_scope order: 'findposts.created_at DESC'
end