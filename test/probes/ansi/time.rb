chunks = 0

$stdout.puts "Time left:"
loop do
  $stdout.write "|#{'#' * chunks}#{' ' * (10 - chunks)}|\r"

  if chunks == 10
    $stdout.puts
    break
  end

  next_chunk = rand(1..(10 - chunks))
  sleep next_chunk
  chunks += next_chunk
end