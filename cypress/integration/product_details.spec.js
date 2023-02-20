describe('Visit the home page of our Jungle App', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

	it("There is products on the page", () => {
		cy.get(".products article").should("be.visible");
	});

	it("There is 12 products on the page", () => {
		cy.get(".products article").should("have.length", 12);
	});

	it("users can navigate from the home page to the product detail page by clicking on a product", () => {
    cy.get(".products article").first().click();
		cy.url().should("include", "/products/");
		cy.get(".product-detail").should("be.visible");
  });

})