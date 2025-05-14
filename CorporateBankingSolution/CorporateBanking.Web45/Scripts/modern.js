
// Modern AJAX implementation
const fetchData = async (url) => {
    try {
        const response = await fetch(url);
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Error:', error);
    }
};

// HTML5 Form validation
const validateForm = (form) => {
    const inputs = form.querySelectorAll('input[required]');
    return Array.from(inputs).every(input => input.validity.valid);
};
