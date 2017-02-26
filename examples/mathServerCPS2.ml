(* THIS FILE IS GENERATED. *)
(* rmlc -i mathServerCPS2.rml  *)

open Implem_lco_ctrl_tree_record;;
type  operation
= Sum |  Rest |  Mult |  Exit ;;
let client =
      (function
        | ch0__val_rml_2  ->
            (function
              | (choice__val_rml_3: operation)  ->
                  (function
                    | (v1__val_rml_4: int)  ->
                        (function
                          | (v2__val_rml_5: int)  ->
                              ((function
                                 | ()  ->
                                     Lco_ctrl_tree_record.rml_signal
                                       (function
                                         | ch0_1__sig_6  ->
                                             Lco_ctrl_tree_record.rml_signal
                                               (function
                                                 | ch0_2__sig_7  ->
                                                     Lco_ctrl_tree_record.rml_seq
                                                       (Lco_ctrl_tree_record.rml_seq
                                                         (Lco_ctrl_tree_record.rml_seq
                                                           (Lco_ctrl_tree_record.rml_seq
                                                             (Lco_ctrl_tree_record.rml_seq
                                                               (Lco_ctrl_tree_record.rml_seq
                                                                 (Lco_ctrl_tree_record.rml_emit_val'
                                                                   ch0__val_rml_2
                                                                   (function
                                                                    | 
                                                                    ()  ->
                                                                    (choice__val_rml_3,
                                                                    ch0_1__sig_6)
                                                                    ))
                                                                 Lco_ctrl_tree_record.rml_pause)
                                                               (Lco_ctrl_tree_record.rml_emit_val'
                                                                 ch0_1__sig_6
                                                                 (function
                                                                   | 
                                                                   ()  ->
                                                                    (v1__val_rml_4,
                                                                    ch0_2__sig_7)
                                                                   )))
                                                             Lco_ctrl_tree_record.rml_pause)
                                                           (Lco_ctrl_tree_record.rml_emit_val'
                                                             ch0_2__sig_7
                                                             (function
                                                               | ()  ->
                                                                   v2__val_rml_5
                                                               )))
                                                         Lco_ctrl_tree_record.rml_pause)
                                                       (Lco_ctrl_tree_record.rml_await_one'
                                                         ch0_2__sig_7
                                                         (function
                                                           | x__val_rml_8  ->
                                                               Lco_ctrl_tree_record.rml_compute
                                                                 (function
                                                                   | 
                                                                   ()  ->
                                                                    Pervasives.print_endline
                                                                    (Pervasives.string_of_int
                                                                    x__val_rml_8)
                                                                   )
                                                           ))
                                                 )
                                         )
                                 ):
                                (_) Lco_ctrl_tree_record.process)
                          )
                    )
              )
        ) 
;;
let calculate =
      (function
        | c1__val_rml_10  ->
            (function
              | f__val_rml_11  ->
                  ((function
                     | ()  ->
                         Lco_ctrl_tree_record.rml_await_one'
                           c1__val_rml_10
                           (function
                             | (v1__val_rml_12, c2__val_rml_13)  ->
                                 Lco_ctrl_tree_record.rml_await_one'
                                   c2__val_rml_13
                                   (function
                                     | v2__val_rml_14  ->
                                         Lco_ctrl_tree_record.rml_compute
                                           (function
                                             | ()  ->
                                                 Lco_ctrl_tree_record.rml_expr_emit_val
                                                   c2__val_rml_13
                                                   (f__val_rml_11
                                                     v1__val_rml_12
                                                     v2__val_rml_14)
                                             )
                                     )
                             )
                     ):
                    (_) Lco_ctrl_tree_record.process)
              )
        ) 
;;
let rec mathServer =
          (function
            | ch0__val_rml_16  ->
                ((function
                   | ()  ->
                       Lco_ctrl_tree_record.rml_await_one'
                         ch0__val_rml_16
                         (function
                           | (choice__val_rml_17, c1__val_rml_18)  ->
                               Lco_ctrl_tree_record.rml_seq
                                 (Lco_ctrl_tree_record.rml_match
                                   (function | ()  -> choice__val_rml_17 )
                                   (function
                                     | Sum  ->
                                         Lco_ctrl_tree_record.rml_run
                                           (function
                                             | ()  ->
                                                 calculate
                                                   c1__val_rml_18
                                                   Pervasives.(+)
                                             )
                                     | Rest  ->
                                         Lco_ctrl_tree_record.rml_run
                                           (function
                                             | ()  ->
                                                 calculate
                                                   c1__val_rml_18
                                                   Pervasives.(-)
                                             )
                                     | Mult  ->
                                         Lco_ctrl_tree_record.rml_run
                                           (function
                                             | ()  ->
                                                 calculate
                                                   c1__val_rml_18
                                                   Pervasives.( * )
                                             )
                                     | Exit  -> Lco_ctrl_tree_record.rml_halt
                                     ))
                                 (Lco_ctrl_tree_record.rml_run
                                   (function
                                     | ()  -> mathServer ch0__val_rml_16 ))
                           )
                   ):
                  (_) Lco_ctrl_tree_record.process)
            ) 
