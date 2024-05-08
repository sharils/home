globalThis.brave = () => {
  const q = new URLSearchParams(location.search).get("q"),
    s = new URL("https://search.brave.com/search");
  s.searchParams.set("q", q), (globalThis.location = s);
};
