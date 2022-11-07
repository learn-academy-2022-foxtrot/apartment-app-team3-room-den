import React from "react"
import { Nav, NavItem, Button } from "reactstrap"
import { NavLink } from "react-router-dom"

const Navigation = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
}) => {
  return (
    <>
      <Nav>
        <NavItem>
          <Button>
            <NavLink to="/" className="nav-link">
              Home
            </NavLink>
          </Button>
        </NavItem>
        {logged_in && (
          <>
            <Button>
              <NavItem>
                <a href={sign_out_route} className="nav-link">
                  Sign Out
                </a>
              </NavItem>
            </Button>
            <Button>
              <NavLink to="/available-apartments" className="nav-link">
                My Listings
              </NavLink>
            </Button>
            <Button>
              <NavLink to="/available-apartments" className="nav-link">
                View Listings
              </NavLink>
            </Button>
            <Button>
              <NavLink to="/apartmentnew" className="nav-link">
                New Listing
              </NavLink>
            </Button>
          </>
        )}
        {!logged_in && (
          <NavItem>
            <a href={sign_in_route} className="nav-link">
              Sign In
            </a>
          </NavItem>
        )}
        {!logged_in && (
          <NavItem>
            <a href={new_user_route} className="nav-link">
              Sign Up
            </a>
          </NavItem>
        )}
      </Nav>
    </>
  )
}

export default Navigation
