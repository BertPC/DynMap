class ClientRequester(resource.Resource):
  isLeaf = True

  def __init__(self, i):
      resource.Resource.__init__(self)
      self.internal = i

  def render_GET(self, request):
      channel = getChannelID('/subscriptions/channel/', request.uri)
      if (channel == False):
          return '{ "status" : "error" }'
  
      self.internal.addClientDelegate(channel, ClientDelegate(request))

      return server.NOT_DONE_YET
