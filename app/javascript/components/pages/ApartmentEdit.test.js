import React from "react"
import { render } from "@testing-library/react"
import ApartmentEdit from "./ApartmentEdit"

describe("<ApartmentEdit />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<ApartmentEdit />, div)
  })
})
