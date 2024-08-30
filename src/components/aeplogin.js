import React from 'react';
import {
  BrowserRouter as Router,
  Redirect,
} from "react-router-dom";
import FormControl from 'react-bootstrap/FormControl';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Container from 'react-bootstrap/Container';
import InputGroup from 'react-bootstrap/InputGroup';
import users from './data/user.json';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faLock } from '@fortawesome/free-solid-svg-icons';
import GATLogo from './images/GA_telesis_logo.svg';
import DeltaLogo from './images/Delta_logo.svg';
// import ColumbiaLogo from './images/Columbia_Sportswear-Logo.wine.svg';
import ColumbiaLogo from './images/columbia_loginlogo.png';
import LufLogo from './images/lutfthansa_technik_logo.svg';

class AEPLogin extends React.Component {
  constructor() {
    super()
    this.state = {
      validated: false,
      email: "",
      password: "",
      warning: "",
      cssclassName: null,
      logo: null,
      logincss: null,

    }
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  
componentDidMount(){
  console.log(this.props.location.query)
  // var persona = this.props.location.query;
  var persona = 'AircraftOperator';
  if (persona ==='AircraftOperator'){
    this.setState({
      cssclassName: "aoBackground",
      logincss:"loginButton aep",
      logo: ColumbiaLogo
    })
  }
  else if (persona === 'MRO') {
    this.setState({
      cssclassName: "mroBackground",
      logincss:"loginButton aep",
      logo: GATLogo
    })
  }
  else if (persona === 'Supplier') {
    this.setState({
      cssclassName: "supBackground",
      logincss:"loginButton supplier",
      logo: LufLogo
    })
  }
  // else if (persona === 'Shipper') {
  //   this.setState({
  //     cssclassName: "shipBackground",
  //     logincss:"loginButton shipper",
  //     logo: FedexLogo
  //   })
  // }
  else{
    this.setState({
      cssclassName: "loginscreen",
      logincss:"loginButton aep",
    })
  }
}
  handleSubmit = event => {
    event.preventDefault();
    const form = event.currentTarget;
    if (form.checkValidity() === false) {
      event.preventDefault();
      event.stopPropagation();
    }
    if (this.state.email === 'alice@columbia.com' && this.state.password === '123456') {
      this.setState({ validated: true });
      this.userDetails = (function (obj) {
        var newArray = users.filter(function (el) {
          return el.userEmail == obj.state.email;
        });
        return newArray
      })(this);

      sessionStorage.setItem('userEmail', this.userDetails[0].userEmail);
      sessionStorage.setItem('userFirstName', this.userDetails[0].userFirstName);
      sessionStorage.setItem('userLastName', this.userDetails[0].userLastName);
      sessionStorage.setItem('role', this.userDetails[0].role);
      sessionStorage.setItem('mroID', "AO101");
      this.setState({
        role: 'AircraftOperator'
      })
    }
    else if (this.state.email === 'bob@gatelesis.com' && this.state.password === '123456') {
      this.setState({ validated: true });
      this.userDetails = (function (obj) {
        var newArray = users.filter(function (el) {
          return el.userEmail == obj.state.email;
        });
        return newArray
      })(this);

      sessionStorage.setItem('userEmail', this.userDetails[0].userEmail);
      sessionStorage.setItem('userFirstName', this.userDetails[0].userFirstName);
      sessionStorage.setItem('userLastName', this.userDetails[0].userLastName);
      sessionStorage.setItem('role', this.userDetails[0].role);
      sessionStorage.setItem('mroID', this.userDetails[0].id);
      this.setState({
        role: 'mro'
      })
    }
    else if (this.state.email === 'jim@aar.com' && this.state.password === '123456') {
      this.setState({ validated: true });
      this.userDetails = (function (obj) {
        var newArray = users.filter(function (el) {
          return el.userEmail == obj.state.email;
        });
        return newArray
      })(this);

      sessionStorage.setItem('userEmail', this.userDetails[0].userEmail);
      sessionStorage.setItem('userFirstName', this.userDetails[0].userFirstName);
      sessionStorage.setItem('userLastName', this.userDetails[0].userLastName);
      sessionStorage.setItem('role', this.userDetails[0].role);
      this.setState({
        role: 'supplier'
      })
    }
    else if (this.state.email === 'michael@Lufthansa.com' && this.state.password === '123456') {
      this.setState({ validated: true });
      this.userDetails = (function (obj) {
        var newArray = users.filter(function (el) {
          return el.userEmail == obj.state.email;
        });
        return newArray
      })(this);

      sessionStorage.setItem('userEmail', this.userDetails[0].userEmail);
      sessionStorage.setItem('userFirstName', this.userDetails[0].userFirstName);
      sessionStorage.setItem('userLastName', this.userDetails[0].userLastName);
      sessionStorage.setItem('role', this.userDetails[0].role);
      sessionStorage.setItem('mroID', this.userDetails[0].id);
      this.setState({
        role: 'supplier'
      })
    }
    else if (this.state.email === 'dwight@fedex.com' && this.state.password === '123456') {
      this.setState({ validated: true });
      this.userDetails = (function (obj) {
        var newArray = users.filter(function (el) {
          return el.userEmail == obj.state.email;
        });
        return newArray
      })(this);

      sessionStorage.setItem('userEmail', this.userDetails[0].userEmail);
      sessionStorage.setItem('userFirstName', this.userDetails[0].userFirstName);
      sessionStorage.setItem('userLastName', this.userDetails[0].userLastName);
      sessionStorage.setItem('role', this.userDetails[0].role);
      // sessionStorage.setItem('mroID', this.userDetails[0].id);
      this.setState({
        role: 'shipper'
      })
    }
    else {
      alert('Incorrect Login Details');
    }

  };


  handleInputChange = (event) => {

    const target = event.target
    const value = target.value
    const name = target.name
    this.setState({
      [name]: value
    })
  }

  render() {
    if (this.state.role == 'AircraftOperator') {
      return <Redirect push to="/ColumbiaHome" />;
    }
    // else if (this.state.role == 'mro') {
    //   return <Redirect push to="/Home" />;
    // }
    // else if (this.state.role == 'supplier') {
    //   return <Redirect push to="/Home" />;
    // }
    // else if (this.state.role == 'shipper') {
    //   return <Redirect push to="/Shipper" />;
    // }
    return (
      <div className={this.state.cssclassName}>
        <div className="aepheaderbar logoBar">
        <img src={this.state.logo} className="" width="350px" fluid="true" />
        </div>
        <Container >

          <Row>
            <Col >
              <div className="loginContainer">
                <Col >
                  <h1 className="textCenter boldHeading">Welcome </h1>
                  <br></br>
                  <Form noValidate validated={this.state.validated} onSubmit={this.handleSubmit}>
                    <InputGroup className='loginInputgroup'>
                        <InputGroup.Text id="inputGroupPrepend"><FontAwesomeIcon icon={faUser} /></InputGroup.Text>
                      <Form.Control
                        type="text"
                        placeholder="User Name"
                        aria-describedby="inputGroupPrepend"
                        required
                        name="email"
                        onChange={this.handleInputChange}
                      />
                      {/* <Form.Control.Feedback type="invalid">
                        Email
            </Form.Control.Feedback> */}
                    </InputGroup>

                    <InputGroup className='loginInputgroup'>
                        <InputGroup.Text id="inputGroupPrepend"><FontAwesomeIcon icon={faLock} /></InputGroup.Text>                      
                      <Form.Control
                        type="password"
                        placeholder="Password"
                        aria-describedby="inputGroupPrepend"
                        required
                        name="password"
                        onChange={this.handleInputChange}
                      />
                      {/* <Form.Control.Feedback type="invalid">
                        Password
            </Form.Control.Feedback> */}
                    </InputGroup>
                    <Row className="smallTextRow">
                      <Col >
                        <Form.Group controlId="formBasicCheckbox">
                          <Form.Check type="checkbox" label="Remember Me" />
                        </Form.Group>
                      </Col>
                      <Col className="forgotPwd">
                        <a href="#">Forgot Password?</a>
                      </Col>
                    </Row>
                    <div className='loginbuttoncontainer'>
                    <Button type="submit" className={this.state.logincss}>
                      Login
                  </Button>
                    </div>
                    
                  </Form>
                </Col>
              </div>
              <div className="account">
                Do not have an account? <a href="#">Register</a>
              </div>

            </Col>
          </Row>
        </Container>
      </div>


    )
  }
}

export default AEPLogin



