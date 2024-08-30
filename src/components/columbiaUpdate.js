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
            partnerData: [],
            customerLoyaltyData: [],
            seasonalProductPopularityData: [],
            productsList: [],
            loaderState: false,
            homeTabIndex: 0,
            showModal: false,
            modalData: [],
            insertModalData: [],
        }
        this.logout = this.logout.bind(this);
        this.showModal = this.showModal.bind(this)
        this.closeModal = this.closeModal.bind(this)
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
            this.fetchProductData();
        }
    }
    switchTab(e, data) {
        if(data.activeIndex == 0){
            this.fetchProductData();
        }
        else if(data.activeIndex == 1){
            this.fetchPartnerData();
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
    fetchPartnerData = async () => {
        this.setState({
            loaderState: true
        })
        try {
            // Make a GET request using fetch
            const response = await fetch(GAAPI + '/partnersRecord'); // Replace with your API endpoint
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
                partnerData: result,
                loaderState: false
            })
        } catch (error) {
            // Handle errors
            console.error(error);
        }
    };
    insertTable = () => {
        this.setState({
            loaderState: true
        })
        console.log(this.state.modalData)
        fetch(GAAPI + '/insert', {
            method: 'post',
            body: JSON.stringify(this.state.modalData),
            headers: {
                // "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                
                this.setState({
                    loaderState: false
                })
            }
            else {
                this.setState({
                    warrantyTicketNo: null,
                    warrantyloader: false,
                    showModalPart: false,
                    loaderState: false
                })
            }


        })
    }
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
    fetchProductData = async () => {
        this.setState({
            loaderState: true
        })
        try {
            // Make a GET request using fetch
            const response = await fetch(GAAPI + '/listProducts'); // Replace with your API endpoint
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
                productsList: result,
                loaderState: false
            })
        } catch (error) {
            // Handle errors
            console.error(error);
        }
    };
    handleItemClick = (e, { name }) => this.setState({ activeItem: name })
    showModal(rowInfo) {
        this.setState({
            modalData: this.state.modalData.concat(rowInfo.original),
            isModalLoaded: true
        })
        console.log(rowInfo)
    }
    openModal() {
        this.setState({
            insertModalData: [],
            isModalLoaded: true
        })
    }
    closeModal() {
        console.log(this.state.modalData)
        this.setState({
            isModalLoaded: false,
            modalData: [],
            modalSuccessMessage: ''
        })
    }

    render() {
        const { activeItem } = this.state
        if (this.state.activeItem === 'Dashboard') {
            return <Redirect push to="/ColumbiaHome" />;
        }
        const HomePanes = [
            {
                menuItem: (
                    <Menu.Item key="query1" className='partTabIndex'>
                        Product List
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            {
                menuItem: (
                    <Menu.Item key='query2' className='partTabIndex'>
                        Partner
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            // {
            //     menuItem: (
            //         <Menu.Item key='query3' className='partTabIndex'>
            //             Table 3
            //         </Menu.Item>
            //     ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            // },
            // {
            //     menuItem: (
            //         <Menu.Item key='query4' className='partTabIndex'>
            //             Table 4
            //         </Menu.Item>
            //     ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            // },
        ]


        const brandcolumns = [
            { Header: 'Brand Code', accessor: 'BRANDCODE' },
            { Header: 'Brand Name', accessor: 'BRANDNAME' },
            { Header: 'Brand Description', accessor: 'BRANDDESCRIPTION' },
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
            { Header: 'Product ID', accessor: 'PRODID' },
            { Header: 'Product Name', accessor: 'PRODUCTNAME' },
            { Header: 'Season', accessor: 'SELLINGPRICE' },
            { Header: 'Number of Orders', accessor: 'NUMOFORDERS' },
            { Header: 'Total Quantity', accessor: 'TOTALQUANTITY' },
        ]
        const productListcolumns = [
            { Header: 'Product ID', accessor: 'PRODID' },
            { Header: 'Product Name', accessor: 'PRODUCTNAME' },
            { Header: 'Selling Price', accessor: 'SEASON' },
            { Header: 'Purchasing Price', accessor: 'NUMOFORDERS' },
            { Header: 'Brand Code', accessor: 'BRANDCODE' },
            { Header: 'Category ID', accessor: 'CATID' }

        ]
        const parterColumns = [
            { Header: 'Partner ID', accessor: 'PARTNERID' },
            { Header: 'Partner Name', accessor: 'PARTNERNAME' },
            { Header: 'Contact Name', accessor: 'CONTACTNAME' },
            { Header: 'Contact Number', accessor: 'CONTACTPHONENUM' },
            { Header: 'Brand Code', accessor: 'CONTACTEMAIL' }
                ]
        let tableCardElement = (
            <div className="tableCSSClass">
                <ReactTable
                    data={this.state.brandData} defaultPageSize={10}
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
        let productListElement = (
            <div className="tableCSSClass">
                <ReactTable
                    data={this.state.productsList} defaultPageSize={10}
                    columns={productListcolumns}
                    getTdProps={(state, rowInfo, column, instance) => {
                        return {
                            onClick: (e, handleOriginal) => {
                                this.showModal(rowInfo)
                            }
                        }
                    }
                    }
                />
            </div>
        )
        let partnerListElement = (
            <div className="tableCSSClass">
                <ReactTable
                    data={this.state.partnerData} defaultPageSize={10}
                    columns={parterColumns}
                    // getTdProps={(state, rowInfo, column, instance) => {
                    //     return {
                    //         onClick: (e, handleOriginal) => {
                    //             this.showModal(rowInfo)
                    //         }
                    //     }
                    // }
                    // }
                />
            </div>
        )
        if (this.state.loaderState) {
            productListElement = <Spinner />
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
                                <Menu.Item name='Dashboard'
                                    active={activeItem === 'Dashboard'}
                                    onClick={this.handleItemClick}
                                />
                                <Menu.Item header
                                    name='Update'
                                    active={activeItem === 'aboutUs'}

                                />
                                <Menu.Item
                                    name='jobs'
                                    active={activeItem === 'jobs'}
                                />
                                <Menu.Item
                                    name='locations'
                                    active={activeItem === 'locations'}
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
                                        
                                        <div className='modalButtonCSS'>
                                        <Header as='h3'>Product List</Header>
                                                                <Button className="button-insert" onClick={() => this.openModal()}>Insert</Button>
                                                                </div>
                                        {productListElement}
                                        {this.state.modalData.length != 0 ?
                                            <Modal open={this.state.isModalLoaded} closeIcon={true} onClose={() => this.closeModal()}>
                                                <Modal.Header>Product Type:  {this.state.modalData[0].PRODID}</Modal.Header>
                                                <Modal.Content>
                                                    <Grid columns={2}>
                                                        <Grid.Row>
                                                            <form>
                                                                <div className='modelRow'>
                                                                <div className='modelcolumn'>
                                                                    <div className='modalRowContent'>
                                                                        <label>Product Name:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.modalData[0].PRODUCTNAME}
                                                                            onChange={e => {
                                                                                let arr = this.state.modalData[0];
                                                                                arr.PRODUCTNAME = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    modalData: {                   // object that we want to update
                                                                                        ...prevState.modalData,    // keep all other key-value pairs
                                                                                        modalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                    <br />
                                                                    <div className='modalRowContent'>
                                                                        <label>Selling price:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.modalData[0].SELLINGPRICE}
                                                                            onChange={e => {
                                                                                let arr = this.state.modalData[0];
                                                                                arr.SELLINGPRICE = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    modalData: {                   // object that we want to update
                                                                                        ...prevState.modalData,    // keep all other key-value pairs
                                                                                        modalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                    <div className='modalRowContent'>
                                                                        <label>Purchase Price:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.modalData[0].PURCHASINGPRICE}
                                                                            onChange={e => {
                                                                                let arr = this.state.modalData[0];
                                                                                arr.PURCHASINGPRICE = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    modalData: {                   // object that we want to update
                                                                                        ...prevState.modalData,    // keep all other key-value pairs
                                                                                        modalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                </div>
                                                                <div className='modelcolumn'>
                                                                    <div className='modalRowContent'>
                                                                        <label>Brand Code:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.modalData[0].BRANDCODE}
                                                                            onChange={e => {
                                                                                let arr = this.state.modalData[0];
                                                                                arr.BRANDCODE = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    modalData: {                   // object that we want to update
                                                                                        ...prevState.modalData,    // keep all other key-value pairs
                                                                                        modalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                    <br />
                                                                    <div className='modalRowContent'>
                                                                        <label>Category ID:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.modalData[0].CATID}
                                                                            onChange={e => {
                                                                                let arr = this.state.modalData[0];
                                                                                arr.CATID = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    modalData: {                   // object that we want to update
                                                                                        ...prevState.modalData,    // keep all other key-value pairs
                                                                                        modalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                </div>
                                                                </div>
                                                            </form>

                                                        </Grid.Row>
                                                        <Grid.Row>
                                                            <div className='modalButtonCSS'>
                                                                <Button className="button-update">Update</Button>
                                                                <Button className="button-delete">Delete</Button>
                                                            </div>
                                                        </Grid.Row>

                                                    </Grid>

                                                </Modal.Content>
                                            </Modal>
                                            :
                                            <Modal><Modal.Header>No data available!!!</Modal.Header></Modal>
                                        }
                                        {/* {this.state.insertModalData.length == 0 ?
                                            <Modal open={this.state.isModalLoaded} closeIcon={true} onClose={() => this.closeModal()}>
                                                <Modal.Header>Product Details</Modal.Header>
                                                <Modal.Content>
                                                    <Grid columns={2}>
                                                        <Grid.Row>
                                                            <form>
                                                                <div className='modelRow'>
                                                                <div className='modelcolumn'>
                                                                    <div className='modalRowContent'>
                                                                        <label>Product Name</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.insertModalData[0].PRODUCTNAME}
                                                                            onChange={e => {
                                                                                let arr = this.state.insertModalData[0];
                                                                                arr.PRODUCTNAME = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    insertModalData: {                   // object that we want to update
                                                                                        ...prevState.insertModalData,    // keep all other key-value pairs
                                                                                        insertModalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                    <br />
                                                                    <div className='modalRowContent'>
                                                                        <label>Selling price:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.modalData[0].SELLINGPRICE}
                                                                            onChange={e => {
                                                                                let arr = this.state.insertModalData[0];
                                                                                arr.SELLINGPRICE = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    insertModalData: {                   // object that we want to update
                                                                                        ...prevState.insertModalData,    // keep all other key-value pairs
                                                                                        insertModalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                    <div className='modalRowContent'>
                                                                        <label>Purchase Price:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.insertModalData[0].PURCHASINGPRICE}
                                                                            onChange={e => {
                                                                                let arr = this.state.insertModalData[0];
                                                                                arr.PURCHASINGPRICE = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    insertModalData: {                   // object that we want to update
                                                                                        ...prevState.insertModalData,    // keep all other key-value pairs
                                                                                        insertModalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                </div>
                                                                <div className='modelcolumn'>
                                                                    <div className='modalRowContent'>
                                                                        <label>Brand Code:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.modalData[0].BRANDCODE}
                                                                            onChange={e => {
                                                                                let arr = this.state.insertModalData[0];
                                                                                arr.BRANDCODE = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    insertModalData: {                   // object that we want to update
                                                                                        ...prevState.insertModalData,    // keep all other key-value pairs
                                                                                        insertModalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                    <br />
                                                                    <div className='modalRowContent'>
                                                                        <label>Category ID:</label>
                                                                        <input
                                                                            type="text"
                                                                            value={this.state.insertModalData[0].CATID}
                                                                            onChange={e => {
                                                                                let arr = this.state.insertModalData[0];
                                                                                arr.CATID = e.target.value;
                                                                                this.setState(prevState => ({
                                                                                    insertModalData: {                   // object that we want to update
                                                                                        ...prevState.insertModalData,    // keep all other key-value pairs
                                                                                        insertModalData: arr      // update the value of specific key
                                                                                    }
                                                                                }))
                                                                            }}
                                                                        />
                                                                    </div>
                                                                </div>
                                                                </div>
                                                            </form>

                                                        </Grid.Row>
                                                        <Grid.Row>
                                                            <div className='modalButtonCSS'>
                                                                <Button className="button-update">Update</Button>
                                                                <Button className="button-delete">Delete</Button>
                                                            </div>
                                                        </Grid.Row>

                                                    </Grid>

                                                </Modal.Content>
                                            </Modal>
                                            :
                                            <Modal><Modal.Header>No data available!!!</Modal.Header></Modal>
                                        } */}
                                    </section>)
                            }
                            else if (this.state.homeTabIndex == '1') {
                                return (
                                    <section className='homeSectionCSS'>
                                        <Header as='h3'> List of Partners</Header>
                                        {partnerListElement}
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