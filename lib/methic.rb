# Autogenerated from a Treetop grammar. Edits may be lost.


require 'treetop'
require 'methic_node_classes'

module Methic
  include Treetop::Runtime

  def root
    @root ||= :expression
  end

  def _nt_expression
    start_index = index
    if node_cache[:expression].has_key?(index)
      cached = node_cache[:expression][index]
      if cached
        node_cache[:expression][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_comparative
    if r1
      r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
      r0 = r1
    else
      r2 = _nt_additive
      if r2
        r2 = SyntaxNode.new(input, (index-1)...index) if r2 == true
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:expression][start_index] = r0

    r0
  end

  module Comparative0
    def space1
      elements[0]
    end

    def operator
      elements[1]
    end

    def space2
      elements[2]
    end

    def operand
      elements[3]
    end
  end

  module Comparative1
    def head
      elements[0]
    end

    def tail
      elements[1]
    end
  end

  def _nt_comparative
    start_index = index
    if node_cache[:comparative].has_key?(index)
      cached = node_cache[:comparative][index]
      if cached
        node_cache[:comparative][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_additive
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        r4 = _nt_space
        s3 << r4
        if r4
          r5 = _nt_equality_op
          s3 << r5
          if r5
            r6 = _nt_space
            s3 << r6
            if r6
              r7 = _nt_additive
              s3 << r7
            end
          end
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Comparative0)
        else
          @index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(BinaryOperation,input, i0...index, s0)
      r0.extend(Comparative1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:comparative][start_index] = r0

    r0
  end

  module EqualityOp0
    def apply(a, b)
      a == b
    end
  end

  def _nt_equality_op
    start_index = index
    if node_cache[:equality_op].has_key?(index)
      cached = node_cache[:equality_op][index]
      if cached
        node_cache[:equality_op][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if (match_len = has_terminal?('==', false, index))
      r0 = instantiate_node(SyntaxNode,input, index...(index + match_len))
      r0.extend(EqualityOp0)
      @index += match_len
    else
      terminal_parse_failure('==')
      r0 = nil
    end

    node_cache[:equality_op][start_index] = r0

    r0
  end

  module Additive0
    def space1
      elements[0]
    end

    def operator
      elements[1]
    end

    def space2
      elements[2]
    end

    def operand
      elements[3]
    end
  end

  module Additive1
    def head
      elements[0]
    end

    def tail
      elements[1]
    end
  end

  def _nt_additive
    start_index = index
    if node_cache[:additive].has_key?(index)
      cached = node_cache[:additive][index]
      if cached
        node_cache[:additive][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_multitive
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        r4 = _nt_space
        s3 << r4
        if r4
          r5 = _nt_additive_op
          s3 << r5
          if r5
            r6 = _nt_space
            s3 << r6
            if r6
              r7 = _nt_multitive
              s3 << r7
            end
          end
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Additive0)
        else
          @index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(BinaryOperation,input, i0...index, s0)
      r0.extend(Additive1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:additive][start_index] = r0

    r0
  end

  module AdditiveOp0
    def apply(a, b)
      a + b
    end
  end

  module AdditiveOp1
    def apply(a, b)
      a - b
    end
  end

  def _nt_additive_op
    start_index = index
    if node_cache[:additive_op].has_key?(index)
      cached = node_cache[:additive_op][index]
      if cached
        node_cache[:additive_op][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if (match_len = has_terminal?('+', false, index))
      r1 = instantiate_node(SyntaxNode,input, index...(index + match_len))
      r1.extend(AdditiveOp0)
      @index += match_len
    else
      terminal_parse_failure('+')
      r1 = nil
    end
    if r1
      r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
      r0 = r1
    else
      if (match_len = has_terminal?('-', false, index))
        r2 = instantiate_node(SyntaxNode,input, index...(index + match_len))
        r2.extend(AdditiveOp1)
        @index += match_len
      else
        terminal_parse_failure('-')
        r2 = nil
      end
      if r2
        r2 = SyntaxNode.new(input, (index-1)...index) if r2 == true
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:additive_op][start_index] = r0

    r0
  end

  module Multitive0
    def space1
      elements[0]
    end

    def operator
      elements[1]
    end

    def space2
      elements[2]
    end

    def operand
      elements[3]
    end
  end

  module Multitive1
    def head
      elements[0]
    end

    def tail
      elements[1]
    end
  end

  def _nt_multitive
    start_index = index
    if node_cache[:multitive].has_key?(index)
      cached = node_cache[:multitive][index]
      if cached
        node_cache[:multitive][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_primary
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        r4 = _nt_space
        s3 << r4
        if r4
          r5 = _nt_multitive_op
          s3 << r5
          if r5
            r6 = _nt_space
            s3 << r6
            if r6
              r7 = _nt_primary
              s3 << r7
            end
          end
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Multitive0)
        else
          @index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(BinaryOperation,input, i0...index, s0)
      r0.extend(Multitive1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:multitive][start_index] = r0

    r0
  end

  module MultitiveOp0
    def apply(a, b)
      a * b
    end
  end

  module MultitiveOp1
    def apply(a, b)
      a / b
    end
  end

  def _nt_multitive_op
    start_index = index
    if node_cache[:multitive_op].has_key?(index)
      cached = node_cache[:multitive_op][index]
      if cached
        node_cache[:multitive_op][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if (match_len = has_terminal?('*', false, index))
      r1 = instantiate_node(SyntaxNode,input, index...(index + match_len))
      r1.extend(MultitiveOp0)
      @index += match_len
    else
      terminal_parse_failure('*')
      r1 = nil
    end
    if r1
      r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
      r0 = r1
    else
      if (match_len = has_terminal?('/', false, index))
        r2 = instantiate_node(SyntaxNode,input, index...(index + match_len))
        r2.extend(MultitiveOp1)
        @index += match_len
      else
        terminal_parse_failure('/')
        r2 = nil
      end
      if r2
        r2 = SyntaxNode.new(input, (index-1)...index) if r2 == true
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:multitive_op][start_index] = r0

    r0
  end

  module Primary0
    def space1
      elements[1]
    end

    def expression
      elements[2]
    end

    def space2
      elements[3]
    end

  end

  module Primary1
    def eval(env={})
      expression.eval(env)
    end
  end

  def _nt_primary
    start_index = index
    if node_cache[:primary].has_key?(index)
      cached = node_cache[:primary][index]
      if cached
        node_cache[:primary][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_variable
    if r1
      r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
      r0 = r1
    else
      r2 = _nt_number
      if r2
        r2 = SyntaxNode.new(input, (index-1)...index) if r2 == true
        r0 = r2
      else
        i3, s3 = index, []
        if (match_len = has_terminal?('(', false, index))
          r4 = true
          @index += match_len
        else
          terminal_parse_failure('(')
          r4 = nil
        end
        s3 << r4
        if r4
          r5 = _nt_space
          s3 << r5
          if r5
            r6 = _nt_expression
            s3 << r6
            if r6
              r7 = _nt_space
              s3 << r7
              if r7
                if (match_len = has_terminal?(')', false, index))
                  r8 = true
                  @index += match_len
                else
                  terminal_parse_failure(')')
                  r8 = nil
                end
                s3 << r8
              end
            end
          end
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Primary0)
          r3.extend(Primary1)
        else
          @index = i3
          r3 = nil
        end
        if r3
          r3 = SyntaxNode.new(input, (index-1)...index) if r3 == true
          r0 = r3
        else
          @index = i0
          r0 = nil
        end
      end
    end

    node_cache[:primary][start_index] = r0

    r0
  end

  module Variable0
    def eval(env={})
      env[name]
    end
    
    def name
      text_value
    end
  end

  def _nt_variable
    start_index = index
    if node_cache[:variable].has_key?(index)
      cached = node_cache[:variable][index]
      if cached
        node_cache[:variable][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?(@regexps[gr = '\A[a-z]'] ||= Regexp.new(gr), :regexp, index)
        r1 = true
        @index += 1
      else
        terminal_parse_failure('[a-z]')
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Variable0)
    end

    node_cache[:variable][start_index] = r0

    r0
  end

  module Number0
  end

  module Number1
    def eval(env={})
      text_value.to_i
    end
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      if cached
        node_cache[:number][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if has_terminal?(@regexps[gr = '\A[1-9]'] ||= Regexp.new(gr), :regexp, index)
      r2 = true
      @index += 1
    else
      terminal_parse_failure('[1-9]')
      r2 = nil
    end
    s1 << r2
    if r2
      s3, i3 = [], index
      loop do
        if has_terminal?(@regexps[gr = '\A[0-9]'] ||= Regexp.new(gr), :regexp, index)
          r4 = true
          @index += 1
        else
          terminal_parse_failure('[0-9]')
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s1 << r3
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Number0)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
      r0 = r1
      r0.extend(Number1)
    else
      if (match_len = has_terminal?('0', false, index))
        r5 = true
        @index += match_len
      else
        terminal_parse_failure('0')
        r5 = nil
      end
      if r5
        r5 = SyntaxNode.new(input, (index-1)...index) if r5 == true
        r0 = r5
        r0.extend(Number1)
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:number][start_index] = r0

    r0
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      if cached
        node_cache[:space][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if (match_len = has_terminal?(' ', false, index))
        r1 = true
        @index += match_len
      else
        terminal_parse_failure(' ')
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:space][start_index] = r0

    r0
  end

end

class MethicParser < Treetop::Runtime::CompiledParser
  include Methic
end

