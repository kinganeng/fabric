from openblockchain/baseimage:latest

# Copy GOPATH src and install Peer
RUN mkdir -p /var/openchain/db
RUN mkdir -p /var/openchain/production
WORKDIR $GOPATH/src/github.com/hyperledger/fabric/
COPY . .
RUN CGO_CFLAGS=" " CGO_LDFLAGS="-lrocksdb -lstdc++ -lm -lz -lbz2 -lsnappy" go install && cp $GOPATH/src/github.com/hyperledger/fabric/core.yaml $GOPATH/bin
RUN cp $GOPATH/src/github.com/hyperledger/fabric/consensus/obcpbft/config.yaml $GOPATH/bin
# RUN CGO_CFLAGS=" " CGO_LDFLAGS="-lrocksdb -lstdc++ -lm -lz -lbz2 -lsnappy" go install
# RUN cd membersrvc && go install
