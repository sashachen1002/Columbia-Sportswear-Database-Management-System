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
    Dropdown,
} from "semantic-ui-react";
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser } from '@fortawesome/free-solid-svg-icons';
import { GAAPI, Channel, ChainCode, ChainCodeMRO, ChainCodeVer, Authorization, AOHomeAPI } from './api-config';
import Cardcomponent from './cardcomponent';
import Partcardcomponent from './partcardcomponent';
import Accordion from './accordioncomponent';
import Spinner from './spinner';
import Stepper from 'react-js-stepper';
import PartsImage from './images/part.png';
import logo from './images/Delta_logo.svg';

class aohome extends React.Component {
    constructor() {
        super()
        this.state = {
            homeTabIndex: 0,
            currentDate: null,
            aircraftData: [],
            MaintenanceReqData: [],
            maintenanceData: [],
            warrantyData: [],
            partData: [],
            showAircraftComponent: 1,
            selectedCardID: null,
            loaderState: false,
            showModalPart: false,
            showModalwarranty: false,
            showModalMR: false,
            selectedPartUID: null,
            selectedPartData: null,
            selectedMRData: null,
            selectedMRID: null,
            selectedWarrantyID: null,
            activeStep: 1,
            maintenanceRequestNo: null,
            mrModalScreen: true,
            orModalScreen: true,
            mrModalRScreen: true,
            wstatus: null,
            warrantyTicketNo: null,
            warrantyloader: false,
            warrantyTicketData: [],
            MRcomments: null,
            selectedMRO: null,
            dimmerState: false,
            orderConfirmState: false,
            maintenanceStatus: null,
            mroName: null,
            partWarrantyStatus: null,
            radioOption: null,
            selectedReplacePartUID: null,
            replacedPartUID: null,
            serviceData: [],
            InventoryData: [],
            InventoryData3rdParty: [],
            selectedReplacePartData: [],
            AccordionIndex: null,
            orderDataByUID: null,
            OrderReqData: [],
            selectedOrderID: null,
            selectedOrderStatus: null,
            selectedOrderData: [],
            showModalOrder: false,
            shipmentDataByOID: [],
            shipmentID: null,
            partReplacementStatus: false,
            partReceivedStatus: false,
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
            var MID = sessionStorage.getItem('mroID');
        }
        this.getDatefun();
        this.fetchAircraftDetails();
        this.fetchMaintenanceRequests();
        this.fetchWarrantyDetails();
        this.fetchOrderRequest();
    }
    getDatefun() {
        var d = new Date()
        var year = new Intl.DateTimeFormat('en', { year: 'numeric' }).format(d)
        var month = new Intl.DateTimeFormat('en', { month: 'short' }).format(d)
        var day = new Intl.DateTimeFormat('en', { day: '2-digit' }).format(d)
        var tempDate = month + '-' + day + '-' + year
        this.setState({
            currentDate: tempDate
        })
    }

