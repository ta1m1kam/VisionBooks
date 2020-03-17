import React from "react"
import PropTypes from "prop-types"

class RegisterBooks extends React.Component {
  render () {
    return (
      <React.Fragment>
        <h1>Book Name: {this.props.bookName}</h1>
      </React.Fragment>
    );
  }
}

RegisterBooks.propTypes = {
  bookName: PropTypes.string
};
export default RegisterBooks
