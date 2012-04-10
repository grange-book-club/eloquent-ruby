class Chapter18

  def code_timer
    start_time = Time.now
    yield
    Time.now - start_time
  end
end

