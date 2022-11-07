import React from "react"
import { render, screen } from "@testing-library/react"
import ApartmentNew from "./ApartmentNew"
import { BrowserRouter } from "react-router-dom";


describe("<ApartmentNew />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<ApartmentNew />, div)
  })

  

  it ("has a form with entries for street, city, etc", () => {
    const div = document.createElement("div")
    render(<ApartmentNew />, div)
    const newStreet = screen.getByText("Street")
    screen.debug()
    expect(newStreet).toBeInTheDocument()
    
    const newCity = screen.getByText("City")
    screen.debug(newCity)
    expect(newCity).toBeInTheDocument()

  })

})
