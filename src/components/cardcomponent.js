import React from 'react';
import { Card, Image, Grid, CardDescription } from 'semantic-ui-react';
import { ReactComponent as MaintIcon } from './images/maintenance.svg';
import { ReactComponent as WarrantIcon } from './images/warranty.svg';
import { ReactComponent as ServiceIcon } from './images/service.svg';
import { ReactComponent as ShipmentIcon } from './images/shipment.svg';

const cardcomponent = (props) => (
    <article className="cardContentLayout" onClick={props.clicked} >
        <Card>
            <Card.Content>
                {props.elementType !== "empty" ?
                    <Grid>
                        <Grid.Column width={6}>
                            {(() => {
                                if (props.elementType === "plane.png" || props.elementType === "part.png") {
                                    return (
                                        <Image
                                            floated='left'
                                            size='small'
                                            src={require(`./images/${props.elementType}`)}
                                        />
                                    )
                                } else if (props.elementType === "maintenance") {
                                    return (
                                        <MaintIcon size='small' floated='left' className={props.iconClass} />
                                    )
                                } else if (props.elementType === "warranty") {
                                    return (
                                        <WarrantIcon size='small' floated='left' className={props.iconClass} />
                                    )
                                } else if (props.elementType === "service") {
                                    return (
                                        <ServiceIcon size='small' floated='left' className={props.iconClass} />
                                    )
                                }
                                else if (props.elementType === "order") {
                                    return (
                                        <ServiceIcon size='small' floated='left' className={props.iconClass} />
                                    )
                                }
                                else if (props.elementType === "shipment") {
                                    return (
                                        <ShipmentIcon size='small' floated='left' className={props.iconClass} />
                                    )
                                }
                            })()}
                        </Grid.Column>
                        <Grid.Column width={10}>
                            {(() => {
                                if (props.elementType === "plane.png") {
                                    return (
                                        <Card.Description>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Aircraft ID
                                    </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.aircraftID}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Aircraft Name
                                    </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.aircraftID}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Aircraft Model
                                    </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.aircraftMName}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Owner
                                    </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.aircraftManfName}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </Card.Description>
                                    )
                                } else if (props.elementType === "part.png") {
                                    return (
                                        <Card.Description>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Part UID
                                        </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.partUID}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Part Name
                                        </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.partName}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Part Description
                                        </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.partDescription}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </Card.Description>
                                    )
                                }else if (props.elementType === "maintenance") {
                                    return (
                                        <Card.Description>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                   Request No.
                                        </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.mRequestNumber}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Part UID
                                        </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.mPartID}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Status
                                        </Grid.Column>
                                                <Grid.Column width={6}  className={props.iconClass}>
                                                    :{props.cardData.Record.mRequestStatus}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </Card.Description>
                                    )
                                }else if (props.elementType === "warranty") {
                                    return (
                                        <Card.Description>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                   Ticket No.
                                        </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.ticketNumber}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Part UID
                                        </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.partUID}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Warranty No.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.warrantyNumber}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Status
                                        </Grid.Column>
                                                <Grid.Column width={6}  className={props.iconClass}>
                                                    :{props.cardData.Record.ticketStatus}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </Card.Description>
                                    )
                                } else if (props.elementType === "service") {
                                    return (
                                        <Card.Description>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                   Service No.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.serviceNumber}
                                                </Grid.Column>
                                            </Grid.Row>                                            
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Part UID
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.partUID}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Service date
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.serviceDate}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Status
                                        </Grid.Column>
                                                <Grid.Column width={6}  className={props.iconClass}>
                                                    :{props.cardData.Record.serviceStatus}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </Card.Description>
                                    )
                                }
                                else if (props.elementType === "order") {
                                    return (
                                        <Card.Description>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                   Order No.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.orderNumber}
                                                </Grid.Column>
                                            </Grid.Row>                                            
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Part UID
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.partUID}
                                                </Grid.Column>
                                            </Grid.Row>
                                            {/* <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Requester
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.serviceDate}
                                                </Grid.Column>
                                            </Grid.Row> */}
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Status
                                        </Grid.Column>
                                                <Grid.Column width={6} className={props.iconClass}>
                                                    :{props.cardData.Record.orderStatus}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </Card.Description>
                                    )
                                }
                                else if (props.elementType === "shipment") {
                                    return (
                                        <Card.Description>
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                   Shipment No.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.shipmentNumber}
                                                </Grid.Column>
                                            </Grid.Row>                                            
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Sender
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.shipmentSender}
                                                </Grid.Column>
                                            </Grid.Row>
                                            {/* <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Requester
                                                </Grid.Column>
                                                <Grid.Column width={6} className="descColumn">
                                                    :{props.cardData.Record.serviceDate}
                                                </Grid.Column>
                                            </Grid.Row> */}
                                            <Grid.Row className="cardDesc">
                                                <Grid.Column width={6} className="descKeyColumn">
                                                    Status
                                        </Grid.Column>
                                                <Grid.Column width={6}  className={props.iconClass}>
                                                    :{props.cardData.Record.shipmentStatus}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </Card.Description>
                                    )
                                }
                            })()}
                        </Grid.Column>
                    </Grid>
                    :
                    <Grid>
                        <Grid.Row className= "emptyCardDesc">
                            No Data
                        </Grid.Row>
                    </Grid>
                }

            </Card.Content>
        </Card>
    </article>
);

export default cardcomponent