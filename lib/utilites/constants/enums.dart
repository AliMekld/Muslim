enum HttpStatusCode {
  // Informational
  continue_(100),

  // Success
  ok(200),
  created(201),
  noContent(204),

  // Redirection
  movedPermanently(301),
  found(302),
  notModified(304),

  // Client Error
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),

  // Server Error
  internalServerError(500),
  badGateway(502),

  serviceUnavailable(503);

  final int code;
  const HttpStatusCode(this.code);
}