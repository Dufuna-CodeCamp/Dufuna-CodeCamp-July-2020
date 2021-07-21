import React, { Component } from 'react';

class Form extends Component {
    state = {
        inputText: ''
    }

    handleSubmit = (e) => {
        e.preventDefault();

        if (this.state.inputText !== '') {
            this.props.addTask(this.state.inputText);
            this.setState({
                inputText: ''
            })
        }
    }

    render() {
        return (
            <form onSubmit = {this.handleSubmit}>
				<input 
                type = "text" 
                className = "input-todo"
                name = "todo" 
                placeholder = "Create a new todo..." 
                autoComplete = "off"
                value = {this.state.inputText}
                onChange = {e => this.setState({ inputText: e.target.value})} />
				<button type = "submit" className = "btn-submit">+</button>
			</form>
        )
    }
}

export default Form;