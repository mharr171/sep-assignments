require_relative 'node'

class Graph
  attr_accessor :visited

  def initialize
    @visited = Array.new
  end

  def find_kevin_bacon(node)
    @visited << node
    path = []

    node.film_actor_hash.each do |movie, cast|
      includes_kevin = false

      cast.each do |mem|
        includes_kevin = true if mem.name == "Kevin Bacon"
      end
      if includes_kevin
        path << movie
        if path.length <= 6
          return path
        else
          return nil
        end
      end
    end

    node.film_actor_hash.each do |movie, cast|
      if !path.include?(movie)
        cast.each do |actor|
          if !@visited.include?(actor)
            path << movie
            x = find_kevin_bacon(actor)
            if x
              path += x
              if path.length <= 6
                return path
              else
                return nil
              end
            end
          end
        end
      end
      path.pop
    end
    nil
  end
end
