import React from "react"
import { render } from "@testing-library/react"
import ApartmentShow from "./ApartmentShow"

describe("<ApartmentShow />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<ApartmentShow />, div)
  })
})
