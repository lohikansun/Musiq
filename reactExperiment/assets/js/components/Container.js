// Base code from react-dnd example: http://react-dnd.github.io/react-dnd/examples-sortable-simple.html
import React, { Component } from 'react'
import update from 'immutability-helper'
import { DragDropContext } from 'react-dnd'
import HTML5Backend from 'react-dnd-html5-backend'
import Card from './Card'

const style = {
    width: 400,
}

@DragDropContext(HTML5Backend)
export default class Container extends Component {
    constructor(props) {
        super(props)
        this.moveCard = this.moveCard.bind(this)
        this.state = {
            cards: [
                {
                    id: 1,
                    text: 'Closer - Tegan & Sara',
                },
                {
                    id: 2,
                    text: 'Paris - Magic Man',
                },
                {
                    id: 3,
                    text: 'The Gambler - fun.',
                },
                {
                    id: 4,
                    text: 'Blood Red Blood - Voxtrot',
                },
                {
                    id: 5,
                    text:
                        'If So - Atlas Genius',
                },
                {
                    id: 6,
                    text: 'R U Mine? - Arctic Monkeys',
                },
                {
                    id: 7,
                    text: "What's My Age Again? - Blink 182",
                },
            ],
        }
    }

    moveCard(dragIndex, hoverIndex) {
        const { cards } = this.state
        const dragCard = cards[dragIndex]

        this.setState(
            update(this.state, {
                cards: {
                    $splice: [[dragIndex, 1], [hoverIndex, 0, dragCard]],
                },
            }),
        )
    }

    render() {
        const { cards } = this.state

        return (
            <div style={style}>
                {cards.map((card, i) => (
                    <Card
                        key={card.id}
                        index={i}
                        id={card.id}
                        text={card.text}
                        moveCard={this.moveCard}
                    />
                ))}
            </div>
        )
    }
}
