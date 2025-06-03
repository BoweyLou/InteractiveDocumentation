const { test, expect } = require('@playwright/test');

test('Visual regression for dashboard_modernized.html', async ({ page }) => {
  await page.goto('http://localhost:8000/LegacySite/Pages/dashboard_modernized.html');
  
  await page.waitForLoadState('networkidle');
  
  await page.waitForTimeout(1000);
  
  await expect(page).toHaveScreenshot('dashboard_modernized.png', {
    fullPage: true,
    threshold: 0.2
  });
});
