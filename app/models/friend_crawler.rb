Node = Struct.new(:user, :children, :parent, :depth)

class FriendCrawler
  attr_reader :root

  def initialize(user, degrees=3)
    @degrees = degrees
    @root = Node.new(user, [], nil, 1)
  end

  def parse_followed_users
    queue = [@root]
    until queue.empty?
      current = queue.shift
      break if current.depth > @degrees
      if current.user.followed_users.any?
        current.user.followed_users.each do |child|
          c = Node.new(child, [], current, current.depth + 1)
          current.children << c
          queue << c
        end
      end
    end
  end

  def distance_to(user)
    queue = [@root]
    until queue.empty?
      current = queue.shift
      if current.user == user
        return current.depth - 1
      elsif current.children && current.children.any?
        current.children.each do |child|
          queue << child
        end
      end
    end
    return nil
  end

  def print_distances
    (1..User.count).each do |idx|
      p self.distance_to(User.find(idx))
    end
  end

end
