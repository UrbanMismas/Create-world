while true do
    local event, side, x, y = os.pullEvent("monitor_touch")
    print("The monitor on side " .. side .. " was touched at (" .. x .. ", " .. y .. ")")
    print("Test")
  end