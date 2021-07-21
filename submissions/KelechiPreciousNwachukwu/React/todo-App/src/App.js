import React, { Component } from 'react';
import { nanoid } from 'nanoid';
import Todo from './components/Todo';
import Button from './components/Button';
import Form from './components/Form';
import ClearButton from './components/ClearButton';

const filter_functions = {
	All: () => true,
	Active: task => task.status === 'active',
	Completed: task => task.status === 'completed'
};

const filter_names = Object.keys(filter_functions);

class App extends Component {
	state = {
		tasks: this.props.tasks,
		filter: 'All'
	}

	render() {
		const tasks = this.state.tasks;

		const setFilter = (name) => {
			this.setState({
				filter: name
			})
		};

		const toggleCompleted = (id) => {
			const updatedTasks = tasks.map(task => {
				if (id === task.id) {
					const theStatus = task.status === 'active' ? 'completed' : 'active';
					return { ...task, status: theStatus }
				}

				return task;
			} )
			this.setState({
				tasks: updatedTasks
			})
		};

 		const tasklist = tasks
		 .filter(filter_functions[this.state.filter])
		 .map(task => {
			 return (
				<Todo id = {task.id} name = {task.name} status = {task.status} key = {task.id} toggleStatus = {toggleCompleted} />
			 )
		});

		const filterList = filter_names.map(name => {
			return (
				<Button 
				key = {name} 
				name = {name}
				isPressed = {name === this.state.filter}
				setFilter = {setFilter} />
			)
		});


		const addTask = (name) => {
			const newTask = { id: `todo-${nanoid()}`, name: name, status: 'active' };
			const theTasks = this.state.tasks
			this.setState({
				tasks: [ ...theTasks, newTask]
			});
		}

		const clearCompleted = () => {
			const updatedTasks = tasks.filter(task => task.status !== 'completed');

			this.setState({
				tasks: updatedTasks
			})
		};

		const activeTasks = tasks.filter(task => {
			return task.status === 'active';
		})
		const tasksNoun = activeTasks.length > 1 ? 'tasks' : 'task';
		const taskLeft = `${activeTasks.length} ${tasksNoun} left`;

		return (
			<div className = "todoapp">
				<h1>HOOPLA</h1>
				<Form addTask = {addTask} />
				<div className = "todo-container">
					<div className = "todo-list">
						<ul aria-labelledby = "list-heading">
							{tasklist}
						</ul>
	
						<div className = "todo-extras2 show">
							<h2 className = "list-number">
								{taskLeft}
							</h2>
							<ClearButton clear = {clearCompleted} />
						</div>
					</div>
					<div className = "todo-extras">
						<h2 className = "list-number">
							{taskLeft}
						</h2>
						<div className = "filters">
							{filterList}
						</div>
						<ClearButton clear = {clearCompleted} />
					</div>
				</div>
	
			</div>
		)
	}
	
}

export default App;
