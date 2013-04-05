class Rule

  DEFAULT = Rule.new
  
  def initialize(&block)
    @block = block if block_given?
  end

	def apply(turn)
    return @block.call(turn) if @block
    true
	end
end