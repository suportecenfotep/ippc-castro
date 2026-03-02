const menuItems = [
    {
        id: 1,
        label: 'AUTENTICAÇÃO',
        icon: 'fas fa-users',
        roles: ['Administrador', 'IT'],
        subItems: [
            { id: 1, path: '/admin/autenticacao/users', label: 'Utilizadores' }
        ]
    },
    {
        id: 2,
        label: 'TESOURARIA',
        icon: 'fas fa-cash-register',
        roles: ['Administrador', 'IT', 'Tesouraria'],
        subItems: [
            { id: 0, path: '/admin/finances/emolumento-preco', label: 'Emolumentos' },
            { id: 2, path: '/admin/finances/fluxo-de-caixa', label: 'Fluxo de Caixa' },
            { id: 3, path: '/admin/finances/despesas', label: 'Depesas' },
            { id: 4, path: '/admin/finances/devedores', label: 'Devedores' },
        ]
    },
    {
        id: 3,
        label: 'GERIR ALUNOS',
        icon: 'fas fa-user-graduate',
        roles: ['Administrador', 'IT', 'Secretaria', 'Tesouraria'],
        subItems: [
            { id: 1, path: '/admin/estudantes/lista-geral-estudantes', label: 'Estudantes' },
            { id: 2, path: '/admin/estudantes/matriculados', label: 'Matriculas' }
        ]
    },
    {
        id: 4,
        label: 'BIBLIOTECA',
        icon: 'fas fa-book',
        roles: ['Administrador', 'IT', 'Biblioteca'],
        subItems: [
            { id: 1, path: '/admin/biblioteca/livros', label: 'Acervo de Livros' },
            { id: 2, path: '/admin/biblioteca/emprestimos', label: 'Empréstimos' },
            { id: 3, path: '/admin/biblioteca/autores', label: 'Autores e Editoras' },
            { id: 4, path: '/admin/biblioteca/configuracoes', label: 'Configurações' }
        ]
    }
];

export default menuItems;