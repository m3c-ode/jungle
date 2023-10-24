/// <reference types="cypress" />

context('Home', () => {
  beforeEach(() => {

    // uses env variables
    // cy.visit(Cypress.env("baseUrl"));

    // uses e2e baseUrl
    cy.visit("/");
  });

  it("should display a list of products", () => {
    cy.get('.products')
      .children()
      // .debug()
      .should('have.length.greaterThan', 1);
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should display 2 products", () => {
    cy.get(".products article").should('have.length', 2);
  });
});