// source https://hinderlingvolkart.github.io/h123/
globalThis.h123 = function () {
  function updateHeight() {
    (container.style.height = "0px"),
      (container.style.height = doc.scrollingElement.scrollHeight + "px");
  }

  function getOutline() {
    for (
      var e = 0,
        t = document.querySelectorAll('h1,h2,h3,h4,h5,h6,h7,[role="heading"]'),
        i = [],
        o = 0;
      o < t.length;
      o++
    ) {
      var n = t[o],
        l = isVisible(t[o]),
        r = parseInt(
          ("heading" == n.getAttribute("role") &&
            n.getAttribute("aria-level")) ||
            n.nodeName.substr(1)
        );
      if (l) {
        var d = r > e && r !== e + 1;
        e = r;
      } else d = !1;
      i.push({
        visible: l,
        visuallyhidden: l && isVisuallyHidden(n),
        wrong: d,
        level: r,
        el: n
      });
    }
    return i;
  }

  function countOutline(e, t) {
    for (var i = 0, o = 0; o < e.length; o++) e[o][t] && i++;
    return i;
  }

  function outlineToHTML(e) {
    for (var t = "", i = 0; i < e.length; i++) {
      var o = e[i],
        n = o.el;
      (t += '<li class="'),
        (t += o.wrong ? "wrong-level" : "correct-level"),
        (t += o.visible ? "" : " hidden"),
        (t += o.visuallyhidden ? " visuallyhidden" : ""),
        (t += '" style="margin-left: ' + o.level + 'em;">'),
        (t += '<a href="#' + i + '" target="_top">'),
        (t += '<span class="level" data-level="' + o.level + '"></span> '),
        (t +=
          '<span class="text">' +
          htmlEntities(n.textContent.replace(/\s+/g, " ")) +
          "</span>"),
        (t += "</a>"),
        (t += "</li>");
    }
    return '<ul id="headings">' + t + "</ul>";
  }

  function htmlEntities(e) {
    return String(e)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }

  function isVisible(e) {
    for (var t = window.getComputedStyle(e), i = !1; e; ) {
      if ("none" === t.display) return !1;
      if (!i) {
        if ("hidden" === t.visibility) return !1;
        "visible" === t.visibility && (i = !0);
      }
      if ("true" === e.getAttribute("aria-hidden")) return !1;
      e = e.parentElement;
      try {
        t = window.getComputedStyle(e);
      } catch (e) {
        return !0;
      }
    }
    return !0;
  }

  function isVisuallyHidden(e) {
    var t = e.getBoundingClientRect(e);
    if ("absolute" === window.getComputedStyle(e).position) {
      if (t.width <= 1 && t.height <= 1) return !0;
      if (t.right <= 0) return !0;
    }
  }

  function highlightElement(e, t) {
    t ||
      (e.scrollIntoViewIfNeeded
        ? e.scrollIntoViewIfNeeded()
        : e.scrollIntoView && e.scrollIntoView()),
      setTimeout(function () {
        for (
          var t = e.getBoundingClientRect(), i = e.parentElement;
          !t.height && !t.width && !t.left && !t.top && i;

        )
          (t = i.getBoundingClientRect()), !1, (i = i.parentElement);
        i &&
          (((t = {
            left: t.left,
            top: t.top,
            bottom: t.bottom,
            right: t.right
          }).left = Math.min(window.innerWidth, t.left)),
          (t.right = Math.max(0, t.right)),
          (t.top = Math.min(window.innerHeight, t.top)),
          (t.bottom = Math.max(0, t.bottom)),
          document.getElementById(highlighterEl.id) ||
            document.body.appendChild(highlighterEl),
          (highlighterEl.style.left = t.left - 10 + "px"),
          (highlighterEl.style.width = t.right - t.left + 20 + "px"),
          (highlighterEl.style.top = t.top - 10 + "px"),
          (highlighterEl.style.height = t.bottom - t.top + 20 + "px"),
          (highlighterEl.style.display = "block"));
      }, 100);
  }

  function handleHoverHighlight(e) {
    var t = function () {
      e.checked ? enableHoverHighlight() : disableHoverHighlight();
    };
    t(), e.addEventListener("click", t);
  }

  function highlightLink(e) {
    for (
      var t = doc.querySelectorAll("#headings a"), i = t.length - 1;
      i >= 0;
      i--
    )
      t[i] === e
        ? t[i].classList.add("is-active")
        : t[i].classList.remove("is-active");
  }

  function handleElementHover(e) {
    for (
      var t = e.target,
        i = document.body.querySelectorAll("*"),
        o = !1,
        n = i.length - 1;
      n >= 0;
      n--
    ) {
      var l = i[n];
      if (o) {
        for (var r = outline.length - 1; r >= 0; r--)
          if (outline[r].el === l && outline[r].visible)
            return (
              highlightElement(outline[r].el, !0),
              void highlightLink(
                doc.querySelector('#headings a[href="#' + r + '"]')
              )
            );
      } else l === t && ((o = !0), n++);
    }
    highlightLink(null);
  }

  function enableHoverHighlight() {
    document.body.addEventListener("mouseover", handleElementHover);
  }

  function disableHoverHighlight() {
    document.body.removeEventListener("mouseover", handleElementHover);
  }
  var containerId = "a11y-bookmarklet",
    containerStyle =
      "position: fixed; top: 0; right: 0; max-height: 100%; box-shadow: 0 0 80px rgba(0,0,0,0.3); width: 20%; min-width: 320px; max-width: 450px; z-index: 1000001;",
    highlighterEl = document.createElement("DIV");
  (highlighterEl.id = "h1-a11y-highlighterelement"),
    (highlighterEl.style.cssText =
      "pointer-events: none; position: fixed; border: 1px dashed #0081BE; box-shadow: 0 0 54px 0 rgba(0,84,150,0.3); display: none; z-index: 1000000; transition: all 200ms;");
  var container = document.getElementById(containerId);
  container && document.body.removeChild(container),
    ((container = document.createElement("DIV")).id = containerId),
    (container.style.cssText = containerStyle);
  var iframe = document.createElement("IFRAME");
  (iframe.style.width = "100%"),
    (iframe.style.height = "100%"),
    (iframe.style.borderWidth = "0");
  var doc,
    outline = getOutline();
  container.appendChild(iframe),
    (iframe.onload = function () {
      function e(e, t) {
        var i = doc.getElementById(e),
          o = doc.querySelector(".result");
        if (i) {
          var n = function (e) {
            i.checked ? o.classList.add(t) : o.classList.remove(t),
              e && updateHeight();
          };
          i.addEventListener("change", n, !1),
            i.addEventListener("click", n, !1),
            n();
        }
      }
      (iframe.onload = function () {}),
        (doc = iframe.contentWindow.document).open(),
        doc.write(
          '<html> <head> <meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1,user-scalable=yes"> <style> * { margin: 0; padding: 0; border: 0; } body { font: 14px/1.6 sans; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; color: #284900; background: rgba(255,255,255,0.95); white-space: nowrap; overflow-x: hidden; text-overflow: ellipsis; padding: 15px; padding-bottom: 30px; } ul { margin: 0 0 0 -10px; padding: 0; } li { color: #284900; list-style: none; margin-left: 20px; display: -webkit-box; display: -ms-flexbox; display: flex; } a { color: inherit; text-decoration: none; display: inline-block; max-width: 30em; overflow: hidden; text-overflow: ellipsis; padding: 2px 4px 2px 25px; position: relative; line-height: 1.3; border-radius: 3px; } a > .level { display: inline-block; background-color: currentColor; font-size: 85%; font-weight: bold; width: 2.7ex; height: 2.7ex; text-align: center; -webkit-box-sizing: border-box; box-sizing: border-box; position: absolute; left: 2px; top: 2px; padding-top: 1px; } a > .level:before { content: attr(data-level); color: white; } li.hidden { color: black; text-decoration: line-through; opacity: 0.5; } .result:not(.show-hidden) li.hidden { display: none; } .result.mark-visuallyhidden li.visuallyhidden .level:before { color: inherit; } .result.mark-visuallyhidden li.visuallyhidden .level { border: 1px dashed; background: white; } li.wrong-level { color: #AF3A37; } a.is-active { -webkit-box-shadow: 0 0 5px 1px #3CBEFF; box-shadow: 0 0 5px 1px #3CBEFF; } a:hover { background-color: currentColor; } a:hover > .text { color: white; } a:hover > .level { background-color: transparent; } header { padding-top: 5px; padding-bottom: 15px; padding-right: 5em; margin-bottom: 1em; border-bottom: 1px solid #eee; } legend { margin-right: 1em; font-weight: bold; } @media (min-width: 340px) { legend { float: left; } } .options { display: -webkit-box; display: -ms-flexbox; display: flex; -ms-flex-wrap: wrap; flex-wrap: wrap; } .options .input { margin-right: 2em; } .count { background: #ddd; border-radius: 4px; padding: 1px 3px; } .tooltip { position: relative; } .tooltip:before { content: \'ℹ️\'; } .tooltip:focus:after, .tooltip:hover:after { content: attr(title); position: absolute; background: white; padding: 4px 10px; top: 70%; left: 70%; width: 10em; -webkit-box-shadow: 0 2px 20px rgba(0,0,0,0.3); box-shadow: 0 2px 20px rgba(0,0,0,0.3); white-space: normal; border-radius: 8px; border-top-left-radius: 0; z-index: 1; pointer-events: none; } .button-close { position: absolute; top: 15px; right: 15px; padding: 5px 10px; border-radius: 5px; border: 0; font-size: inherit; color: white; background-color: #284900; cursor: pointer; } .button-close:hover { color: white; background-color: #284900; } </style> </head> <body> <header> <button class="button-close" data-action="close">Close</button> <fieldset> <legend>Options</legend> <div class="options"> <div class="input"> <input type="checkbox" name="options" id="o-hidden"> <label for="o-hidden">Show hidden <span class="count" id="o-hidden-count"></span> <span class="tooltip" title="also hidden for screenreaders" tabindex="0"></span></label> </div> <div class="input"> <input type="checkbox" name="options" id="o-visuallyhidden"> <label for="o-visuallyhidden">Mark visually hidden <span class="count" id="o-visuallyhidden-count"></span> <span class="tooltip" title="only visible for screenreaders" tabindex="0"></span></label> </div> <div class="input"> <input type="checkbox" name="options" id="o-highlight"> <label for="o-highlight">Hover-Highlight <span class="tooltip" title="Highlight the corresponding heading when hovering over elements of the page" tabindex="0"></span></label> </div> </div> </fieldset> </header> <main id="result" class="result"> </main> </body> </html> '
        ),
        doc.close();
      var t = doc.querySelector('[data-action="close"]');
      t &&
        t.addEventListener("click", function (e) {
          disableHoverHighlight(),
            window.removeEventListener("resize", updateHeight),
            document.body.removeChild(container),
            document.getElementById(highlighterEl.id) &&
              document.body.removeChild(highlighterEl);
        });
      var i = doc.querySelector("#result");
      i && (i.innerHTML = outlineToHTML(outline)),
        (i = doc.querySelector("#o-hidden-count")) &&
          (i.innerText = outline.length - countOutline(outline, "visible")),
        (i = doc.querySelector("#o-visuallyhidden-count")) &&
          (i.innerText = countOutline(outline, "visuallyhidden")),
        e("o-hidden", "show-hidden"),
        e("o-visuallyhidden", "mark-visuallyhidden"),
        handleHoverHighlight(doc.getElementById("o-highlight")),
        updateHeight(),
        doc.addEventListener(
          "mouseover",
          function (e) {
            var t;
            if (
              ("A" === e.target.nodeName.toUpperCase()
                ? (t = e.target)
                : e.target.parentElement &&
                  "A" === e.target.parentElement.nodeName.toUpperCase() &&
                  (t = e.target.parentElement),
              t)
            ) {
              var i = parseInt(t.getAttribute("href").substr(1), 10);
              highlightElement(outline[i].el);
            }
          },
          !1
        ),
        window.addEventListener("resize", updateHeight);
    }),
    document.body.appendChild(container);
};
