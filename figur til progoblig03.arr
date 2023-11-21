use context essentials2021
include image

overlay-xy(circle(10, "solid", "blue"), -20, -15,
  overlay-xy(circle(10, "solid", "blue"), -60, -15,
    overlay-xy(triangle(20, "solid", "red"), -40, -25,
      overlay-xy(rectangle(30,10, "solid", "green"), -35, -75, rectangle(100, 100, "solid", "black")))))
