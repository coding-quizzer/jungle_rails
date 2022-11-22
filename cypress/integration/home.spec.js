/// <reference types="cypress" />

describe('jungle home page', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('There are products on the page', () => {

    cy.get('.products article').should('be.be.visible')
    
  })
})