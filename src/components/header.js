import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  Redirect,
  useHistory,
  useLocation
} from "react-router-dom";
import Table from 'react-bootstrap/Table';
import axios from 'axios';
import Pagination from 'react-bootstrap/Pagination';
import data from './data/data.json';
import { withRouter } from 'react-router-dom';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Container from 'react-bootstrap/Container';
// This example has 3 pages: a public page, a protected
// page, and a login screen. In order to see the protected
// page, you must first login. Pretty standard stuff.
//
// First, visit the public page. Then, visit the protected
// page. You're not yet logged in, so you are Redirected
// to the login page. After you login, you are Redirected
// back to the protected page.
//
// Notice the URL change each time. If you click the back
// button at this point, would you expect to go back to the
// login page? No! You're already logged in. Try it out,
// and you'll see you go back to the page you visited
// just *before* logging in, the public page.

class Header extends React.Component {
    constructor() {
        super()        
     this.state ={
        
     }
     this.login = this.login.bind(this);
    }

    componentDidMount() {
     
    }
 
  logout(){
    this.props.history.push("/");
    sessionStorage.clear();
  }
    render() {
        return (
            <div>
               
               <Container>
                <Row>
                    <Col xs={11}> <h1>AEP Admin</h1> </Col> 
                    <Col xs={1}>Hello {this.state.useremail}<a href="#" onClick={this.login}>Logout</a></Col>
                </Row>
                </Container>
        
            </div>
        )
    }
}

export default Header



