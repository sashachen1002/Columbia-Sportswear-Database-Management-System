import React from 'react';
import {
    Header,
    Button,
    Icon,
    Tab,
    Image,
    Search,
    Form,
    Select,
    Dimmer,
    Segment,
    TextArea,
    Loader,
    Radio,
    Grid,
    Modal,
    Menu,
    Dropdown,
} from "semantic-ui-react";
import {
    BrowserRouter as Router,
    Link
} from "react-router-dom";
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Container from 'react-bootstrap/Container';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser } from '@fortawesome/free-solid-svg-icons';
import { ReactComponent as MaintIcon } from './images/maintenance.svg';
import { ReactComponent as WarrantIcon } from './images/warranty.svg';
import { ReactComponent as ShipperIcon } from './images/shipment.svg';
import ColumbiaLogo from './images/Columbia_Sportswear-Logo.wine.png';

class Home extends React.Component {
    constructor() {
        super()
        this.state = {
            logo: null

        }

    }
    componentDidMount(){
        this.setState({
            logo: ColumbiaLogo
        })
        if ((sessionStorage.getItem('userEmail') !== "") && (sessionStorage.getItem('userEmail') !== null) && (sessionStorage.getItem('userEmail') !== undefined)) {
            this.setState({
                userEmail: sessionStorage.getItem('userEmail'),
                userFirstName: sessionStorage.getItem('userFirstName'),
                userLastName: sessionStorage.getItem('userLastName'),
                role: sessionStorage.getItem('role'),
                aoID: sessionStorage.getItem('mroID')
            });
        }
        console.log(this.state.userEmail)
    }



    render() {
        const persona= 'AircraftOperator';
        return (
            <div className="screens-background">
                <div className="homeheaderbar">
                    <Row className="width100">
                        <Col xs={12} md={3} className="logoBar">
                            <img src={this.state.logo} className="" width="" fluid="true" />
                        </Col>
                        <Col md={4} className="navRow">
                        </Col>
                        <Col xs={12} md={5} className="navRow userDetails regulator">
                            <div className="userDetailsRow">
                                <div className="personIcon">
                                    <FontAwesomeIcon icon={faUser} />
                                </div>
                                <Dropdown text={this.state.userFirstName}>
                                    <Dropdown.Menu>
                                        <Dropdown.Item onClick={this.logout} text='SignOut' />
                                    </Dropdown.Menu>
                                </Dropdown>
                            </div>
                        </Col>
                    </Row>
                </div>
            {/* <Container className="homeContainer">
                <Row>
                    <Col className="aepadmin persona" xs={12} lg={3}><Link to={{pathname: "/Login", query: 'AircraftOperator'}}><Row><FontAwesomeIcon icon={faUser} className="homeIcon" /></Row><Row>Aircraft Operator</Row></Link></Col>
                    <Col className="mro persona"  xs={12} lg={3}><Link to={{pathname: "/Login", query: 'MRO'}}> <Row><MaintIcon size='large' className="homeIcon" /></Row><Row> MRO </Row></Link></Col>
                    <Col className="supplier persona"  xs={12} lg={3}><Link to={{pathname: "/Login", query: 'Supplier'}}> <Row><WarrantIcon size='large' className="homeIcon"/></Row><Row>Supplier</Row></Link></Col>
                    <Col className="shipper persona"  xs={12} lg={3}><Link to={{pathname: "/Login", query: 'Shipper'}}> <Row> <ShipperIcon size='large' className="homeIcon" /></Row><Row>Shipper</Row></Link></Col>
                </Row>
            </Container> */}
            </div>

        )
    }
}

export default Home



