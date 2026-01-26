// Assume to have the Pthread implementation of mutexes (binary semaphores)
// available through the following functions: ● int pthread mutex init (pthread
// mutex t *mutex, const pthread mutexattr t *attr); ● int pthread mutex lock
// (pthread mutex t *mutex); ● int pthread mutex unlock (pthread mutex t
// *mutex); Show how it's possible to implement a counting semaphore (i.e.,
// non-binary) whose initial value is equal to count. Hint: Recall the
// "original" implementations of the signal and wait primitives and their use of
// a counting variable. Soluzione. Solution.
typedef struct {
  int count;            /* the counter */
  pthread_mutex_t lock; /* mutex ensuring exclusive access to count */
  pthread_mutex_t s;    /* real semaphore */
} Semaphore;
static void semaphore_init(Semaphore *s, int i) {
  pthread_mutex_init(&s->lock, NULL);
  pthread_mutex_init(&s->s, NULL);
  pthread_mutex_lock(&s->s);
  s->count = i;
}
static void semaphore_wait(Semaphore *s) {
  pthread_mutex_lock(&s->lock);
  s->count--;
  if (s->count < 0) {
    pthread_mutex_unlock(&s->lock);
    pthread_mutex_lock(&s->s);
  } else
    pthread_mutex_unlock(&s->lock);
}
static void semaphore_signal(Semaphore *s) {
  pthread_mutex_lock(&s->lock);
  s->count++;
  if (s->count <= 0)
    pthread_mutex_unlock(&s->s);
  pthread_mutex_unlock(&s->lock);
}
