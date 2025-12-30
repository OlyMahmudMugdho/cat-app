const facts = [
    "Most ginger cats are male (about 80%!).",
    "They are often nicknamed 'marmalade' or 'orange tabby' cats.",
    "Ginger cats are known for being exceptionally vocal and friendly.",
    "The 'M' marking on their forehead is a classic trait of tabbies.",
    "Ginger is not a breed, but a coat color pattern!"
];

const btn = document.getElementById('fun-fact-btn');
const display = document.getElementById('fact-display');

btn.addEventListener('click', () => {
    // Pick a random fact from the array
    const randomIndex = Math.floor(Math.random() * facts.length);
    display.textContent = facts[randomIndex];
    
    // Add a little pop effect
    display.style.opacity = 0;
    setTimeout(() => {
        display.style.opacity = 1;
    }, 50);
});
