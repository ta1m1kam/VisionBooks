import React from "react"
import PropTypes from "prop-types"

class BooksForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: props.book.title,
      auther: props.book.auther,
    }
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleAutherChange = this.handleAutherChange.bind(this);
  }

  handleTitleChange(e) {
    this.setState({ title: e.target.value })
  }

  handleAutherChange(e) {
    this.setState({ auther: e.target.value })
  }

  render () {
    return (
      <React.Fragment>
        <div className="container">
          <form action="">
            <div className="form-group">
              <label htmlFor="selectPlace" className="bmd-label-floating">書籍場所</label>
              <select className="form-control" id="selectPlace" name="book[place_id]">
                <option value={this.props.places[0].id}>{this.props.places[0].name}</option>
                <option value={this.props.places[1].id}>{this.props.places[1].name}</option>
                <option value={this.props.places[2].id}>{this.props.places[2].name}</option>
              </select>
            </div>
            <div className="form-group">
              <label htmlFor="inputTitle" className="bmd-label-floating">タイトル</label>
              <input
                type="text"
                className="form-control"
                id="inputTitle"
                name="book[title]"
                value={this.state.title}
                onChange={this.handleTitleChange}
              />
              <span className="bmd-help">We'll never share your email with anyone else.</span>
            </div>
            <div className="form-group">
              <label htmlFor="inputAuthor" className="bmd-label-floating">著者</label>
              <input
                type="text"
                className="form-control"
                id="inputAuthor"
                name="book[auther]"
                value={this.state.auther}
                onChange={this.handleAutherChange}
              />
              <span className="bmd-help">We'll never share your email with anyone else.</span>
            </div>
            <button type="submit" className="btn btn-primary btn-raised">Submit</button>
          </form>
        </div>
      </React.Fragment>
    );
  }
}

BooksForm.propTypes = {
  book: PropTypes.object,
  places: PropTypes.array
};
export default BooksForm
