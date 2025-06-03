const { test, expect } = require('@playwright/test');

test.describe('Dashboard Modernized UI Regression Tests', () => {
  test('should capture baseline screenshot of dashboard_modernized.html', async ({ page }) => {
    await page.goto('http://localhost:8000/LegacySite/Pages/dashboard_modernized.html');
    
    await page.waitForLoadState('networkidle');
    
    await expect(page.locator('h1').first()).toContainText('Corporate Online');
    
    await expect(page.locator('.site-header')).toBeVisible();
    await expect(page.locator('.main-navigation')).toBeVisible();
    await expect(page.locator('.account-overview')).toBeVisible();
    await expect(page.locator('.corporate-accounts')).toBeVisible();
    
    await expect(page).toHaveScreenshot('dashboard_modernized_baseline.png', {
      fullPage: true,
      threshold: 0.2
    });
  });

  test('should verify interactive elements work correctly', async ({ page }) => {
    await page.goto('http://localhost:8000/LegacySite/Pages/dashboard_modernized.html');
    
    await page.waitForLoadState('networkidle');
    
    const panelHeader = page.locator('.panel-header');
    const panelContent = page.locator('#market-update-content');
    
    await expect(panelContent).toBeHidden();
    await expect(panelHeader).toHaveAttribute('aria-expanded', 'false');
    
    await panelHeader.click();
    
    await expect(panelContent).toBeVisible();
    await expect(panelHeader).toHaveAttribute('aria-expanded', 'true');
    
    await expect(page).toHaveScreenshot('dashboard_modernized_expanded_panel.png', {
      fullPage: true,
      threshold: 0.2
    });
    
    await panelHeader.click();
    
    await expect(panelContent).toBeHidden();
    await expect(panelHeader).toHaveAttribute('aria-expanded', 'false');
  });

  test('should verify page accessibility and semantic structure', async ({ page }) => {
    await page.goto('http://localhost:8000/LegacySite/Pages/dashboard_modernized.html');
    
    await page.waitForLoadState('networkidle');
    
    await expect(page.locator('header.site-header')).toBeVisible();
    await expect(page.locator('nav.main-navigation')).toBeVisible();
    await expect(page.locator('main.main-content')).toBeVisible();
    await expect(page.locator('aside.sidebar')).toBeVisible();
    await expect(page.locator('footer.site-footer')).toBeVisible();
    
    await expect(page.locator('[role="table"]')).toHaveCount(4); // Account balances, recent activities, corporate accounts, market data
    await expect(page.locator('[aria-label]')).toHaveCount(4); // Tables with aria-labels
    await expect(page.locator('[role="alert"]')).toBeVisible(); // System notice
    
    await expect(page.locator('th[scope="col"]')).toHaveCount(6); // Corporate accounts table headers
  });
});
