import React from "react"
import { render } from "@testing-library/react"
import Header from "./Header"
import { BrowserRouter } from "react-router-dom"

describe("<Header />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(
      <BrowserRouter>
        <Header />
      </BrowserRouter>,
      div
    )
  })
})
