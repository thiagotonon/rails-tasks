update tasks
  set position = case
    when title = 'task6' then 3
    when position >= 3 and position <= 6 and title <> 'task6' then position + 1
    else position
  end;