;;
let main_v3 =
      ((function
         | ()  ->
             Lco_ctrl_tree_record.rml_signal
               (function
                 | ch0__sig_20  ->
                     Lco_ctrl_tree_record.rml_par
                       (Lco_ctrl_tree_record.rml_run
                         (function | ()  -> mathServer ch0__sig_20 ))
                       (Lco_ctrl_tree_record.rml_run
                         (function | ()  -> client ch0__sig_20 Mult 10 20 ))
                 )
         ):
        (_) Lco_ctrl_tree_record.process) 
;;
let () =
      Rml_machine.rml_exec
        ([])
        ((function
           | ()  -> Lco_ctrl_tree_record.rml_run (function | ()  -> main_v3 )
           ):
          (_) Lco_ctrl_tree_record.process) 
;;
exception InvalidEndpoint
;;
type 'a signalVal
= {  value: 'a ;   parityBit: bool ;   continuationChannel: 'a} ;;
let compare_and_swap =
      (function
        | r__val_rml_22  ->
            (function
              | v__val_rml_23  ->
                  (function
                    | w__val_rml_24  ->
                        if
                          Pervasives.(=)
                            (Pervasives.(!) r__val_rml_22) v__val_rml_23
                          then
                          (Pervasives.(:=) r__val_rml_22 w__val_rml_24; true)
                          else false
                    )
              )
        ) 
;;
let fresh =
      (function | u__val_rml_26  -> (u__val_rml_26, (Pervasives.ref true)) ) 
;;
let check =
      (function
        | r__val_rml_28  ->
            if Pervasives.not (compare_and_swap r__val_rml_28 true false)
              then Pervasives.raise InvalidEndpoint else ()
        ) 
;;
let send =
      (function
        | ch__val_rml_30  ->
            (function
              | v__val_rml_31  ->
                  (function
                    | contCh__val_rml_32  ->
                        ((function
                           | ()  ->
                               Lco_ctrl_tree_record.rml_seq
                                 (Lco_ctrl_tree_record.rml_compute
                                   (function
                                     | ()  ->
                                         check contCh__val_rml_32;
                                           Lco_ctrl_tree_record.rml_expr_emit_val
                                             ch__val_rml_30
                                             (v__val_rml_31,
                                              contCh__val_rml_32)
                                     ))
                                 Lco_ctrl_tree_record.rml_pause
                           ):
                          (_) Lco_ctrl_tree_record.process)
                    )
              )
        ) 
;;
let receive =
      (function
        | ch__val_rml_34  ->
            (function
              | pCont__val_rml_35  ->
                  ((function
                     | ()  ->
                         Lco_ctrl_tree_record.rml_await_one'
                           ch__val_rml_34
                           (function
                             | (x__val_rml_36, checkBit__val_rml_37)  ->
                                 Lco_ctrl_tree_record.rml_compute
                                   (function | ()  -> pCont__val_rml_35 )
                             )
                     ):
                    (_) Lco_ctrl_tree_record.process)
              )
        ) 
;;
let select =
      (function
        | ch__val_rml_39  ->
            (function
              | l__val_rml_40  ->
                  (function
                    | contCh__val_rml_41  ->
                        ((function
                           | ()  ->
                               Lco_ctrl_tree_record.rml_seq
                                 (Lco_ctrl_tree_record.rml_compute
                                   (function
                                     | ()  ->
                                         check contCh__val_rml_41;
                                           Lco_ctrl_tree_record.rml_expr_emit_val
                                             ch__val_rml_39
                                             (l__val_rml_40,
                                              contCh__val_rml_41)
                                     ))
                                 Lco_ctrl_tree_record.rml_pause
                           ):
                          (_) Lco_ctrl_tree_record.process)
                    )
              )
        ) 
;;
let branch =
      (function
        | ch__val_rml_43  ->
            (function
              | pCont__val_rml_44  ->
                  ((function
                     | ()  ->
                         Lco_ctrl_tree_record.rml_await_one'
                           ch__val_rml_43
                           (function
                             | (x__val_rml_45, checkBit__val_rml_46)  ->
                                 Lco_ctrl_tree_record.rml_compute
                                   (function | ()  -> pCont__val_rml_44 )
                             )
                     ):
                    (_) Lco_ctrl_tree_record.process)
              )
        ) 
;;
