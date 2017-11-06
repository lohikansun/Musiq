// Base code from react-dnd example: http://react-dnd.github.io/react-dnd/examples-sortable-simple.html
import React, { Component } from 'react'
import Container from './Container'

export default class SortableSimple extends Component {
    render() {
        return (
            <div>
                <h1>
                    Up Next:
                </h1>
                <Container />
            </div>
        )
    }
}
