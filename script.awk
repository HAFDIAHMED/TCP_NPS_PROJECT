BEGIN {
    newreno_sent_pkt = 0
    vegas_sent_pkt = 0
    newreno_rcv_pkt = 0
    vegas_rcv_pkt = 0
    startTimeNewreno = 0
    isStartNewreno = 0
    startTimeVegas = 0
    isStartVegas = 0
    newreno_arrival_rate = 0
    vegas_arrival_rate = 0
    packet_sent[13]=0
    packet_recv[13]=0
    packet_forw[13]=0

}
{
    event = $1
    time = $2
    node_id = $3
    level = $4
    pkt_type = $7
  
    if(node_id == "_0_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[0]=packet_sent[0]+1 }
      if(event == "r" && level = "AGT") { packet_recv[0]=packet_recv[0]+1 }
      if(event == "f") { packet_forw[0]=packet_forw[0]+1 }
    }
    if(node_id == "_1_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[1]=packet_sent[1]+1 }
      if(event == "r" && level = "AGT") { packet_recv[1]=packet_recv[1]+1 }
      if(event == "f") { packet_forw[1]=packet_forw[1]+1 }
    }
    if(node_id == "_2_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[2]=packet_sent[2]+1 }
      if(event == "r" && level = "AGT") { packet_recv[2]=packet_recv[2]+1 }
      if(event == "f") { packet_forw[2]=packet_forw[2]+1 }
    }
    if(node_id == "_3_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[3]=packet_sent[3]+1 }
      if(event == "r" && level = "AGT") { packet_recv[3]=packet_recv[3]+1 }
      if(event == "f") { packet_forw[3]=packet_forw[3]+1 }
    }
    if(node_id == "_4_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[4]=packet_sent[4]+1 }
      if(event == "r" && level = "AGT") { packet_recv[4]=packet_recv[4]+1 }
      if(event == "f") { packet_forw[4]=packet_forw[4]+1 }
    }
    if(node_id == "_5_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[5]=packet_sent[5]+1 }
      if(event == "r" && level = "AGT") { packet_recv[5]=packet_recv[5]+1 }
      if(event == "f") { packet_forw[5]=packet_forw[5]+1 }
    }
    if(node_id == "_6_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[6]=packet_sent[6]+1 }
      if(event == "r" && level = "AGT") { packet_recv[6]=packet_recv[6]+1 }
      if(event == "f") { packet_forw[6]=packet_forw[6]+1 }
    }
    if(node_id == "_7_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[7]=packet_sent[7]+1 }
      if(event == "r" && level = "AGT") { packet_recv[7]=packet_recv[7]+1 }
      if(event == "f") { packet_forw[7]=packet_forw[7]+1 }
    }
    if(node_id == "_8_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[8]=packet_sent[8]+1 }
      if(event == "r" && level = "AGT") { packet_recv[8]=packet_recv[8]+1 }
      if(event == "f") { packet_forw[8]=packet_forw[8]+1 }
    }
    if(node_id == "_9_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[9]=packet_sent[9]+1 }
      if(event == "r" && level = "AGT") { packet_recv[9]=packet_recv[9]+1 }
      if(event == "f") { packet_forw[9]=packet_forw[9]+1 }
    }
    if(node_id == "_10_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[10]=packet_sent[10]+1 }
      if(event == "r" && level = "AGT") { packet_recv[10]=packet_recv[10]+1 }
      if(event == "f") { packet_forw[10]=packet_forw[10]+1 }
    }
    if(node_id == "_11_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT") { packet_sent[11]=packet_sent[11]+1 }
      if(event == "r" && level = "AGT") { packet_recv[11]=packet_recv[11]+1 }
      if(event == "f") { packet_forw[11]=packet_forw[11]+1 }
    }
    if(node_id == "_12_" && pkt_type == "tcp") {
      if(event == "s" && level = "AGT" ) { packet_sent[12]=packet_sent[12]+1 }
      if(event == "r" && level = "AGT" ) { packet_recv[12]=packet_recv[12]+1 }
      if(event == "f") { packet_forw[12]=packet_forw[12]+1 }
    }
}
END {
     newreno_sent_pkt = packet_sent[1] #- packet_forw[1] ;
     newreno_rcv_pkt  = packet_recv[6] - packet_forw[6] ;
     vegas_sent_pkt = packet_sent[0] #- packet_forw[0] ;
     vegas_rcv_pkt = packet_recv[5] - packet_forw[5] ;
     newreno_arrival_rate = (newreno_rcv_pkt / newreno_sent_pkt)*100 ;
     vegas_arrival_rate   = (vegas_rcv_pkt /  vegas_sent_pkt ) *100;

     printf("NewReno send packet = %d , recv packet = %d , arrival rate = %f \n",newreno_sent_pkt, newreno_rcv_pkt, newreno_arrival_rate);
     printf("Vegas   send packet = %d , recv packet = %d , arrival rate = %f \n",vegas_sent_pkt,   vegas_rcv_pkt,   vegas_arrival_rate);
     #for(i=0;i<13;i++) {
      #printf("node %d , packet recu = %d , packet sent = %d , packet forwarded = %d\n",i,packet_recv[i],packet_sent[i],packet_forw[i])
     #}
}
