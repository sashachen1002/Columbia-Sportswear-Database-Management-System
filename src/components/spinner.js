import React from 'react' ;
import { Dimmer, Loader } from 'semantic-ui-react';

const spinner = () => (
    <Dimmer active>
    <Loader className='workaround' size='big'>Loading...</Loader>
</Dimmer>
);

export default spinner;