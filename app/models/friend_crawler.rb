Node = Struct.new(:user, :children, :parent, :depth)

class FriendCrawler
  attr_reader :root

  def initialize(user, degrees=3)
    @degrees = degrees
    @root = Node.new(user, [], nil, 1)
  end

  def parse
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

end
