defmodule LogLevel do

  def to_label(log_code, legacy_flag?) do
    cond do
      log_code === 0 and not legacy_flag? -> :trace
      log_code === 1 -> :debug
      log_code === 2 -> :info
      log_code === 3 -> :warning
      log_code === 4 -> :error
      log_code === 5 and not legacy_flag? -> :fatal
      true -> :unknown
    end
  end

def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    IO.puts("This is the Label: #{label}")

    cond do
      label == :error or label == :fatal -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown and not legacy? -> :dev2
      true -> false
    end

  end

end
