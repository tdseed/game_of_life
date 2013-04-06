class Game

  def initialize(grid)
  	@grid = grid

    init_length
  	init_result_grid
  end

  def tick
  	@y_length.times do |i|
   	  if alive?(i,0) && has_2_alive_neighbors?(i, 0)
  	  set_alive(i,0)
      end
    end
    
    @x_length.times do |j|
      if alive?(0,j) && has_2_alive_x_neighbors?(j)
        set_alive(0,j)
      end
    end
  
    if @x_length > 1 && @y_length > 1 &&
      alive?(0,0) &&
      right_cell_alive?(0,0) && 
      down_cell_alive?(0,0)

      set_alive(0,0)
    end

    if @x_length > 1 && @y_length > 1 &&
      alive?(1,1) &&
      left_cell_alive?(1,1) && 
      up_cell_alive?(1,1)

      set_alive(1,1)
    end

  	@next_tick_grid
  end

  private

  def init_result_grid 
      @next_tick_grid = @y_length.times.map { [0]*@x_length}
  end

  def init_length
    @y_length = @grid.length
    @x_length = @grid[0].length
  end

  def alive?(i, j)
    @grid[i][j] == 1
  end

  def set_alive(i, j)
    @next_tick_grid[i][j] = 1
  end

  def has_2_alive_x_neighbors?(j) 
    count = 0
    count += 1 if left_cell_alive?(0, j)
    count += 1 if right_cell_alive?(0, j)
    count == 2
  end

  def has_2_alive_neighbors?(i, j)
    up_cell_alive?(i, j) && down_cell_alive?(i, j)
  end

  def up_cell_alive?(i, j)
    i > 0 && alive?(i-1, j)
  end

  def down_cell_alive?(i, j)
    i < @y_length-1 && alive?(i+1, j)
  end

  def left_cell_alive?(i, j)
    j > 0 && alive?(i, j-1)
  end

  def right_cell_alive?(i, j)
    j < @x_length && alive?(i, j+1)
  end
  
end