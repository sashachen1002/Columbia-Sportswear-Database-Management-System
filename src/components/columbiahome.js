import React from 'react';
import {
    Header,
    Container,
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
    Dropdown
} from 'semantic-ui-react';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser } from '@fortawesome/free-solid-svg-icons';
import PartsImage from './images/part.png';
import logo from './images/columbia-sportswear-co-1.svg';
import { GAAPI, serverAPI } from './api-config';
import {
    BrowserRouter as Router,
    Redirect,
  } from "react-router-dom";
// import { useMemo } from 'react';
// import {
//     MaterialReactTable,
//     useMaterialReactTable,
// } from 'material-react-table';
import ReactTable from 'react-table-v6';
import users from './data/user.json';
import Spinner from './spinner';

class ColumbiaHome extends React.Component {
    constructor() {
        super()
        this.state = {
            brandData: [],
            salesByTopBrands: [],
            customerLoyaltyData: [],
            seasonalProductPopularityData: [],
            topPerformingBrands: [],
            loaderState: false,
            homeTabIndex: 0,
        }
        this.logout = this.logout.bind(this);
    }

    componentDidMount() {
        if ((sessionStorage.getItem('userEmail') !== "") && (sessionStorage.getItem('userEmail') !== null) && (sessionStorage.getItem('userEmail') !== undefined)) {
            this.setState({
                userEmail: sessionStorage.getItem('userEmail'),
                userFirstName: sessionStorage.getItem('userFirstName'),
                userLastName: sessionStorage.getItem('userLastName'),
                role: sessionStorage.getItem('role'),
                aoID: sessionStorage.getItem('mroID')
            });
            // this.fetchData();
            // this.fetchSalesByTopBrands();
            // this.fetchCustomerLoyaltyData();
            // this.fetchSeasonalPopularProductData();
            this.fetchTopPerformingBrands();
        }
    }
    switchTab(e, data) {
        if(data.activeIndex == 0){
            this.fetchTopPerformingBrands();
        }
        else if(data.activeIndex == 1){
            this.fetchSalesByTopBrands();
        }
        else if(data.activeIndex == 2){
            this.fetchCustomerLoyaltyData();
        }
        else if(data.activeIndex == 3){
            this.fetchSeasonalPopularProductData();
        }
        this.setState({
            homeTabIndex: data.activeIndex
        })
    }

    logout() {
        this.props.history.push("/");
        sessionStorage.clear();
    }

