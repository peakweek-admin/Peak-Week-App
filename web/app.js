const MODULE_PATHS = {
  'module-biomechanics': 'content/modules/01-biomechanics.md',
  'module-hypertrophy': 'content/modules/02-hypertrophy.md',
  'module-nutrition': 'content/modules/03-nutrition.md',
  'module-recovery': 'content/modules/04-recovery.md',
  'module-programming': 'content/modules/05-programming.md',
};

const moduleList = document.getElementById('module-list');
const lessonPreview = document.getElementById('lesson-preview');
const toggleThemeButton = document.getElementById('toggle-theme');

const applyTheme = (theme) => {
  document.documentElement.classList.toggle('light', theme === 'light');
  localStorage.setItem('theme', theme);
};

const storedTheme = localStorage.getItem('theme');
if (storedTheme) {
  applyTheme(storedTheme);
}

toggleThemeButton.addEventListener('click', () => {
  const isLight = document.documentElement.classList.contains('light');
  applyTheme(isLight ? 'dark' : 'light');
});

const renderModules = (modules) => {
  moduleList.innerHTML = '';

  modules.forEach((module) => {
    const card = document.createElement('div');
    card.className = 'module-card';

    const title = document.createElement('h3');
    title.textContent = module.title;

    const summary = document.createElement('p');
    summary.textContent = module.summary;

    const meta = document.createElement('div');
    meta.className = 'module-meta';
    meta.innerHTML = `
      <span>Level: ${module.level}</span>
      <span>~${module.estimated_minutes} min</span>
      <span>Topics: ${module.topics.join(', ')}</span>
    `;

    const button = document.createElement('button');
    button.textContent = 'Open module';
    button.addEventListener('click', () => loadModule(module.id, module.title));

    card.append(title, summary, meta, button);
    moduleList.append(card);
  });
};

const loadModule = async (moduleId, moduleTitle) => {
  const path = MODULE_PATHS[moduleId];
  if (!path) {
    lessonPreview.innerHTML = '<p class="muted">Module path not found.</p>';
    return;
  }

  try {
    const response = await fetch(`../${path}`);
    if (!response.ok) {
      throw new Error('Unable to load module');
    }
    const content = await response.text();
    lessonPreview.innerHTML = `<h3>${moduleTitle}</h3><pre>${content}</pre>`;
  } catch (error) {
    lessonPreview.innerHTML = '<p class="muted">Unable to load module content. Make sure you are running a local server.</p>';
  }
};

const loadCatalog = async () => {
  try {
    const response = await fetch('../data/catalog.json');
    if (!response.ok) {
      throw new Error('Unable to load catalog');
    }
    const catalog = await response.json();
    renderModules(catalog.modules);
  } catch (error) {
    moduleList.innerHTML = '<p class="muted">Unable to load catalog. Run the preview server from the repo root.</p>';
  }
};

loadCatalog();
