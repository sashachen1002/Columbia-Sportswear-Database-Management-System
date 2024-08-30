import React from "react";
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Home from './components/home';
import Login from './components/aeplogin';
// import aoHome from './components/aohome';
// import mroHome from './components/mrohome';
import ColumbiaHome from './components/columbiahome';
import ColumbiaUpdate from './components/columbiaUpdate';

class Routes extends React.Component {
    // constructor() {
    //     super()  
    // }
    render() {

        return (
            <Router>
                <div>
                    <Route exact path="/" component={Login} />
                    <Route exact path="/Home" component={Home} />
                    {/* <Route  exact path="/AOHome" component={aoHome} />
                  <Route  exact path="/Home" component={mroHome} />
                  <Route  exact path="/Supplier" component={supplierHome} />*/}
                    <Route exact path="/ColumbiaHome" component={ColumbiaHome} />
                    <Route exact path="/ColumbiaUpdate" component={ColumbiaUpdate} />
                </div>
            </Router>
        )
    }
}

export default Routes