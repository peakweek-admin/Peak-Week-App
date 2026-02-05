const MODULE_PATHS = {
  'module-biomechanics': 'content/modules/01-biomechanics.md',
  'module-hypertrophy': 'content/modules/02-hypertrophy.md',
  'module-nutrition': 'content/modules/03-nutrition.md',
  'module-recovery': 'content/modules/04-recovery.md',
  'module-programming': 'content/modules/05-programming.md',
  'module-anatomy': 'content/modules/06-anatomy.md',
  'module-thermogenesis': 'content/modules/07-thermogenesis.md',
  'module-recovery-monitoring': 'content/modules/08-recovery-monitoring.md',
  'module-ergogenics': 'content/modules/09-ergogenics.md',
};

const moduleList = document.getElementById('module-list');
const lessonPreview = document.getElementById('lesson-preview');
const toggleThemeButton = document.getElementById('toggle-theme');
const modulesMenuToggle = document.getElementById('modules-menu-toggle');
const modulesMenuPanel = document.getElementById('module-menu-panel');
const modulesMenuClose = document.getElementById('modules-menu-close');
const modulesMenuBackdrop = document.getElementById('module-menu-backdrop');
const appRoot = document.querySelector('.app');

const completionKey = 'peak-week-completions';
const storedCompletion = JSON.parse(localStorage.getItem(completionKey) || '{}');

const applyTheme = (theme) => {
  document.documentElement.classList.toggle('dark', theme === 'dark');
  localStorage.setItem('theme', theme);
};

const storedTheme = localStorage.getItem('theme');
if (storedTheme) {
  applyTheme(storedTheme);
} else {
  applyTheme('light');
}

toggleThemeButton.addEventListener('click', () => {
  const isDark = document.documentElement.classList.contains('dark');
  applyTheme(isDark ? 'light' : 'dark');
});

const saveCompletion = (moduleId, isComplete) => {
  storedCompletion[moduleId] = isComplete;
  localStorage.setItem(completionKey, JSON.stringify(storedCompletion));
};

const setModulesMenuOpen = (isOpen) => {
  if (!appRoot) {
    return;
  }

  appRoot.classList.toggle('app--menu-open', isOpen);

  if (modulesMenuPanel) {
    modulesMenuPanel.hidden = !isOpen;
  }

  if (modulesMenuBackdrop) {
    modulesMenuBackdrop.hidden = !isOpen;
  }

  if (modulesMenuToggle) {
    modulesMenuToggle.setAttribute('aria-expanded', String(isOpen));
  }
};

if (modulesMenuToggle) {
  modulesMenuToggle.addEventListener('click', () => {
    const isOpen = appRoot.classList.contains('app--menu-open');
    setModulesMenuOpen(!isOpen);
  });
}

if (modulesMenuClose) {
  modulesMenuClose.addEventListener('click', () => {
    setModulesMenuOpen(false);
  });
}

if (modulesMenuBackdrop) {
  modulesMenuBackdrop.addEventListener('click', () => {
    setModulesMenuOpen(false);
  });
}

document.addEventListener('keydown', (event) => {
  if (event.key === 'Escape') {
    setModulesMenuOpen(false);
  }
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

    const status = document.createElement('span');
    status.className = storedCompletion[module.id] ? 'badge badge--complete' : 'badge';
    status.textContent = storedCompletion[module.id] ? 'Completed' : 'In progress';

    const button = document.createElement('button');
    button.textContent = 'Open module';
    button.addEventListener('click', () => loadModule(module));

    card.append(title, summary, meta, status, button);
    moduleList.append(card);
  });
};

const renderQuiz = (moduleId, quiz) => {
  if (!quiz || quiz.length === 0) {
    return '<p class="muted">No quiz available.</p>';
  }

  return quiz
    .map((item, index) => {
      const options = item.options
        .map(
          (option, optIndex) => `
            <label class="quiz-option">
              <input type="radio" name="quiz-${moduleId}-${index}" value="${optIndex}" />
              <span>${option}</span>
            </label>
          `
        )
        .join('');

      return `
        <div class="quiz-question" data-answer="${item.answer}" data-explanation="${item.explanation}">
          <h4>Question ${index + 1}</h4>
          <p>${item.question}</p>
          <div class="quiz-options">${options}</div>
          <p class="quiz-feedback muted"></p>
        </div>
      `;
    })
    .join('');
};

