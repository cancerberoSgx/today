require 'date'
require 'ansi/code'

class Month
  attr_accessor :year, :start
  def initialize
    @start = 2361222
  end

  def pict(y, m)
    d = (1..31).detect{|x| Date.valid_date?(y, m, x, @start)}
    fi = Date.new(y, m, d, @start)
    fi -= (fi.jd - 1) % 7
    ve  = (fi..fi +  6).collect{|cu|
      %w(S M Tu W Th F S)[cu.wday]
    }
    ve += (fi..fi + 41).collect{|cu|
      if cu.mon == m then cu.send(:mday) end.to_s
    }
    ve = ve.collect{|e| e.rjust(2)}
    gr = group(ve, 7)

    # highlight today's entry
    today = "#{DateTime.now.day}".length == 1 ? " #{DateTime.now.day}" : "#{DateTime.now.day}"
    ta = gr.collect{|xs| (xs.map{|x| x == today && !@year ? "#{ANSI.inverse{x}}" : x}).join(' ')}

    ca = %w(January February March April May June July
	    August September October November December)[m - 1]
    ca = ca + ' ' + y.to_s if !@year
    ca = ca.center(20)

    ta.unshift(ca)
  end

  def group(xs, n)
    (0..xs.size / n - 1).collect{|i| xs[i * n, n]}
  end

  def trans(xs)
    (0..xs[0].size - 1).collect{|i| xs.collect{|x| x[i]}}
  end

  def stack(xs)
    if xs.empty? then [] else xs[0] + stack(xs[1..-1]) end
  end

  def block(xs, n)
    stack(group(xs, n).collect{|ys| trans(ys).collect{|zs| zs.join('  ')}})
  end

  def unlines(xs)
    xs.collect{|x| x + "\n"}.join
  end

  def monthly(y, m)
    unlines(pict(y, m))
  end

  def addmon(y, m, n)
    y, m = (y * 12 + (m - 1) + n).divmod(12)
    return y, m + 1
  end

  def yearly(y)
    y.to_s.center(64) + "\n\n" +
      unlines(block((0..11).collect{|n| pict(*addmon(y, 1, n))}, 3)) + "\n"
  end

  def print(y, m)
    if @year then yearly(y) else monthly(y, m) end
  end

  def self.render(year=false)
    to = Date.today
    cal = Month.new
    cal.year = year
    cal.print(to.year, to.mon)
  end

end
