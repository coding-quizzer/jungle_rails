/// <reference types="cypress" />

describe('jungle home page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('There are products on the page', () => {

    cy.get('.products article').should('be.visible');
    
  });

  it("There are 2 products on the page", () => {
    cy.get('.products article').should("have.length", 2);
  });
});