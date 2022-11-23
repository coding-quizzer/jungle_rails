/// <reference types="cypress" />
describe ('jungle add product to cart', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('User can add a product to cart and the cart will contain gain an item', () => {
  cy.contains('My Cart (0)')
  cy.contains('Scented Blade')
    .scrollIntoView()
    .get('.products article')
    .contains('Add')
    .click({scrollBehavior: false});

  cy.contains('My Cart (1)')

  });
});
