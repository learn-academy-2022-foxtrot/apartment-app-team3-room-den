import React from "react"
import { render } from "@testing-library/react"
import Home from "./Home"

describe("<Home />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<Home />, div)
  })
})
