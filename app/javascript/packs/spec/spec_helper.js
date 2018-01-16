import Enzyme, { shallow, render, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

import requestAnimationFrame from './support/temp_polyfills';

Enzyme.configure({ adapter: new Adapter(), disableLifecycleMethods: true });

global.shallow = shallow;
global.render = render;
global.mount = mount;