    // Function to fetch data
    fetchData = async () => {
        this.setState({
            loaderState: true
        })
        try {
            // Make a GET request using fetch
            const response = await fetch(GAAPI + '/data'); // Replace with your API endpoint
            if (!response.ok) {
                // Handle non-2xx responses
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            // Parse the response as JSON
            const result = await response.json();
            console.log("result", result);
            // console log the type of the response
            console.log(typeof result);

            // Update state with the fetched data
            this.setState({
                brandData: result,
                loaderState: false
            })
        } catch (error) {
            // Handle errors
            console.error(error);
        }
    };

    fetchSalesByTopBrands = async () => {
        this.setState({
            loaderState: true
        })
        try {
            // Make a GET request using fetch
            const response = await fetch(GAAPI + '/totalsalesbytopbrands'); // Replace with your API endpoint
            if (!response.ok) {
                // Handle non-2xx responses
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            // Parse the response as JSON
            const result = await response.json();
            console.log("result", result);
            // console log the type of the response
            // console.log(typeof result);

            // Update state with the fetched data
            this.setState({
                salesByTopBrands: result,
                loaderState: false
            })
        } catch (error) {
            // Handle errors
            console.error(error);
        }
    };
    fetchTopPerformingBrands = async () => {
        this.setState({
            loaderState: true
        })
        try {
            // Make a GET request using fetch
            const response = await fetch(GAAPI + '/topPerformingBrands'); // Replace with your API endpoint
            if (!response.ok) {
                // Handle non-2xx responses
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            // Parse the response as JSON
            const result = await response.json();
            console.log("result", result);
            // console log the type of the response
            // console.log(typeof result);

            // Update state with the fetched data
            this.setState({
                topPerformingBrands: result,
                loaderState: false
            })
        } catch (error) {
            // Handle errors
            console.error(error);
        }
    };
    fetchCustomerLoyaltyData = async () => {
        this.setState({
            loaderState: true
        })
        try {
            // Make a GET request using fetch
            const response = await fetch(GAAPI + '/customerloyaltyanalysis'); // Replace with your API endpoint
            if (!response.ok) {
                // Handle non-2xx responses
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            // Parse the response as JSON
            const result = await response.json();
            console.log("result", result);
            // console log the type of the response
            // console.log(typeof result);

            // Update state with the fetched data
            this.setState({
                customerLoyaltyData: result,
                loaderState: false
            })
        } catch (error) {
            // Handle errors
            console.error(error);
        }
    };
    fetchSeasonalPopularProductData = async () => {
        this.setState({
            loaderState: true
        })
        try {
            // Make a GET request using fetch
            const response = await fetch(GAAPI + '/seasonalProductPopularity'); // Replace with your API endpoint
            if (!response.ok) {
                // Handle non-2xx responses
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            // Parse the response as JSON
            const result = await response.json();
            console.log("result", result);
            // console log the type of the response
            // console.log(typeof result);

            // Update state with the fetched data
            this.setState({
                seasonalProductPopularityData: result,
                loaderState: false
            })
        } catch (error) {
            // Handle errors
            console.error(error);
        }
    };
    // handleItemClick = (e, { name }) => this.setState({ activeItem: name })
    handleClick = event => { this.setState({ activeItem: 'aboutUs' }) }

    render() {
        const { activeItem } = this.state
        if (this.state.activeItem === 'aboutUs') {
            return <Redirect push to="/ColumbiaUpdate" />;
          }
        const HomePanes = [
            {
                menuItem: (
                    <Menu.Item key="query1" className='partTabIndex'>
                        Top Performing Brands
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            {
                menuItem: (
                    <Menu.Item key='query2' className='partTabIndex'>
                        Sales - Top Selling Brands
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            {
                menuItem: (
                    <Menu.Item key='query3' className='partTabIndex'>
                        Customer Loyalty Report
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            {
                menuItem: (
                    <Menu.Item key='query4' className='partTabIndex'>
                        Product Popularity
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },]


        const brandcolumns = [
            { Header: 'Brand Name', accessor: 'BRANDNAME' },
            { Header: 'Month', accessor: 'MONTH' },
            { Header: 'Total Orders', accessor: 'TOTALORDERS' },
            { Header: 'Total Sales', accessor: 'TOTALSALES' },
        ]
        const topSalesByBrandscolumns = [
            { Header: 'Brand Name', accessor: 'BRANDNAME' },
            { Header: 'Total Sales', accessor: 'TOTALSALES' },
        ]
        const customerLoyaltycolumns = [
            { Header: 'Customer ID', accessor: 'CUSTOMERID' },
            { Header: 'Name', accessor: 'NAME' },
            { Header: 'Average Purchase Amount ($)', accessor: 'CUSTOMERID' },
            { Header: 'Number of Orders', accessor: 'NUMOFORDERS' },
        ]
        const seasonalPopularitycolumns = [
            { Header: 'Product ID', accessor: 'PRODID'},
            { Header: 'Product Name', accessor: 'PRODUCTNAME'},
            { Header: 'Season', accessor: 'SEASON' },
            { Header: 'Number of Orders', accessor: 'NUMOFORDERS' },
            { Header: 'Total Quantity', accessor: 'TOTALQUANTITY' },
        ]
        let tableCardElement = (
            <div className="tableCSSClass">
                <ReactTable
                    data={this.state.topPerformingBrands} defaultPageSize={10}
                    columns={brandcolumns}
                />
            </div>
        )
        let topSalesByBrandsCardElement = (
            <div className="tableCSSClass">
                <ReactTable
                    data={this.state.salesByTopBrands} defaultPageSize={10}
                    columns={topSalesByBrandscolumns}
                />
            </div>
        )
        let customerLoyaltyCardElement = (
            <div className="tableCSSClass">
                <ReactTable
                    data={this.state.customerLoyaltyData} defaultPageSize={10}
                    columns={customerLoyaltycolumns}
                />
            </div>
        )
        let seasonalPopularityElement = (
            <div className="tableCSSClass">
                <ReactTable
                    data={this.state.seasonalProductPopularityData} defaultPageSize={10}
                    columns={seasonalPopularitycolumns}
                />
            </div>
        )
        if (this.state.loaderState) {
            tableCardElement = <Spinner />
            topSalesByBrandsCardElement = <Spinner />
            customerLoyaltyCardElement = <Spinner />
        }
        return (
            <div className="screens-background">
                <div className="homeheaderbar">
                    <Row className="width100">
                        <Col xs={12} md={2} className="logoBar">
                            <img src={logo} className="" width="150" fluid="true" />
                        </Col>
                        <Col md={7} className="navRow">
                            <Menu>
                                <Menu.Item header>Dashboard</Menu.Item>
                                <Menu.Item
                                    name='Update'
                                    active={activeItem === 'aboutUs'}
                                    onClick={this.handleClick}
                                />
                                <Menu.Item
                                    name='jobs'
                                    active={activeItem === 'jobs'}
                                    onClick={this.handleItemClick}
                                />
                                <Menu.Item
                                    name='locations'
                                    active={activeItem === 'locations'}
                                    onClick={this.handleItemClick}
                                />
                            </Menu>
                        </Col>
                        <Col xs={12} md={3} className="navRow userDetails regulator">
                            <div className="userDetailsRow">
                                <div className="personIcon">
                                    <FontAwesomeIcon icon={faUser} />
                                </div>
                                {/* <div className="userName">{this.state.userFirstName} {this.state.userLastName}</div>
                                    <button className="signoutcss">Sign Out</button> */}

                                <Dropdown text={this.state.userFirstName}>
                                    <Dropdown.Menu>
                                        <Dropdown.Item className='signout' onClick={this.logout} text='SignOut' />
                                    </Dropdown.Menu>
                                </Dropdown>
                            </div>
                        </Col>
                    </Row>
                </div>
                <div >
                    <Row className="searchRow">
                        <Search
                            className="searchBar"
                            placeholder='Search...'
                        />
                    </Row>
                </div>
                <div className="homeContent" >
                    <Container className="header-navigation-bar">
                        <Tab className="header-tabs-items" activeIndex={this.state.homeTabIndex} menu={{ secondary: true, pointing: true }} renderActiveOnly={false} panes={HomePanes} onTabChange={(event, data) => this.switchTab(event, data)} />
                    </Container>
                    <Container className="listContentArea">
                        {(() => {
                            if (this.state.homeTabIndex == '0') {
                                return (
                                    <section className='homeSectionCSS'>
                                        <Header as='h3'> Top Performing Brands - Monthly</Header>
                                        {tableCardElement}
                                    </section>)
                            }
                            else if (this.state.homeTabIndex == '1') {
                                return (
                                    <section className='homeSectionCSS'>
                                        <Header as='h3'> Sales of Top Selling Brands</Header>
                                        {topSalesByBrandsCardElement}
                                    </section>)
                            }
                            else if (this.state.homeTabIndex == '2') {
                                return (
                                    <section className='homeSectionCSS'>
                                        <Header as='h3'>Customer Loyalty Information</Header>
                                        {customerLoyaltyCardElement}
                                    </section>)
                            }
                            else if (this.state.homeTabIndex == '3') {
                                return (
                                    <section className='homeSectionCSS'>
                                        <Header as='h3'>Seasonal Product Popularity</Header>
                                        {seasonalPopularityElement}
                                    </section>)
                            }

                        })()}
                    </Container>
                    {/* <div className='tableCSSClass'>
                        <ReactTable
                            data={this.state.brandData} defaultPageSize={10}
                            columns={brandcolumns}
                        />
                    </div> */}
                </div>

            </div>
        )
    }
}

export default ColumbiaHome