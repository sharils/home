globalThis.google = () => {
  const q = new URLSearchParams(location.search).get("q") ?? document.querySelector("[name=q]").value,
    s = new URL("https://www.google.com.tw/search?client=firefox-b-d&gbv=1&q=%s&hl=en");
  s.searchParams.set("q", q), (globalThis.location = s);
};
