import { test, expect } from '@playwright/test';

test.describe('Investor Data Table', () => {
    // Test for the page loading and rendering investors table
    test('should load and display investors', async ({ page }) => {
        // Go to the page where the component is rendered
        await page.goto('http://localhost:50148'); // Change the URL if needed

        // Wait for the investor grid to load
        await page.waitForSelector('.ag-center-cols-container .ag-row'); // Ensure grid is rendered
        const investorRows = await page.locator('.ag-center-cols-container .ag-row');
        await expect(investorRows).toHaveCount(3); // Assuming there are 3 rows, adjust as needed

        // Verify table headers
        await expect(page.locator('th[aria-colid="investorName"]')).toHaveText('Investor Name');
        await expect(page.locator('th[aria-colid="investorType"]')).toHaveText('Investor Type');
        await expect(page.locator('th[aria-colid="investorCountry"]')).toHaveText('Country');
        await expect(page.locator('th[aria-colid="totalCommitment"]')).toHaveText('Commitment Summary');
    });

    // Test clicking an investor row triggers API call and updates the breakdown table
    test('should show breakdown when investor row is clicked', async ({ page }) => {
        // Go to the page where the component is rendered
        await page.goto('http://localhost:50148'); // Adjust URL if needed

        // Mock the fetch request for breakdown data
        await page.route('/api/investorBreakdown*', async route => {
            const mockData = {
                data: [
                    {
                        id: 1,
                        investorId: 101,
                        commitmentassetclass: 'Equity',
                        commitmentamount: 100000,
                        commitmentcurrency: 'GBP',
                    },
                    {
                        id: 2,
                        investorId: 101,
                        commitmentassetclass: 'Debt',
                        commitmentamount: 50000,
                        commitmentcurrency: 'GBP',
                    },
                ],
            };
            route.fulfill({
                status: 200,
                body: JSON.stringify(mockData),
            });
        });

        // Click on the first row in the investor grid
        const firstInvestorRow = page.locator('.ag-center-cols-container .ag-row').first();
        await firstInvestorRow.click();

        // Wait for the breakdown table to load
        await page.waitForSelector('.ag-center-cols-container .ag-row'); // Ensure breakdown rows are loaded

        // Check that the breakdown grid gets populated with the mocked data
        const breakdownRows = page.locator('.ag-center-cols-container .ag-row');
        await expect(breakdownRows).toHaveCount(2); // Two rows based on the mock data

        // Verify breakdown table data
        await expect(page.locator('td[aria-colid="commitmentassetclass"]')).toHaveText('Equity');
        await expect(page.locator('td[aria-colid="commitmentamount"]')).toHaveText('100000');
    });

    // Test if subtotals table updates after breakdown data is populated
    test('should show subtotals after investor breakdown', async ({ page }) => {
        // Go to the page
        await page.goto('http://localhost:50148'); // Adjust URL if needed

        // Mock the API calls as before
        await page.route('/api/investorBreakdown*', async route => {
            const mockData = {
                data: [
                    {
                        id: 1,
                        investorId: 101,
                        commitmentassetclass: 'Equity',
                        commitmentamount: 100000,
                        commitmentcurrency: 'GBP',
                    },
                    {
                        id: 2,
                        investorId: 101,
                        commitmentassetclass: 'Debt',
                        commitmentamount: 50000,
                        commitmentcurrency: 'GBP',
                    },
                ],
            };
            route.fulfill({
                status: 200,
                body: JSON.stringify(mockData),
            });
        });

        // Click on the first investor row
        const firstInvestorRow = page.locator('.ag-center-cols-container .ag-row').first();
        await firstInvestorRow.click();

        // Wait for the subtotals to be rendered (i.e., the subtotals table should be visible)
        await page.waitForSelector('tbody tr'); // Wait for rows to appear in the subtotals table

        // Verify the total commitment amounts
        await expect(page.locator('tbody tr:nth-child(1) td:nth-child(1)')).toHaveText('Equity');
        await expect(page.locator('tbody tr:nth-child(1) td:nth-child(2)')).toHaveText('100000.00 GBP');
    });
});
