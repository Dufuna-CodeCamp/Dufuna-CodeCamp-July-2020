import React from 'react';

const Todo = (props) => {
    return (
        <li className = "todo">
            <div className = "todo-item">
                <label className = {props.status} htmlFor = {props.id}>{props.name}</label>
                <input 
                id = {props.id} 
                type = "checkbox" 
                onChange = { () => props.toggleStatus(props.id) }
                className = {props.status} />
            </div>
		</li>
    )
}

export default Todo;