    fetchAircraftDetails() {
        this.setState({
            aircraftData: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCode,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"Aircraft\",\"airOppID\":\"AO101\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                aircraftData: tempData,
                loaderState: false
            })

        })
    }
    fetchMaintenanceRequests() {
        this.setState({
            MaintenanceReqData: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"maintenance\",\"airOppID\":\"AO101\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                MaintenanceReqData: tempData,
                loaderState: false
            })

        })
    }
    fetchWarrantyDetails() {
        this.setState({
            warrantyData: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"ticket\",\"airOppID\":\"AO101\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                warrantyData: tempData,
                loaderState: false
            })

        })
    }
    fetchOrderRequest() {
        this.setState({
            OrderReqData: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"order\",\"airOppID\":\"AO101\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                OrderReqData: tempData,
                loaderState: false
            })

        })
    }
    fetchpartDetailsByUID(id) {
        this.setState({
            partUIDDetails: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "read",
                "args": [id],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                partUIDDetails: tempData,
                partWarrantyStatus: tempData.warrantyStatus,
                loaderState: false
            })

        })
    }
    fetchInventoryByPartNumber(pnumber) {
        this.setState({
            InventoryData: [],
            loaderState: true
        })
        console.log(this.state.aoID)
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"parts\",\"partNumber\":\"" + pnumber + "\",\"supplierID\":\"" + this.state.aoID + "\",\"partStatus\":\"Available\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                InventoryData: tempData,
                loaderState: false
            })

        })
    }
    fetch3rdPartyInventoryByPartNumber(pnumber) {
        this.setState({
            InventoryData3rdParty: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"parts\",\"partNumber\":\"" + pnumber + "\",\"partStatus\":\"Available\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                InventoryData3rdParty: tempData,
                loaderState: false
            })

        })
    }
    fetchServiceDetailsByUID(id) {
        this.setState({
            serviceData: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"service\",\"partUID\":\"" + id + "\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                serviceData: tempData,
                loaderState: false
            })

        })
    }
    fetchOrderDetailsByMID(id) {
        this.setState({
            orderDataByUID: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"order\",\"mRequestNumber\":\"" + id + "\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            if (tempData.length != 0) {
                this.setState({
                    orderDataByUID: tempData[0].Record,
                    loaderState: false
                })
            }
            else {
                this.setState({
                    loaderState: false
                })
            }
        })
    }
    fetchShipmentDetailsByOrderNo(id) {
        this.setState({
            shipmentDataByOID: [],
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"shipment\",\"orderNumber\":\"" + id + "\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            if (tempData.length != 0) {
                this.setState({
                    shipmentDataByOID: tempData[0].Record,
                    shipmentID: tempData[0].Record.shipmentNumber,
                    loaderState: false
                })
            }
            else {
                this.setState({
                    loaderState: false
                })
            }
        })
    }
    fetchDummy() {
        this.setState({
            maintenanceData: [],
        })
        fetch(AOHomeAPI, {
            method: 'get'
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = res.zones.slice(0, 7);;
            console.log(tempData)
            this.setState({
                maintenanceData: tempData
            })

        })
    }
    openWarrantyTicket = () => {
        this.getDatefun();
        this.setState({
            warrantyloader: true,
            warrantyTicketNo: null
        })
        var temptickeNo = this.generateWarrantyTickeNo(5);
        console.log(temptickeNo)

        fetch(GAAPI + '/invocation', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "initTicket",
                "args": [temptickeNo, this.state.selectedPartData.partDescription, this.state.currentDate, "Open", "nil", "Ticket Opened", this.state.selectedPartData.warrantyNumber, this.state.selectedPartUID, "AO101"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                this.setState({
                    warrantyTicketNo: temptickeNo,
                    warrantyloader: false
                })
            }
            else {
                this.setState({
                    warrantyTicketNo: null,
                    warrantyloader: false
                })
            }


        })
    }
    initOrderRequest = (id, msts) => {
        this.setState({
            orderRequestNo: null
        })
        var tempno = this.generateOrderRequestNo(5);
        fetch(GAAPI + '/invocation', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "initOrder",
                "args": [tempno, this.state.currentDate, id, this.state.aoID, this.state.selectedPartData.supplierID, this.state.selectedPartData.warrantyNumber, this.state.selectedPartData.partCondition, this.state.selectedPartData.partNumber, this.state.selectedPartData.oemID, msts],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                this.changeMaintenanceStatus(msts, "In-Progress")
                this.setState({
                    // dimmerState:true,
                    orderRequestNo: tempno
                })
            }
            else {
                this.setState({
                    loaderState: false
                })
            }


        })
    }
    initReplaceOrderRequest = () => {
        this.setState({
            loaderState: true,
            orderReplaceRequestNo: null
        })
        var tempno = this.generateOrderRequestNo(5);
        fetch(GAAPI + '/invocation', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "initOrder",
                "args": [tempno, this.state.currentDate, this.state.selectedReplacePartUID, this.state.aoID, this.state.selectedReplacePartData.supplierID, this.state.selectedReplacePartData.warrantyNumber, this.state.selectedReplacePartData.partCondition, this.state.selectedReplacePartData.partNumber, this.state.selectedReplacePartData.supplierID, this.state.selectedMRData.mRequestNumber],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                // this.changeOldPartStatus(this.state.selectedMRData.mPartID)
                // this.changeNewPartStatus(this.state.selectedReplacePartUID)
                this.setState({
                    loaderState: false,
                    orderConfirmState: true,
                    orderReplaceRequestNo: tempno
                })
                if (this.state.radioOption === "3rdParty") {
                    this.changeMaintenanceStatus(this.state.selectedMRData.mRequestNumber, "In-Progress")
                }
            }
            else {
                this.setState({
                    loaderState: false
                })
            }


        })
    }
    // changeOldPartStatus(id) {
    //     fetch(GAAPI + '/invocation', {
    //         method: 'post',
    //         body: JSON.stringify({
    //             "channel": Channel,
    //             "chaincode": ChainCodeMRO,
    //             "method": "pstatus",
    //             "args": [id, "UnAvailable"],
    //             "chaincodeVer": ChainCodeVer
    //         }),
    //         headers: {
    //             "Authorization": Authorization,
    //             "Content-Type": "application/json"
    //         }
    //     }).then((response) => {
    //         return response.json();
    //     }).then((res) => {
    //         console.log(res)
    //         if (res.returnCode === "Success") {
    //             console.log("Success")
    //         }
    //         else {
    //             this.setState({
    //                 loaderState: false
    //             })
    //         }


    //     })
    // }
    // changeNewPartStatus(id) {
    //     fetch(GAAPI + '/invocation', {
    //         method: 'post',
    //         body: JSON.stringify({
    //             "channel": Channel,
    //             "chaincode": ChainCodeMRO,
    //             "method": "pstatus",
    //             "args": [id, "On-Aircraft"],
    //             "chaincodeVer": ChainCodeVer
    //         }),
    //         headers: {
    //             "Authorization": Authorization,
    //             "Content-Type": "application/json"
    //         }
    //     }).then((response) => {
    //         return response.json();
    //     }).then((res) => {
    //         console.log(res)
    //         if (res.returnCode === "Success") {
    //             console.log("Success")
    //             this.replacePartByUID()
    //         }
    //         else {
    //             this.setState({
    //                 loaderState: false
    //             })
    //         }


    //     })
    // }
    replacePartByUID = () => {
        this.setState({
            loaderState: true
        })

        if (this.state.radioOption === "searchInventory") {
            var replacePartUID = this.state.selectedReplacePartUID
        }
        else if (this.state.orderDataByUID.orderStatus === "Closed") {
            var replacePartUID = this.state.orderDataByUID.partUID
        }

        fetch(GAAPI + '/invocation', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "replacepart",
                "args": [replacePartUID, this.state.selectedMRData.mRequestAircraftID, this.state.selectedMRData.mRequestNumber],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                this.setState({
                    loaderState: false,
                    showModalMR: false,
                    partReplacementStatus: true,
                    replacedPartUID: replacePartUID
                })
                this.fetchMaintenanceRequests()
                // if (this.state.radioOption === "searchInventory") {
                //     this.changeMaintenanceStatus(this.state.selectedMRData.mRequestNumber, "Closed")
                //     this.setState({
                //         loaderState: false,
                //         showModalMR: false,
                //         selectedMRID: null,
                //         radioOption: null,
                //     })
                // }
                // if (this.state.radioOption === "3rdParty") {
                //     this.changeMaintenanceStatus(this.state.selectedMRData.mRequestNumber, "In-Progress")
                //     this.setState({
                //         loaderState: false,
                //         orderConfirmState: true,
                //     })
                // }

            }
            else {
                this.setState({
                    loaderState: false,
                    showModalMR: false,
                    selectedMRID: null,
                    radioOption: null,
                })
            }


        })
    }
    changeMaintenanceStatus(id, mstatus) {
        fetch(GAAPI + '/invocation', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "mstatus",
                "args": [id, mstatus],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                console.log("Success")
            }
            else {
                this.setState({
                    loaderState: false
                })
            }


        })
    }
    generateOrderRequestNo(length) {
        var result = 'ORN';
        var characters = '0123456789';
        var charactersLength = characters.length;
        for (var i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }
    openMaintenanceRequest = () => {
        this.setState({
            loaderState: true
        })
        console.log(this.state.maintenanceRequestNo, "Open", this.state.currentDate, "nil", this.state.MRcomments, "Bob", this.state.selectedCardID, this.state.selectedPartUID, "AO101")
        this.getDatefun();
        fetch(GAAPI + '/invocation', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "initMaintenance",
                "args": [this.state.maintenanceRequestNo, "Open", this.state.currentDate, "nil", this.state.MRcomments, "Delta", "Bob", this.state.selectedCardID, this.state.selectedPartUID, "AO101"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                this.changePartStatus(this.state.selectedPartUID)
                if (this.state.wstatus === "Active") {
                    this.initOrderRequest(this.state.selectedPartUID, this.state.maintenanceRequestNo)
                }

                this.setState({
                    warrantyloader: false,
                    showModalPart: false,
                    dimmerState: true,
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
    changePartStatus = (id) => {
        fetch(GAAPI + '/invocation', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "removepart",
                "args": [id],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                console.log("Success")
            }
            // else {
            //     this.setState({
            //         loaderState: false
            //     })
            // }


        })
    }
    receivePartFromShipper = () => {
        this.setState({
            loaderState: true
        })
        fetch(GAAPI + '/invocation', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "recievepart",
                "args": [this.state.selectedOrderID, this.state.shipmentID],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                console.log("Success")
                this.setState({
                    loaderState: false,
                    partReceivedStatus: true
                })
            }
            else {
                this.setState({
                    loaderState: false
                })
            }


        })
    }
    generateWarrantyTickeNo(length) {
        var result = 'WTN';
        var characters = '0123456789';
        var charactersLength = characters.length;
        for (var i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }
    generateMaintenanceNo(length) {
        var result = 'MRN';
        var characters = '0123456789';
        var charactersLength = characters.length;
        for (var i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }
    goHome = () => {
        this.setState({
            showAircraftComponent: 1,
        });
    }
    switchTab(e, data) {
        this.setState({
            homeTabIndex: data.activeIndex
        })
    }
    handleCardSelection = (id) => {
        this.setState({
            selectedCardID: id,
            showAircraftComponent: 0,
            loaderState: true,
            partData: [],
        })
        this.fetchpartsByAircraftID(id)
    }
    fetchpartsByAircraftID = (id) => {
        this.setState({
            loaderState: true
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"parts\",\"aircraftID\":\"" + id + "\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            var tempData = JSON.parse(res.result.payload);
            console.log(tempData);
            this.setState({
                partData: tempData,
                loaderState: false
            })

        })
    }
    handlePartSelection = (id, wst) => {
        console.log("part clicked")
        this.getMaintenanceStatus(id);
        this.getWarrantyticketStatus(id);
        this.setState({
            selectedPartUID: id,
            selectedPartData: null,
            wstatus: wst,
            selectedMRO: null,
            MRcomments: null
        })
        this.state.partData.map((sdata) => {
            if (sdata.Record.partUID === id) {
                console.log(sdata)
                this.setState({
                    selectedPartData: sdata.Record,
                    loaderState: false,
                })
            }
        })
        this.setState({
            loaderState: false
        })
    }
    handleReplacePartSelection = (id) => {
        this.setState({
            selectedReplacePartUID: id,
        })
        this.fetchServiceDetailsByUID(id);
        this.state.InventoryData.map((sdata) => {
            if (sdata.Record.partUID === id) {
                console.log(sdata)
                this.setState({
                    selectedReplacePartData: sdata.Record,
                    loaderState: false,
                })
            }
        })
    }
    handle3rdPartSelection(id) {
        this.setState({
            selectedReplacePartUID: id,
        })
        this.fetchServiceDetailsByUID(id);
        this.state.InventoryData3rdParty.map((sdata) => {
            if (sdata.Record.partUID === id) {
                console.log(sdata)
                this.setState({
                    selectedReplacePartData: sdata.Record,
                    loaderState: false,
                })
            }
        })
    }
    getWarrantyticketStatus = (id) => {

        console.log(id, typeof (id));
        this.setState({
            loaderState: true,
            warrantyTicketData: [],
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"ticket\",\"partUID\":\"" + id + "\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                var tempData = JSON.parse(res.result.payload);
                console.log(tempData);
                if (tempData.length != 0) {
                    this.setState({
                        warrantyTicketData: tempData[0].Record,
                        warrantyTicketNo: tempData[0].Record.ticketNumber,
                        showModalPart: true,
                    })
                }
                else {
                    this.setState({
                        showModalPart: true,
                    })
                }

            }
            else {
                this.setState({
                    warrantyTicketNo: null,
                    showModalPart: true,
                })
            }


        })
    }
    getMaintenanceStatus = (id) => {
        this.setState({
            loaderState: true,
            maintenancerequestDatabyid: [],
            maintenanceRequestNo: null
        })
        fetch(GAAPI + '/query', {
            method: 'post',
            body: JSON.stringify({
                "channel": Channel,
                "chaincode": ChainCodeMRO,
                "method": "queryProduct",
                "args": ["{\"selector\":{\"docType\":\"maintenance\",\"mPartID\":\"" + id + "\"}}"],
                "chaincodeVer": ChainCodeVer
            }),
            headers: {
                "Authorization": Authorization,
                "Content-Type": "application/json"
            }
        }).then((response) => {
            return response.json();
        }).then((res) => {
            console.log(res)
            if (res.returnCode === "Success") {
                var tempData = JSON.parse(res.result.payload);
                console.log(tempData);
                if (tempData.length != 0) {
                    this.setState({
                        maintenancerequestDatabyid: tempData[0].Record,
                        maintenanceRequestNo: tempData[0].Record.mRequestNumber,
                    })
                }
                else {
                    this.setState({
                        maintenanceRequestNo: null,
                    })
                }

            }
            else {
                this.setState({
                    maintenanceRequestNo: null,
                    loaderState: false,
                })
            }


        })
    }
    handleWarrantySelection = (id) => {
        this.setState({
            selectedWarrantyID: id,
            selectedWarrantyData: null,
            loaderState: true
        })
        this.state.warrantyData.map((sdata) => {
            if (sdata.Record.ticketNumber === id) {
                console.log(sdata)
                this.setState({
                    selectedWarrantyData: sdata.Record,
                    loaderState: false,
                    showModalwarranty: true,
                })
            }
        })
    }
    handleMRSelection = (id, mrst) => {
        this.setState({
            selectedMRID: id,
            maintenanceStatus: mrst,
            selectedMRData: null,
        })
        this.state.MaintenanceReqData.map((sdata) => {
            if (sdata.Record.mRequestNumber === id) {
                this.fetchpartDetailsByUID(sdata.Record.mPartID)
                console.log(sdata)
                this.setState({
                    selectedMRData: sdata.Record,
                    showModalMR: true
                })

                if (sdata.Record.mRequestOperator === "mro101") {
                    this.setState({
                        mroName: "GA Telesis Engine Shop (GATES)"
                    })
                }
                else if (sdata.Record.mRequestOperator === "mro102") {
                    this.setState({
                        mroName: "AAR"
                    })
                }
                else if (sdata.Record.mRequestOperator === "mro103") {
                    this.setState({
                        mroName: "Lufthansa Technik"
                    })
                }
                else {
                    this.setState({
                        mroName: sdata.Record.mRequestOperator
                    })
                }
            }
        })
    }
    handleOrderSelection(id, ost) {
        this.setState({
            selectedOrderID: id,
            selectedOrderStatus: ost,
            selectedOrderData: [],
        })
        this.state.OrderReqData.map((sdata) => {
            if (sdata.Record.orderNumber === id) {
                this.fetchShipmentDetailsByOrderNo(id)
                console.log(sdata)
                this.setState({
                    selectedOrderData: sdata.Record,
                    showModalOrder: true,
                })
            }
        })
    }
    handleChangeRadio = (e, { value }) => {
        this.setState({
            radioOption: value,
            selectedReplacePartUID: null,
            serviceData: []
        })
        if (value === "searchInventory") {
            this.fetchInventoryByPartNumber(this.state.partUIDDetails.partNumber)
        }
        else if (value === "3rdParty") {
            this.fetch3rdPartyInventoryByPartNumber(this.state.partUIDDetails.partNumber)
        }
    }
    determineCSS(i) {
        const isItemSelected = this.state.selectedReplacePartUID === i;
        return isItemSelected ? "Active" : "";
    }
    handleClickAccordion = (e, titleProps) => {
        const { index } = titleProps
        const { AccordionIndex } = this.state
        const newIndex = AccordionIndex === index ? -1 : index

        this.setState({ AccordionIndex: newIndex })
    }
    handleInputChange = (event) => {

        const target = event.target
        const value = target.value
        const name = target.name
        this.setState({
            [name]: value
        })
        // console.log(name, value);
    }
    handleChangeDropdown = (e, { value }) => {
        console.log(value)
        this.setState({
            selectedMRO: value
        })
    }
    handleHide = () => {
        this.setState({
            dimmerState: false,
            showModalPart: false,
            showModalMR: false,
            orderConfirmState: false,
            selectedPartUID: null,
            activeStep: 1,
            mrModalScreen: true,
            orModalScreen: true,
            mrModalRScreen: true,
            wstatus: null,
            warrantyTicketNo: null,
            selectedPartData: null,
            selectedMRData: null,
            selectedMRID: null,
            radioOption: null,
            selectedReplacePartUID: null,
            partReceivedStatus: false,
            showModalOrder: false,
            partReplacementStatus: false
        })
        this.fetchMaintenanceRequests();
        this.fetchOrderRequest();
        this.fetchpartsByAircraftID(this.state.selectedCardID)
        this.fetchWarrantyDetails();
    }
    // handleOnClickStepper = (step) => {
    //     this.setState({ activeStep: step });
    // }
    closeModal = () => {
        this.setState({
            showModalPart: false,
            showModalwarranty: false,
            showModalMR: false,
            selectedMRID: null,
            selectedOrderID: null,
            selectedPartUID: null,
            selectedPartData: null,
            selectedMRData: null,
            selectedWarrantyID: null,
            activeStep: 1,
            mrModalScreen: true,
            orModalScreen: true,
            mrModalRScreen: true,
            wstatus: null,
            warrantyTicketNo: null,
            mroName: null,
            showModalOrder: false,
            radioOption: null,
        })
    }
    modalGoBack = () => {
        this.setState({
            activeStep: 1,
            mrModalScreen: true,
            mrModalRScreen: true,
            maintenanceRequestNo: null,
            orModalScreen: true
        })
    }
    mrSecondScreen = () => {
        console.log(this.state.selectedPartUID)
        var tempmrno = this.generateMaintenanceNo(5);
        this.setState({
            maintenanceRequestNo: tempmrno,
            mrModalScreen: false,
            activeStep: 2,
        })

    }
    orSecondScreen = () => {
        this.setState({
            orModalScreen: false,
        })

    }
    mrReplaceSecondScreen = () => {
        this.setState({
            mrModalRScreen: false,
            activeStep: 2,
        })
        if (this.state.maintenanceStatus === "In-Progress") {
            this.fetchOrderDetailsByMID(this.state.selectedMRData.mRequestNumber)
        }

    }
    logout() {
        this.props.history.push("/");
        sessionStorage.clear();
    }

    render() {
        const steps = [{ title: '' }, { title: '' },]
        const HomePanes = [
            {
                menuItem: (
                    <Menu.Item key="aircraft" className='partTabIndex'>
                        Aircrafts
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            {
                menuItem: (
                    <Menu.Item key='mr' className='partTabIndex'>
                        Maintenance Request
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            {
                menuItem: (
                    <Menu.Item key='or' className='partTabIndex'>
                        Order Request
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            {
                menuItem: (
                    <Menu.Item key='wticket' className='partTabIndex'>
                        Warranty ticket
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            }]
        const partPanes = [
            {
                menuItem: (
                    <Menu.Item key="back" className='iconLeft'>
                        <Icon name='chevron left' size='big' onClick={this.goHome} />
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            },
            {
                menuItem: (
                    <Menu.Item key='parts' className='partTabIndexSecondary'>
                        {this.state.selectedCardID}
                    </Menu.Item>
                ), render: () => <Tab.Pane attached={false}></Tab.Pane>
            }]
        const MROoptions = [
            { key: 1, text: 'GA Telesis Engine Shop (GATES)', value: 'mro101' },
            { key: 2, text: 'AAR', value: 'mro102' },
            { key: 3, text: 'Lufthansa Technik', value: 'mro103' },
        ]
        let aircraftCardElement = this.state.aircraftData.map((Data) => {
            return <Cardcomponent key={Data.Record.aircraftID} elementType="plane.png" cardData={Data} clicked={() => this.handleCardSelection(Data.Record.aircraftID)} />
        })
        let orderCardElement = this.state.OrderReqData.map((Data) => {
            if (Data.Record.orderStatus === "Shipped") {
                var iclass = "yellowIcon"
            }
            else if (Data.Record.orderStatus === "In-Progress") {
                var iclass = "blueIcon"
            }
            else if (Data.Record.orderStatus === "Closed") {
                var iclass = "greenIcon"
            }
            return <Cardcomponent key={Data.Record.orderNumber} elementType="order" iconClass={iclass} cardData={Data} clicked={() => this.handleOrderSelection(Data.Record.orderNumber, Data.Record.orderStatus)} />
        }).reverse();
        let partsCardElement = this.state.partData.map((Data) => {
            return <Cardcomponent key={Data.Record.partUID} elementType="part.png" cardData={Data} clicked={() => this.handlePartSelection(Data.Record.partUID, Data.Record.warrantyStatus)} />
        }).reverse();
        let maintenanceCardElement = this.state.MaintenanceReqData.map((Data) => {
            if (Data.Record.mRequestStatus === "Open") {
                var iclass = "blueIcon"
            }
            else if (Data.Record.mRequestStatus === "In-Progress") {
                var iclass = "yellowIcon"
            }
            else if (Data.Record.mRequestStatus === "Closed") {
                var iclass = "greenIcon"
            }
            return <Cardcomponent key={Data.Key} elementType="maintenance" iconClass={iclass} cardData={Data} clicked={() => this.handleMRSelection(Data.Key, Data.Record.mRequestStatus)} />
        }).reverse();
        let warrantyCardElement = this.state.warrantyData.map((Data) => {
            if (Data.Record.ticketStatus === "Open") {
                var iclass = "blueIcon"
            }
            else if (Data.Record.ticketStatus === "In-Progress") {
                var iclass = "yellowIcon"
            }
            else if (Data.Record.ticketStatus === "Closed") {
                var iclass = "greenIcon"
            }
            return <Cardcomponent key={Data.Record.ticketNumber} elementType="warranty" iconClass={iclass} cardData={Data} clicked={() => this.handleWarrantySelection(Data.Record.ticketNumber)} />
        }).reverse();
        let ReplacePartCardElement = this.state.InventoryData.map((Data) => {
            return <Partcardcomponent key={Data.Record.partUID} elementType="provcard" selectedID={this.determineCSS(Data.Record.partUID)} cardData={Data} clicked={() => this.handleReplacePartSelection(Data.Record.partUID)} />
        }).reverse();
        let provenanceCardElement = this.state.InventoryData3rdParty.map((Data) => {
            return <Partcardcomponent key={Data.Record.partUID} elementType="provCard" selectedID={this.determineCSS(Data.Record.partUID)} cardData={Data} clicked={() => this.handle3rdPartSelection(Data.Record.partUID)} />
        }).reverse();
        let accordianCardElement = this.state.serviceData.map((Data, i) => {
            return <Accordion key={Data.Record.serviceNumber} index={i} activeIndex={this.state.AccordionIndex} cardData={Data} clicked={(e, titleProps) => this.handleClickAccordion(e, titleProps)} />
        }).reverse();
        if (this.state.loaderState) {
            aircraftCardElement = <Spinner />
            partsCardElement = <Spinner />
            maintenanceCardElement = <Spinner />
            warrantyCardElement = <Spinner />
            orderCardElement = <Spinner />
        }
        if (this.state.MaintenanceReqData.length === 0) {
            maintenanceCardElement = <Cardcomponent key="empty" elementType="empty" />
        }
        if (this.state.serviceData.length === 0) {
            accordianCardElement = <Accordion key="empty" elementType="empty" />
        }
        if (this.state.OrderReqData.length === 0) {
            orderCardElement = <Cardcomponent key="empty" elementType="empty" />
        }

        return (
            <div className="screens-background">
                <div className="homeheaderbar">
                    <Row className="width100">
                        <Col xs={12} md={3} className="logoBar">
                            <img src={logo} className="" width="" fluid="true" />
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
                <div >
                    <Row className="searchRow">
                        <Search
                            className="searchBar"
                            placeholder='Search...'
                        />
                    </Row>
                </div>
                {this.state.showAircraftComponent ?
                    <div className="homeContent" >
                        <Container className="header-navigation-bar">
                            <Tab className="header-tabs-items" activeIndex={this.state.homeTabIndex} menu={{ secondary: true, pointing: true }} renderActiveOnly={false} panes={HomePanes} onTabChange={(event, data) => this.switchTab(event, data)} />
                        </Container>
                        <Container className="listContentArea">
                            {(() => {
                                if (this.state.homeTabIndex == '0') {
                                    return (
                                        <section>
                                            {aircraftCardElement}
                                        </section>)
                                }
                                else if (this.state.homeTabIndex == '1') {
                                    return (
                                        <section>
                                            {maintenanceCardElement}
                                        </section>)
                                }
                                else if (this.state.homeTabIndex == '2') {
                                    return (
                                        <section>
                                            {orderCardElement}
                                        </section>)
                                }
                                else {
                                    return (
                                        <section>
                                            {warrantyCardElement}
                                        </section>)
                                }

                            })()}
                        </Container>
                    </div>
                    :
                    <div className="homeContent" >
                        <Container className="header-navigation-bar">
                            <Tab className="header-tabs-items" menu={{ secondary: true, pointing: true }} renderActiveOnly={false} panes={partPanes} />
                        </Container>
                        <Container className="listContentArea">
                            <section>
                                {partsCardElement}
                            </section>
                        </Container>

                        {this.state.selectedPartData != null ?
                            <div>
                                {this.state.dimmerState == true ?
                                    <Modal size='mini' open={this.state.dimmerState} >
                                        <Modal.Header>Maintenance Request Created!</Modal.Header>
                                        <div className="confirmModal">
                                            <Icon name='check circle outline' />
                                            Maintenance id: {this.state.maintenanceRequestNo}
                                            <br />
                                            {this.state.wstatus === "Active" ?
                                                <div><Icon name='check circle outline' />
                                                    Order ID : {this.state.orderRequestNo}
                                                </div>
                                                :
                                                <div></div>
                                            }
                                        </div>
                                        <Modal.Actions>
                                            <Button primary content='OK' onClick={this.handleHide} />
                                        </Modal.Actions>
                                    </Modal>
                                    :
                                    <Modal open={this.state.showModalPart} dimmer={"blurring"} >
                                        <Modal.Header>Maintenance Request</Modal.Header>
                                        {this.state.loaderState ?
                                            <Spinner /> :
                                            <div></div>}
                                        <div className="stepperclass">
                                            <Stepper
                                                steps={steps}
                                                activeStep={this.state.activeStep}
                                                showNumber={true}
                                            />
                                        </div>
                                        {this.state.mrModalScreen ?
                                            <Modal.Content>
                                                <div className="modalImage">
                                                    <Image wrapped size='small' src={PartsImage} />
                                                </div>
                                                <div className="modalContent">
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Part UID
                                                        </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            : {this.state.selectedPartData.partid}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Part No.
                                                        </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            : {this.state.selectedPartData.partNumber}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Part Name
                                                        </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            : {this.state.selectedPartData.partName}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Condition
                                                        </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            : {this.state.selectedPartData.partCondition}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    {this.state.wstatus === "Active" ?
                                                        <Grid.Row className="modalDesc">
                                                            <Grid.Column width={6} className="modaldescKeyColumn">
                                                                OEM
                                                            </Grid.Column>
                                                            <Grid.Column width={6} className="modaldescColumn">
                                                                : {this.state.selectedPartData.oemName}
                                                            </Grid.Column>
                                                        </Grid.Row>
                                                        :
                                                        <Grid.Row className="modalDesc">
                                                            <Grid.Column width={6} className="modaldescKeyColumn">
                                                                Supplier Name
                                                            </Grid.Column>
                                                            <Grid.Column width={6} className="modaldescColumn">
                                                                : {this.state.selectedPartData.supplierName}
                                                            </Grid.Column>
                                                        </Grid.Row>
                                                    }

                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Description
                                                        </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            : {this.state.selectedPartData.partDescription}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Warranty
                                                        </Grid.Column>
                                                        {this.state.wstatus === "Active" ?
                                                            <Grid.Column width={6} className="modaldescColumn warrantyGreen">
                                                                : {this.state.selectedPartData.warrantyStatus}
                                                            </Grid.Column>
                                                            :
                                                            <Grid.Column width={6} className="modaldescColumn warrantyRed">
                                                                : {this.state.selectedPartData.warrantyStatus}
                                                            </Grid.Column>
                                                        }
                                                    </Grid.Row>
                                                    {this.state.wstatus === "Active" ?
                                                        <Grid.Row className="modalDesc">
                                                            <Grid.Column width={6} className="modaldescKeyColumn">
                                                            </Grid.Column>
                                                            {(() => {
                                                                if (this.state.warrantyTicketNo === null) {
                                                                    return (
                                                                        <Grid.Column width={6} className="modaldescColumn ">
                                                                            <Button primary onClick={this.openWarrantyTicket}>
                                                                                Open Warranty Ticket
                                                                            </Button>
                                                                        </Grid.Column>
                                                                    )
                                                                } else if (this.state.warrantyloader === true && this.state.warrantyTicketNo === null) {
                                                                    return (
                                                                        <Grid.Column width={6} className="modaldescColumn ">
                                                                            <Dimmer active>
                                                                                <Loader />
                                                                            </Dimmer>
                                                                        </Grid.Column>
                                                                    )
                                                                }
                                                                else {
                                                                    return (
                                                                        <Grid.Column width={6} className="modaldescColumn  successOpened">
                                                                            Successfully Opened
                                                                        </Grid.Column>
                                                                    )
                                                                }
                                                            })()}
                                                        </Grid.Row>
                                                        :
                                                        <Grid.Row className="modalDesc"></Grid.Row>}

                                                    {this.state.warrantyTicketNo !== null ?
                                                        <Grid.Row className="modalDesc">
                                                            <Grid.Column width={6} className="modaldescKeyColumn">
                                                                Warranty Ticket No.
                                                            </Grid.Column>
                                                            <Grid.Column width={6} className="modaldescColumn warrantyGreen">
                                                                : {this.state.warrantyTicketNo}
                                                            </Grid.Column>
                                                        </Grid.Row>
                                                        :
                                                        <Grid.Row className="modalDesc">

                                                        </Grid.Row>
                                                    }

                                                </div>
                                            </Modal.Content>
                                            :

                                            <Modal.Content >
                                                <div className="modalImage">
                                                    <Image wrapped size='small' src={PartsImage} />
                                                </div>
                                                <div className="modalContent">
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Request No.
                                                    </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            : {this.state.maintenanceRequestNo}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    {this.state.warrantyTicketNo !== null ?
                                                        <Grid.Row className="modalDesc">
                                                            <Grid.Column width={6} className="modaldescKeyColumn">
                                                                Warranty Ticket No.
                                                    </Grid.Column>
                                                            <Grid.Column width={6} className="modaldescColumn">
                                                                : {this.state.warrantyTicketNo}
                                                            </Grid.Column>
                                                        </Grid.Row>
                                                        :
                                                        <Grid.Row></Grid.Row>}
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Part ID
                                                    </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            : {this.state.selectedPartData.partid}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Comments
                                                    </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :  <Form.Field
                                                                control={TextArea}
                                                                placeholder="Comments..."
                                                                required
                                                                name="MRcomments"
                                                                onChange={this.handleInputChange}
                                                                className="commentsmro"
                                                            />
                                                        </Grid.Column>

                                                    </Grid.Row>
                                                    {/* <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="mroKeyColumn">
                                                            MRO
                                                    </Grid.Column>
                                                        <Grid.Column className="mrodropdown">
                                                            : <Dropdown clearable
                                                                options={MROoptions}
                                                                onChange={this.handleChangeDropdown}
                                                                selection
                                                            />

                                                        </Grid.Column>

                                                    </Grid.Row> */}
                                                </div>
                                            </Modal.Content>
                                        }
                                        <Modal.Actions>
                                            {this.state.mrModalScreen ?
                                                <Button className="btn-cancel" onClick={this.closeModal}>
                                                    Cancel
                                                </Button>
                                                :
                                                <Button className="btn-cancel" onClick={this.modalGoBack}>
                                                    Back
                                                </Button>
                                            }
                                            {this.state.mrModalScreen ?
                                                <div className="maint-btn">
                                                    {this.state.maintenanceRequestNo == null ?
                                                        <Button primary onClick={this.mrSecondScreen}>
                                                            Generate Maintanence Request
                                                        </Button>
                                                        :
                                                        <Button>
                                                            Maintanence Request Opened
                                                        </Button>

                                                    }

                                                </div>

                                                :
                                                <Button primary onClick={this.openMaintenanceRequest}>
                                                    Submit Request
                                                </Button>
                                            }
                                        </Modal.Actions>

                                    </Modal>}
                            </div>
                            :
                            <div></div>
                        }

                    </div>
                }
                <div >
                    {this.state.selectedWarrantyData != null ?
                        <Modal open={this.state.showModalwarranty} dimmer={"blurring"} className="modal-stepperless" >
                            <Modal.Header>Warranty Details</Modal.Header>
                            <Modal.Content >
                                <div className="modalImage">
                                    <Image wrapped size='small' src={PartsImage} />
                                </div>
                                <div className="modalContent">
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Ticket No.
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedWarrantyID}
                                        </Grid.Column>
                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Warranty NO.
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedWarrantyData.warrantyNumber}
                                        </Grid.Column>
                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Part ID
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedWarrantyData.partUID}
                                        </Grid.Column>
                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Description
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedWarrantyData.ticketDescription}
                                        </Grid.Column>
                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Opened Date
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedWarrantyData.ticketOpenedDate}
                                        </Grid.Column>

                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Status
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn   ">
                                            : {this.state.selectedWarrantyData.ticketStatus}
                                        </Grid.Column>
                                    </Grid.Row>
                                </div>
                            </Modal.Content>
                            <Modal.Actions>
                                <Button className="btn-cancel" onClick={this.closeModal}>
                                    Cancel
                           </Button>
                            </Modal.Actions>
                        </Modal>
                        :
                        <div> </div>
                    }

                </div>
                <div>
                    {this.state.orderConfirmState === true ?
                        <Modal size='mini' open={this.state.orderConfirmState} >
                            <Modal.Header>Order Request Placed!</Modal.Header>
                            <div className="confirmModal">
                                <Icon name='check circle outline' />
                                Order id: {this.state.orderReplaceRequestNo}
                            </div>
                            <Modal.Actions>
                                <Button primary content='OK' onClick={this.handleHide} />
                            </Modal.Actions>
                        </Modal>
                        :
                        <div>
                            {this.state.partReplacementStatus === true ?
                                <Modal size='mini' open={this.state.partReplacementStatus} >
                                    <Modal.Header>Part Replaced!</Modal.Header>
                                    <div className="confirmModal">
                                        <Icon name='check circle outline' />
                                        New Part UID: {this.state.replacedPartUID}
                                        <br />
                                        <Icon name='check circle outline' />
                                        Replaced Date : {this.state.currentDate}
                                    </div>
                                    <Modal.Actions>
                                        <Button primary content='OK' onClick={this.handleHide} />
                                    </Modal.Actions>
                                </Modal>
                                :
                                <Modal open={this.state.showModalMR} dimmer={"blurring"}  >
                                    <Modal.Header>Maintanence Details</Modal.Header>
                                    {this.state.loaderState ?
                                        <Spinner /> :
                                        <div></div>}
                                    <div className="stepperclass">
                                        <Stepper
                                            steps={steps}
                                            activeStep={this.state.activeStep}
                                            showNumber={true}
                                        />
                                    </div>
                                    {this.state.mrModalRScreen ?
                                        <Modal.Content >
                                            <div className="modalImage">
                                                <Image wrapped size='small' src={PartsImage} />
                                            </div>
                                            {this.state.selectedMRData ?
                                                <div className="modalContent">
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Request No.
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.selectedMRData.mRequestNumber}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Part ID
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.selectedMRData.mPartID}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Part NO.
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.partUIDDetails.partNumber}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Date Created
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.selectedMRData.mRequestStartDate}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Comments
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.selectedMRData.mRequestDescription}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            MRO
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.mroName}
                                                        </Grid.Column>

                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Warranty Status
                                            </Grid.Column>
                                                        {this.state.partUIDDetails.warrantyStatus === "Expired" ?
                                                            <Grid.Column width={6} className="modaldescColumn warrantyRed">
                                                                : {this.state.partUIDDetails.warrantyStatus}
                                                            </Grid.Column>
                                                            :
                                                            <Grid.Column width={6} className="modaldescColumn warrantyGreen">
                                                                : {this.state.partUIDDetails.warrantyStatus}
                                                            </Grid.Column>
                                                        }
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Status
                                            </Grid.Column>
                                                        {this.state.maintenanceStatus === "Closed" ?
                                                            <Grid.Column width={6} className="modaldescColumn descColumnBlue warrantyGreen">
                                                                : {this.state.selectedMRData.mRequestStatus}
                                                            </Grid.Column>
                                                            :
                                                            <Grid.Column width={6} className="modaldescColumn descColumnBlue ">
                                                                : {this.state.selectedMRData.mRequestStatus}
                                                            </Grid.Column>
                                                        }
                                                    </Grid.Row>
                                                </div>
                                                :
                                                <div></div>}

                                        </Modal.Content>
                                        :

                                        <div className="modalContentMRO" >
                                            {this.state.maintenanceStatus != "In-Progress" ?
                                                <div>
                                                    <div>
                                                        <Radio
                                                            label='Search in Inventory'
                                                            name='radioGroup'
                                                            value='searchInventory'
                                                            checked={this.state.radioOption === 'searchInventory'}
                                                            onChange={this.handleChangeRadio}
                                                        />
                                                        <Radio
                                                            label='Order from 3rd Party'
                                                            name='radioGroup'
                                                            value='3rdParty'
                                                            checked={this.state.radioOption === '3rdParty'}
                                                            onChange={this.handleChangeRadio}
                                                        />
                                                    </div>

                                                    {(() => {
                                                        if (this.state.radioOption == "searchInventory") {
                                                            return (
                                                                <div className="productContentArea3rdParty">
                                                                <div className="productAreaLeft">
                                                                    <div className="productNameArea">
                                                                        <Grid className="partCardBoxSelected">
                                                                            <Grid.Row className="cardDesc">
                                                                                <Grid.Column width={6} className="descKeyColumn">
                                                                                    <Image
                                                                                        floated='left'
                                                                                        size='tiny'
                                                                                        src={require(`./images/part.png`)}
                                                                                    />
                                                                                </Grid.Column>
                                                                                <Grid.Column width={6} className="partColumn">
                                                                                    <Grid.Row className="partDetailRow">
                                                                                        {this.state.partUIDDetails.partNumber}
                                                                                    </Grid.Row>
                                                                                </Grid.Column>
                                                                            </Grid.Row>
                                                                        </Grid>
                                                                    </div>
                                                                    <div className="provenanceArea">
                                                                        {ReplacePartCardElement}
                                                                    </div>
                                                                </div>
                                                                <div className="productAreaRight">
                                                                    {accordianCardElement}
                                                                </div>
                                                            </div>
                                                            )
                                                        }
                                                        else if (this.state.radioOption == "3rdParty") {
                                                            return (
                                                                <div className="productContentArea3rdParty">
                                                                    <div className="productAreaLeft">
                                                                        <div className="productNameArea">
                                                                            <Grid className="partCardBoxSelected">
                                                                                <Grid.Row className="cardDesc">
                                                                                    <Grid.Column width={6} className="descKeyColumn">
                                                                                        <Image
                                                                                            floated='left'
                                                                                            size='tiny'
                                                                                            src={require(`./images/part.png`)}
                                                                                        />
                                                                                    </Grid.Column>
                                                                                    <Grid.Column width={6} className="partColumn">
                                                                                        <Grid.Row className="partDetailRow">
                                                                                            {this.state.partUIDDetails.partNumber}
                                                                                        </Grid.Row>
                                                                                    </Grid.Column>
                                                                                </Grid.Row>
                                                                            </Grid>
                                                                        </div>
                                                                        <div className="provenanceArea">
                                                                            {provenanceCardElement}
                                                                        </div>
                                                                    </div>
                                                                    <div className="productAreaRight">
                                                                        {accordianCardElement}
                                                                    </div>
                                                                </div>
                                                            )
                                                        }
                                                    })()}
                                                </div>
                                                :
                                                <div className="orderDetails">
                                                    <Grid.Row className="orderRow">
                                                        Order Details</Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Order No.
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.orderDataByUID.orderNumber}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Status
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.orderDataByUID.orderStatus}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Date Created
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.orderDataByUID.orderDate}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Condition
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :  {this.state.orderDataByUID.conditionType}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Part UID
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :  {this.state.orderDataByUID.partUID}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            Part No.
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :  {this.state.orderDataByUID.partNumber}
                                                        </Grid.Column>
                                                    </Grid.Row>
                                                    <Grid.Row className="modalDesc">
                                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                                            MRO
                                                              </Grid.Column>
                                                        <Grid.Column width={6} className="modaldescColumn">
                                                            :   {this.state.mroName}
                                                        </Grid.Column>

                                                    </Grid.Row>
                                                </div>
                                            }
                                        </div>
                                    }
                                    <Modal.Actions>
                                        {this.state.mrModalRScreen ?
                                            <Button className="btn-cancel" onClick={this.closeModal}>
                                                Cancel
                                </Button>
                                            :
                                            <Button className="btn-cancel" onClick={this.modalGoBack}>
                                                Back
                                </Button>
                                        }
                                        {this.state.mrModalRScreen ?
                                            <div className="maint-btn">
                                                {this.state.maintenanceStatus === "Closed" ?
                                                    <div></div>
                                                    :
                                                    <Button primary onClick={this.mrReplaceSecondScreen}>
                                                        Next
                                            </Button>
                                                }
                                            </div>
                                            :
                                            <div className="maint-btn">
                                                {(() => {
                                                    if (this.state.maintenanceStatus === "In-Progress") {
                                                        if (this.state.orderDataByUID.orderStatus === "Closed") {
                                                            return (<Button primary className="btn-cancel" onClick={this.replacePartByUID}>
                                                                Replace Part
                                                        </Button>)
                                                        }

                                                        else {
                                                            return (<Button primary className="btn-cancel" onClick={this.replacePartByUID} disabled>
                                                                Replace Part
                                                        </Button>)
                                                        }
                                                    }
                                                    else if (this.state.radioOption === "searchInventory") {
                                                        return (
                                                            <Button primary onClick={this.replacePartByUID}>
                                                                Replace Part
                                                    </Button>
                                                        )
                                                    }
                                                    else if (this.state.radioOption === "3rdParty") {
                                                        return (
                                                            <Button primary onClick={this.initReplaceOrderRequest}>
                                                                Submit Order
                                                    </Button>
                                                        )
                                                    }
                                                })()}
                                            </div>

                                        }

                                    </Modal.Actions>
                                </Modal>
                            }
                        </div>
                    }
                </div>
                {this.state.partReceivedStatus === true ?
                    <Modal size='mini' open={this.state.partReceivedStatus} >
                        <Modal.Header>Part Received</Modal.Header>
                        <div className="confirmModal">
                            <Icon name='check circle outline' />
                            Shipment ID: {this.state.shipmentID}
                            <br />
                            <Icon name='check circle outline' />
                            Received Date : {this.state.currentDate}
                        </div>
                        <Modal.Actions>
                            <Button primary content='OK' onClick={this.handleHide} />
                        </Modal.Actions>
                    </Modal>
                    :
                    <div>
                        {this.state.selectedOrderData != null ?
                            <Modal open={this.state.showModalOrder} dimmer={"blurring"} className="modal-stepperless" >
                                <Modal.Header>Order Details</Modal.Header>
                                <Modal.Content >
                                    {this.state.loaderState ?
                                        <Spinner /> :
                                        <div></div>}
                                    <div className="modalImage">
                                        <Image wrapped size='small' src={PartsImage} />
                                    </div>
                                    {this.state.orModalScreen ?
                                        <div className="modalContent">
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Order No.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.selectedOrderID}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Created Date
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.selectedOrderData.orderDate}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Aircraft Op.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : Delta
                                        </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Part NO.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.selectedOrderData.partNumber}
                                                </Grid.Column>

                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Part UID
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.selectedOrderData.partUID}
                                                </Grid.Column>

                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Status
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn   ">
                                                    : {this.state.selectedOrderData.orderStatus}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </div>
                                        :
                                        <div className="modalContent">
                                            <Modal.Header>Shipment Details</Modal.Header>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Shipment No.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.shipmentDataByOID.shipmentNumber}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Sender
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.shipmentDataByOID.shipmentSender}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Receiver
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.shipmentDataByOID.shipmentReceiver}
                                                </Grid.Column>
                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Order No.
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.shipmentDataByOID.orderNumber}
                                                </Grid.Column>

                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Date
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    : {this.state.shipmentDataByOID.shipmentStatusDate}
                                                </Grid.Column>

                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Comments
                                                    </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn">
                                                    :  {this.state.shipmentDataByOID.shipmentDescription}
                                                </Grid.Column>

                                            </Grid.Row>
                                            <Grid.Row className="modalDesc">
                                                <Grid.Column width={6} className="modaldescKeyColumn">
                                                    Shipment Status
                                                </Grid.Column>
                                                <Grid.Column width={6} className="modaldescColumn   ">
                                                    : {this.state.shipmentDataByOID.shipmentStatus}
                                                </Grid.Column>
                                            </Grid.Row>
                                        </div>
                                    }
                                </Modal.Content>
                                <Modal.Actions>
                                    {this.state.orModalScreen ?
                                        <Button className="btn-cancel" onClick={this.closeModal}>
                                            Cancel
                                                </Button>
                                        :
                                        <Button className="btn-cancel" onClick={this.modalGoBack}>
                                            Back
                                                </Button>
                                    }
                                    {this.state.orModalScreen ?
                                        <div className="maint-btn">
                                            {this.state.selectedOrderStatus != "Shipped" ?
                                                <Button primary onClick={this.orSecondScreen} disabled>
                                                    Next
                                             </Button>
                                                :
                                                <Button primary onClick={this.orSecondScreen} >
                                                    Next
                                             </Button>
                                            }
                                        </div>
                                        :
                                        <Button primary onClick={this.receivePartFromShipper} >
                                            Part Receive
                                            </Button>
                                    }

                                </Modal.Actions>
                            </Modal>
                            :
                            <div> </div>

                        }
                    </div>
                }
                {/* <div>
                    {this.state.selectedMRData != null ?
                        <Modal open={this.state.showModalMR} dimmer={"blurring"} className="modal-stepperless" >
                            <Modal.Header>Maintanence Details</Modal.Header>
                            <Modal.Content >
                                <div className="modalImage">
                                    <Image wrapped size='small' src={PartsImage} />
                                </div>
                                <div className="modalContent">
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Maintanence Request No.
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedMRID}
                                        </Grid.Column>
                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Part ID
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedMRData.mPartID}
                                        </Grid.Column>
                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Date
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedMRData.mRequestStartDate}
                                        </Grid.Column>
                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Comments
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.selectedMRData.mRequestDescription}
                                        </Grid.Column>
                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            MRO
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn">
                                            : {this.state.mroName}
                                        </Grid.Column>

                                    </Grid.Row>
                                    <Grid.Row className="modalDesc">
                                        <Grid.Column width={6} className="modaldescKeyColumn">
                                            Status
                                                </Grid.Column>
                                        <Grid.Column width={6} className="modaldescColumn   ">
                                            : {this.state.selectedMRData.mRequestStatus}
                                        </Grid.Column>
                                    </Grid.Row>
                                </div>
                            </Modal.Content>
                            <Modal.Actions>
                                <Button className="btn-cancel" onClick={this.closeModal}>
                                    Cancel
                                        </Button>
                            </Modal.Actions>
                        </Modal>
                        :
                        <div> </div>

                    }
                </div> */}


            </div>
        )
    }
}

export default aohome