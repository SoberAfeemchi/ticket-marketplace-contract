;; title: ticketmarketplace
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; private functions
;;
(define-data-var last-token-id uint u0)
(define-non-fungible-token movie-ticket uint)
(define-public (mint (recipient principal))
    (let ((new-token-id (+ (var-get last-token-id) u1)))
  ;; The body of the let block starts here.
  ;; These lines are the required second argument.
    (try! (nft-mint? movie-ticket new-token-id recipient))
    (var-set last-token-id new-token-id)
    (ok true)
)
    
)
(define-public (transfer (id uint) (sender principal) (recipient principal))
    (begin
        (asserts! (is-eq tx-sender sender) (err u100))
        (try! (nft-transfer? movie-ticket id sender recipient))
        (ok true)
    )
)
(define-read-only (get-owner (id uint))
  (ok (nft-get-owner? movie-ticket id))
)   