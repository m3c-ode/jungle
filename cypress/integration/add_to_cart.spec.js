/// <reference types="cypress" />

context('Add to Cart', () => {
  beforeEach(() => {

    // uses env variables
    // cy.visit(Cypress.env("baseUrl"));

    // uses e2e baseUrl
    cy.visit("/");
  });
  it("should redirect to login form after clicking on add to cart", () => {
    cy.get('.products article')
      .first()
      .contains('Add')
      .click()
      .url()
      .should('include', 'login');

    cy.get('header').contains('Login');
  });

  it("after login, should show the cart in navbar", () => {
    cy.login('bob@morane.ca', '1111');
    cy.get('nav').contains('Cart');
  });

  it("should add 1 to cart after clicking on Add", () => {
    cy.login('bob@morane.ca', '1111');
    cy.get('.products article')
      .first()
      .contains('Add')
      .click();
    cy.get('nav').contains('Cart').should('contain', '1');
  });

});