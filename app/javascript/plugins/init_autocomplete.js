// import the plugin
import places from 'places.js';

// create a function
const initAutocomplete = () => {
  const addressInput = document.getElementById('yogaclass_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

// export the function
export { initAutocomplete };
