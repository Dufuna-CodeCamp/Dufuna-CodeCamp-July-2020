import React from 'react';

const ClearButton = (props) => {
    return (
        <div className = "clear">
			<button 
            type = "button" 
            className = "btn clear" 
            aria-pressed = {true}
            onClick = {props.clear}
            >
                X Clear Completed
            </button>
		</div>
    );
};

export default ClearButton;