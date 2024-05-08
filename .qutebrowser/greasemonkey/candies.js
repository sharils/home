globalThis.candies = () => {
  faviconUrl = `${location.origin}/favicon.ico`;
  serviceName = "$SERVICE_NAME";
  serviceUrl = `${location.origin}/`;
  description = String(getSelection());
  rulesTitle = document.title;
  rulesUrl = String(location);
  markdown = `[<img src="${faviconUrl}" alt="${serviceName}" height="16" /> ${serviceName}](${serviceUrl}) - ${description} - [${rulesTitle}](${rulesUrl})`;
  void prompt(markdown, markdown);
};
