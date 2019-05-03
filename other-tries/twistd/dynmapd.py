from twisted.web import server, resource
from twisted.internet import reactor, protocol
from twisted.protocols import basic


# REST API

class HelloResource(resource.Resource):
    isLeaf = True
    numberRequests = 0
    
    def render_GET(self, request):
        self.numberRequests += 1
        request.setHeader("content-type", "text/plain")
        return "I am request #" + str(self.numberRequests) + "\n"

#reactor.listenTCP(8123, server.Site(HelloResource()))


# Publish[Process]/Subscribe service

class PubProtocol(basic.LineReceiver):
    def __init__(self, factory):
        self.factory = factory

    def connectionMade(self):
        self.factory.clients.add(self)

    def connectionLost(self, reason):
        self.factory.clients.remove(self)

    def lineReceived(self, line):
        for c in self.factory.clients:
            c.sendLine("<{}> {}".format(self.transport.getHost(), line))

class PubFactory(protocol.Factory):
    def __init__(self):
        self.clients = set()

    def buildProtocol(self, addr):
        return PubProtocol(self)

reactor.listenTCP(1235, PubFactory())


# Start the daemon
reactor.run()
