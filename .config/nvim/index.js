const ticker = function (
  continued = true,
  reversed = false,
  delay = 150,
  offset = 5
) {
  let c = continued ? document.documentElement.scrollTop : 0;
  offset = reversed ? -offset : offset;
  const interval = setInterval(() => {
    window.scrollTo({ left: 0, top: c, behavior: "smooth" });
    c += offset;
  }, delay);
  return {
    interval,
    stop: () => clearInterval(interval),
  };
};
