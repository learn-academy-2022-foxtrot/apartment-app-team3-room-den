import React from "react"
import { render } from "@testing-library/react"
import ApartmentIndex from "./ApartmentIndex"

describe("<ApartmentIndex />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<ApartmentIndex />, div)
  })
})
