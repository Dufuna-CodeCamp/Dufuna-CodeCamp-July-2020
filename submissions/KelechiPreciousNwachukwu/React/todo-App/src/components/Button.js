import React from 'react';

const Button = (props) => {
    const classname = () => {
        if (props.name === 'Active') return 'btn active';
        else if (props.name === 'Completed') return 'btn completed-button';

        return 'btn all';
    }

    return (
        <button 
        type = "button" 
        className = {classname()}
        aria-pressed = {props.isPressed}
        onClick = {() => props.setFilter(props.name)}
        >
			{props.name}
		</button>
    )
}

export default Button;