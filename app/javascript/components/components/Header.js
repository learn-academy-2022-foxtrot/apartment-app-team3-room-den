import React from "react"
import Navigation from "./Navigation"

const Header = (props) => {
  return (
    <>
      <h1>Apartment App</h1>
      <Navigation {...props} />
    </>
  )
}

export default Header
