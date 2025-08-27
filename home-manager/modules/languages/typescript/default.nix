{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Node.js and package managers
    nodejs_20        # Latest LTS Node.js (includes npm)
    yarn             # Yarn package manager
    pnpm             # pnpm package manager
    
    # TypeScript toolchain
    typescript                 # TypeScript compiler
    nodePackages.ts-node      # TypeScript execution environment
    
    # Development tools
    nodePackages.prettier     # Code formatter
    nodePackages.eslint       # JavaScript/TypeScript linter
    nodePackages.typescript-language-server  # LSP server
    
    # Build tools
    nodePackages.webpack      # Module bundler
    esbuild                   # Fast bundler/minifier (standalone package)
    
    # Utilities
    nodePackages.nodemon      # Auto-restart tool
    nodePackages.concurrently # Run multiple commands
  ];

  # Optional: Set up shell aliases for common TypeScript tasks
  home.shellAliases = {
    tsc = "npx tsc";
    ts-node = "npx ts-node";
    prettier = "npx prettier";
    eslint = "npx eslint";
  };

  # Optional: Configure environment variables
  home.sessionVariables = {
    # Ensure npm global packages are in PATH
    NPM_CONFIG_PREFIX = "${config.home.homeDirectory}/.npm-global";
  };

  # Optional: Add npm global bin to PATH
  home.sessionPath = [
    "${config.home.homeDirectory}/.npm-global/bin"
  ];

  # Optional: Create a basic TypeScript project structure
  home.file = {
    # Basic tsconfig.json
    ".config/typescript/tsconfig.json".text = ''
      {
        "compilerOptions": {
          "target": "ES2022",
          "module": "ESNext",
          "moduleResolution": "node",
          "strict": true,
          "esModuleInterop": true,
          "skipLibCheck": true,
          "forceConsistentCasingInFileNames": true,
          "declaration": true,
          "outDir": "./dist",
          "rootDir": "./src"
        },
        "include": ["src/**/*"],
        "exclude": ["node_modules", "dist"]
      }
    '';
    
    # Basic .eslintrc.json
    ".config/typescript/.eslintrc.json".text = ''
      {
        "env": {
          "node": true,
          "es2022": true
        },
        "extends": [
          "eslint:recommended",
          "@typescript-eslint/recommended"
        ],
        "parser": "@typescript-eslint/parser",
        "parserOptions": {
          "ecmaVersion": "latest",
          "sourceType": "module"
        },
        "plugins": ["@typescript-eslint"],
        "rules": {}
      }
    '';
    
    # Basic .prettierrc
    ".config/typescript/.prettierrc".text = ''
      {
        "semi": true,
        "trailingComma": "es5",
        "singleQuote": true,
        "printWidth": 80,
        "tabWidth": 2
      }
    '';
  };
}
