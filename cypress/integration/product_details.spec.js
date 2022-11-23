/// <reference types="cypress" />

describe('jungle products page', () => {
  
  beforeEach(() => {
    cy.visit('/');
  })

  it('User can navigate to products page by clicking one of the products', () => {
    cy.contains('Scented Blade').click()
    cy.contains('The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.')
  });

});