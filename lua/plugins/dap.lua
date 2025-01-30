return {
  'mfussenegger/nvim-dap',
  config = function()
    require("dap").adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = {os.getenv("HOME") .. "/js-debug/src/dapDebugServer.js", "${port}"},
      }
    }

    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

    require("dap").configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }

    require("dap").configurations.typescript = {
      {
        name = "Launch NestJS",
        type = "pwa-node",
        request = "launch",
        runtimeExecutable = "node",
        runtimeArgs = {"--inspect-brk", "./node_modules/.bin/nest", "start", "--watch"},
        port = 9229,
        sourceMaps = true,
        cwd = vim.fn.getcwd(),
        console = "integratedTerminal",
        protocol = "inspector",      }
    }
  end,
}
