import React from "react"
import { render } from "@testing-library/react"
import ApartmentNew from "./ApartmentNew"

describe("<ApartmentNew />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<ApartmentNew />, div)
  })
})
