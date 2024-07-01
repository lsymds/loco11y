const _textualMimeTypes = [
  "text/plain",
  "text/html",
  "text/css",
  "text/javascript",
  "text/csv",
  "text/markdown",
  "text/xml",
  "text/richtext",
  "text/tab-separated-values",
  "text/calendar",
  "text/vcard",
  "application/json",
  "application/xml",
  "application/xhtml+xml",
  "application/javascript",
  "application/ecmascript",
  "application/ld+json",
  "application/atom+xml",
  "application/rss+xml",
  "application/x-www-form-urlencoded",
  "application/x-javascript",
  "multipart/form-data",
];

bool isTextualMimeType(String mimeType) {
  return _textualMimeTypes.contains(mimeType.toLowerCase());
}

String contentTypeWithoutCharset(String contentType) {
  return contentType.contains(";") ? contentType.split(";")[0] : contentType;
}
