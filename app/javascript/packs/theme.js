/* global localStorage */
/* global matchMedia */

{
  const documentClassList = document.documentElement.classList;
  const themeKey = "theme";

  function setTheme(isDark) {
    const theme = isDark ? "dark" : "light";

    if (theme === "dark") {
      documentClassList.add("dark");
      documentClassList.remove("light");
    } else {
      documentClassList.add("light");
      documentClassList.remove("dark");
    }

    localStorage.setItem(themeKey, theme);
  }

  function useThemeSwitch(isDark) {
    const f = document.createDocumentFragment();
    const label = f.appendChild(document.createElement("label"));
    const text = "Toggle Theme";

    label.className = "relative inline-flex items-center cursor-pointer";
    label.insertAdjacentHTML("beforeend", `
      <input type="checkbox" value="" class="sr-only peer">
      <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
      <span class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300">${text}</span>`);

    const input = label.querySelector("input");

    input.checked = isDark;
    input.addEventListener("change", e => {
      setTheme(input.checked);
    });

    return f;
  }

  const currentTheme = localStorage.getItem(themeKey);
  const isDark = (null != currentTheme ? "dark" === currentTheme : matchMedia("(prefers-color-scheme: dark)").matches);

  setTheme(isDark);

  document.addEventListener("DOMContentLoaded", () => {
    const toggleThemeSwitch = document.getElementById("toggle-theme-switch");
    toggleThemeSwitch.appendChild(useThemeSwitch(isDark));
  });
}
