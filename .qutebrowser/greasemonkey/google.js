globalThis.google = () => {
  const q = new URLSearchParams(location.search).get("q"),
    g = new URL("https://www.google.com.tw/search?q=%s&hl=en");
  g.searchParams.set("q", q), (globalThis.location = g);
};
