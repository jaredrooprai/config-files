
import * as fs from 'fs';
import * as path from 'path';

const TEST_FOLDER = './tests'; // Change this to your Playwright test folder
const TEST_FILE_EXTENSIONS = ['.spec.ts', '.test.ts']; // Extensions to scan

/**
 * Reads all test files in a folder and extracts test names.
 */
function listPlaywrightTests(folderPath: string) {
  const files = fs.readdirSync(folderPath);

  for (const file of files) {
    const filePath = path.join(folderPath, file);
    
    // Check if the file has a valid test extension
    if (TEST_FILE_EXTENSIONS.some(ext => file.endsWith(ext))) {
      const fileContent = fs.readFileSync(filePath, 'utf8');
      const testNames = extractTestNames(fileContent);

      if (testNames.length > 0) {
        console.log(`\nFile: ${file}`);
        testNames.forEach(test => console.log(`  - ${test}`));
      }
    }
  }
}

/**
 * Extracts test names from a Playwright test file.
 * Supports: test('name', async () => {}), test.skip(), test.only(), test.describe()
 */
function extractTestNames(content: string): string[] {
  const testRegex = /(?:test|test\.only|test\.skip)\s*\(\s*['"`](.*?)['"`]/g;
  const testNames: string[] = [];
  let match;

  while ((match = testRegex.exec(content)) !== null) {
    testNames.push(match[1]);
  }

  return testNames;
}

// Run the script
listPlaywrightTests(TEST_FOLDER);
