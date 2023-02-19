globalThis.duckduckgo = () => {
  const q = new URLSearchParams(location.search).get("q"),
    s = new URL("https://lite.duckduckgo.com/lite/");
  s.searchParams.set("q", q), (globalThis.location = s);
};