const evaluateQuiz = (container) => {
  const questions = container.querySelectorAll('.quiz-question');
  let correct = 0;

  questions.forEach((question) => {
    const answer = Number(question.dataset.answer);
    const explanation = question.dataset.explanation;
    const selected = question.querySelector('input:checked');
    const feedback = question.querySelector('.quiz-feedback');

    if (!selected) {
      feedback.textContent = 'Please choose an answer.';
      feedback.classList.add('error');
      return;
    }

    const chosen = Number(selected.value);
    if (chosen === answer) {
      correct += 1;
      feedback.textContent = `Correct. ${explanation}`;
      feedback.classList.remove('error');
    } else {
      feedback.textContent = `Not quite. ${explanation}`;
      feedback.classList.add('error');
    }
  });

  return { correct, total: questions.length };
};

const escapeHtml = (text) =>
  text
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;');

const formatInline = (text) =>
  text
    .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
    .replace(/\*(.*?)\*/g, '<em>$1</em>')
    .replace(/`(.*?)`/g, '<code>$1</code>');

const stripFrontmatter = (content) => {
  if (!content.startsWith('---')) {
    return content;
  }
  const endIndex = content.indexOf('\n---', 3);
  if (endIndex === -1) {
    return content;
  }
  return content.slice(endIndex + 4).trimStart();
};

const markdownToHtml = (sectionBody) => {
  const lines = sectionBody.split('\n');
  const output = [];
  let listOpen = false;

  lines.forEach((line) => {
    const trimmed = line.trim();

    if (trimmed.startsWith('### ')) {
      output.push(`<h4>${formatInline(escapeHtml(trimmed.slice(4)))}</h4>`);
      return;
    }

    if (trimmed.startsWith('- ')) {
      if (!listOpen) {
        output.push('<ul>');
        listOpen = true;
      }
      output.push(`<li>${formatInline(escapeHtml(trimmed.slice(2)))}</li>`);
      return;
    }

    if (listOpen) {
      output.push('</ul>');
      listOpen = false;
    }

    if (trimmed.startsWith('>')) {
      output.push(`<blockquote>${formatInline(escapeHtml(trimmed.slice(1).trim()))}</blockquote>`);
      return;
    }

    if (trimmed === '') {
      output.push('');
      return;
    }

    output.push(`<p>${formatInline(escapeHtml(trimmed))}</p>`);
  });

  if (listOpen) {
    output.push('</ul>');
  }

  return output.join('\n');
};

const renderContentSections = (content) => {
  const cleanedContent = stripFrontmatter(content);
  const sections = cleanedContent.split('\n## ').map((section, index) => {
    if (index === 0) {
      return { title: null, body: section.trim() };
    }
    const [titleLine, ...rest] = section.split('\n');
    return { title: titleLine.trim(), body: rest.join('\n').trim() };
  });

  return sections
    .map((section) => {
      if (!section.title) {
        return `<div class="content-body">${markdownToHtml(section.body)}</div>`;
      }

      return `
        <section class="content-section">
          <h3>${section.title}</h3>
          ${markdownToHtml(section.body)}
        </section>
      `;
    })
    .join('');
};

const removeQuizModal = () => {
  const existing = document.getElementById('quiz-modal');
  if (existing) {
    existing.remove();
  }
};

const setQuizOpen = (isOpen) => {
  const modal = document.getElementById('quiz-modal');
  if (!modal) {
    return;
  }
  modal.hidden = !isOpen;
  document.body.classList.toggle('is-quiz-open', isOpen);
};

