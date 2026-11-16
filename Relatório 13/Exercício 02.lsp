;; Exercicio 2 - O Scanner de 4546B

(defstruct criatura nome bioma profundidade perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a | bioma: ~a | profundidade: ~a m | perigo: ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list (make-criatura :nome "Peeper" :bioma "Safe Shallows"
                       :profundidade 10 :perigo :inofensiva)
        (make-criatura :nome "Stalker" :bioma "Kelp Forest"
                       :profundidade 40 :perigo :agressiva)
        (make-criatura :nome "Sand Shark" :bioma "Dunes"
                       :profundidade 100 :perigo :agressiva)
        (make-criatura :nome "Reaper Leviathan" :bioma "Crash Zone"
                       :profundidade 150 :perigo :leviata)))

(defun main ()
  (format t "== Catalogo completo ==~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))
  (format t "~%== Abaixo de 50 m ==~%")
  (let ((fundas (abaixo-de 50 *catalogo*)))
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "~%Total: ~a criaturas~%" (length fundas))))

(main)