const createQuizModal = (moduleId, moduleTitle, quiz) => {
  removeQuizModal();
  const quizMarkup = renderQuiz(moduleId, quiz);

  const modal = document.createElement('div');
  modal.id = 'quiz-modal';
  modal.className = 'quiz-modal';
  modal.hidden = true;
  modal.innerHTML = `
    <div class="quiz-modal__backdrop"></div>
    <div class="quiz-modal__panel" role="dialog" aria-modal="true" aria-label="${moduleTitle} test">
      <div class="quiz-modal__header">
        <div>
          <p class="eyebrow">Module test</p>
          <h3>${moduleTitle}</h3>
        </div>
        <button class="ghost" id="quiz-close">Close</button>
      </div>
      <div class="quiz-modal__body">
        ${quizMarkup}
      </div>
      <div class="quiz-modal__footer">
        <button id="check-answers">Check answers</button>
        <p id="quiz-score" class="muted"></p>
      </div>
    </div>
  `;
  document.body.append(modal);

  const closeButton = modal.querySelector('#quiz-close');
  const backdrop = modal.querySelector('.quiz-modal__backdrop');

  closeButton.addEventListener('click', () => setQuizOpen(false));
  backdrop.addEventListener('click', () => setQuizOpen(false));

  const quizButton = modal.querySelector('#check-answers');
  if (quizButton) {
    quizButton.addEventListener('click', () => {
      const results = evaluateQuiz(modal);
      const score = modal.querySelector('#quiz-score');
      score.textContent = `Score: ${results.correct} / ${results.total}`;
    });
  }
};

const loadModule = async (module) => {
  if (!module) {
    lessonPreview.innerHTML = '<p class="muted">Module not found.</p>';
    return;
  }

  try {
    const path = MODULE_PATHS[module.id];
    if (!path) {
      lessonPreview.innerHTML = '<p class="muted">Module content not found.</p>';
      return;
    }

    const [structureResponse, moduleResponse] = await Promise.all([
      fetch('../data/module-structure.json'),
      fetch(`../${path}`),
    ]);

    if (!structureResponse.ok || !moduleResponse.ok) {
      throw new Error('Unable to load module');
    }

    const structure = await structureResponse.json();
    const moduleStructure = structure[module.id];
    const content = await moduleResponse.text();

    const lessonList = moduleStructure
      ? moduleStructure.lessons
          .map(
            (lesson) => `
              <div class="outline-card">
                <h4>${lesson.title}</h4>
                <p class="muted">${lesson.summary}</p>
              </div>
            `
          )
          .join('')
      : '<p class="muted">No lesson list available.</p>';

    const quiz = moduleStructure ? moduleStructure.quiz : [];
    const contentMarkup = renderContentSections(content);

    lessonPreview.innerHTML = `
      <article class="lesson-article">
        <div class="lesson-header">
          <div>
            <h3>${module.title}</h3>
            <p class="muted">${module.summary}</p>
          </div>
          <div class="lesson-actions">
            <button class="ghost" id="mark-complete">
              ${storedCompletion[module.id] ? 'Mark incomplete' : 'Mark complete'}
            </button>
          </div>
        </div>
        <section class="lesson-section">
          <h4>Module outline</h4>
          <div class="lesson-outline">
            ${lessonList}
          </div>
        </section>
        <section class="lesson-section lesson-section--content">
          <h4>Module content</h4>
          <div class="lesson-content">
            ${contentMarkup}
          </div>
        </section>
        <div class="lesson-actions lesson-actions--footer">
          <button id="start-quiz">Start full-screen test</button>
        </div>
      </article>
    `;

    const markButton = document.getElementById('mark-complete');
    markButton.addEventListener('click', () => {
      const nextState = !storedCompletion[module.id];
      saveCompletion(module.id, nextState);
      markButton.textContent = nextState ? 'Mark incomplete' : 'Mark complete';
    });

    createQuizModal(module.id, module.title, quiz);
    const startQuizButton = document.getElementById('start-quiz');
    startQuizButton.addEventListener('click', () => {
      setQuizOpen(true);
    });

    setModulesMenuOpen(false);
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

document.addEventListener('keydown', (event) => {
  if (event.key === 'Escape') {
    setQuizOpen(false);
  }
});

loadCatalog();
