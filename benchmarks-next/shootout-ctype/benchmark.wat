(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i64 i32) (result i64)))
  (type (;6;) (func (param i32 i32) (result i32)))
  (type (;7;) (func (param i64 i32) (result i32)))
  (type (;8;) (func (param i32 i32)))
  (type (;9;) (func (param i32 i32 i32)))
  (type (;10;) (func (param i32 i32 i32 i32)))
  (type (;11;) (func (param i32 i32 i32 i32 i32)))
  (type (;12;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;15;) (func (param i32 f64 i32 i32 i32 i32) (result i32)))
  (type (;16;) (func (param i64 i32 i32) (result i32)))
  (import "bench" "start" (func $bench_start (type 3)))
  (import "bench" "end" (func $bench_end (type 3)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__wasi_proc_exit (type 2)))
  (import "wasi_snapshot_preview1" "fd_write" (func $__wasi_fd_write (type 12)))
  (func $__wasm_call_ctors (type 3)
    nop)
  (func $__original_main (type 4) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 50000
    call $dlmalloc
    local.tee 2
    i32.store offset=28
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 2
    i32.const 120
    i32.const 49999
    call $memset
    i32.const 0
    i32.store8 offset=49999
    local.get 0
    i64.const 4294967346000
    i64.store offset=16
    i32.const 1024
    local.get 0
    i32.const 16
    i32.add
    call $iprintf
    drop
    call $bench_start
    loop  ;; label = @1
      local.get 0
      i32.const 28
      i32.add
      i32.const 1616
      i32.load
      call_indirect (type 2)
      i32.const 0
      local.set 3
      loop  ;; label = @2
        local.get 0
        local.get 0
        i32.load offset=24
        local.get 0
        i32.load offset=28
        local.get 3
        i32.add
        local.tee 2
        i32.load8_u
        call $isalpha
        i32.add
        local.tee 1
        i32.store offset=24
        local.get 0
        local.get 2
        i32.load8_u
        call $isalnum
        local.get 1
        i32.add
        local.tee 1
        i32.store offset=24
        local.get 0
        local.get 1
        local.get 2
        i32.load8_u
        i32.const -48
        i32.add
        i32.const 10
        i32.lt_u
        i32.add
        local.tee 1
        i32.store offset=24
        local.get 0
        local.get 2
        i32.load8_u
        call $isspace
        local.get 1
        i32.add
        local.tee 1
        i32.store offset=24
        local.get 0
        local.get 2
        i32.load8_u
        call $isprint
        local.get 1
        i32.add
        i32.store offset=24
        block  ;; label = @3
          local.get 2
          block (result i32)  ;; label = @4
            local.get 2
            i32.load8_u
            local.tee 1
            call $isupper
            if  ;; label = @5
              local.get 1
              call $tolower
              br 1 (;@4;)
            end
            local.get 1
            call $islower
            i32.eqz
            br_if 1 (;@3;)
            local.get 1
            call $toupper
          end
          local.tee 1
          i32.store8
        end
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.const 50000
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.const 1000
      i32.ne
      br_if 0 (;@1;)
    end
    call $bench_end
    local.get 0
    local.get 0
    i32.load offset=28
    i32.store
    i32.const 1079
    local.get 0
    call $iprintf
    drop
    local.get 0
    i32.load offset=28
    call $dlfree
    local.get 0
    i32.const 24
    i32.add
    i32.const 1616
    i32.load
    call_indirect (type 2)
    local.get 0
    i32.const 32
    i32.add
    global.set 0
    i32.const 0)
  (func $_black_box (type 2) (param i32)
    nop)
  (func $_start (type 3)
    call $__wasm_call_ctors
    call $__original_main
    call $exit
    unreachable)
  (func $isalpha (type 0) (param i32) (result i32)
    local.get 0
    i32.const 32
    i32.or
    i32.const -97
    i32.add
    i32.const 26
    i32.lt_u)
  (func $isspace (type 0) (param i32) (result i32)
    local.get 0
    i32.const 32
    i32.eq
    local.get 0
    i32.const -9
    i32.add
    i32.const 5
    i32.lt_u
    i32.or)
  (func $islower (type 0) (param i32) (result i32)
    local.get 0
    i32.const -97
    i32.add
    i32.const 26
    i32.lt_u)
  (func $isprint (type 0) (param i32) (result i32)
    local.get 0
    i32.const -32
    i32.add
    i32.const 95
    i32.lt_u)
  (func $tolower (type 0) (param i32) (result i32)
    local.get 0
    i32.const 32
    i32.or
    local.get 0
    local.get 0
    call $isupper
    select)
  (func $isupper (type 0) (param i32) (result i32)
    local.get 0
    i32.const -65
    i32.add
    i32.const 26
    i32.lt_u)
  (func $toupper (type 0) (param i32) (result i32)
    local.get 0
    i32.const 95
    i32.and
    local.get 0
    local.get 0
    call $islower
    select)
  (func $isdigit (type 0) (param i32) (result i32)
    local.get 0
    i32.const -48
    i32.add
    i32.const 10
    i32.lt_u)
  (func $isalnum (type 0) (param i32) (result i32)
    (local i32)
    i32.const 1
    local.set 1
    local.get 0
    call $isalpha
    i32.eqz
    if  ;; label = @1
      local.get 0
      call $isdigit
      i32.const 0
      i32.ne
      local.set 1
    end
    local.get 1)
  (func $__errno_location (type 4) (result i32)
    i32.const 2016)
  (func $dlmalloc (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 12
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.const 244
                            i32.le_u
                            if  ;; label = @13
                              i32.const 2020
                              i32.load
                              local.tee 6
                              i32.const 16
                              local.get 0
                              i32.const 11
                              i32.add
                              i32.const -8
                              i32.and
                              local.get 0
                              i32.const 11
                              i32.lt_u
                              select
                              local.tee 4
                              i32.const 3
                              i32.shr_u
                              local.tee 1
                              i32.shr_u
                              local.tee 0
                              i32.const 3
                              i32.and
                              if  ;; label = @14
                                local.get 0
                                i32.const -1
                                i32.xor
                                i32.const 1
                                i32.and
                                local.get 1
                                i32.add
                                local.tee 4
                                i32.const 3
                                i32.shl
                                local.tee 3
                                i32.const 2068
                                i32.add
                                i32.load
                                local.tee 1
                                i32.const 8
                                i32.add
                                local.set 0
                                block  ;; label = @15
                                  local.get 1
                                  i32.load offset=8
                                  local.tee 2
                                  local.get 3
                                  i32.const 2060
                                  i32.add
                                  local.tee 3
                                  i32.eq
                                  if  ;; label = @16
                                    i32.const 2020
                                    local.get 6
                                    i32.const -2
                                    local.get 4
                                    i32.rotl
                                    i32.and
                                    i32.store
                                    br 1 (;@15;)
                                  end
                                  i32.const 2036
                                  i32.load
                                  drop
                                  local.get 2
                                  local.get 3
                                  i32.store offset=12
                                  local.get 3
                                  local.get 2
                                  i32.store offset=8
                                end
                                local.get 1
                                local.get 4
                                i32.const 3
                                i32.shl
                                local.tee 2
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 1
                                local.get 2
                                i32.add
                                local.tee 1
                                local.get 1
                                i32.load offset=4
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                br 13 (;@1;)
                              end
                              local.get 4
                              i32.const 2028
                              i32.load
                              local.tee 9
                              i32.le_u
                              br_if 1 (;@12;)
                              local.get 0
                              if  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  local.get 1
                                  i32.shl
                                  i32.const 2
                                  local.get 1
                                  i32.shl
                                  local.tee 0
                                  i32.const 0
                                  local.get 0
                                  i32.sub
                                  i32.or
                                  i32.and
                                  local.tee 0
                                  i32.const 0
                                  local.get 0
                                  i32.sub
                                  i32.and
                                  i32.const -1
                                  i32.add
                                  local.tee 0
                                  local.get 0
                                  i32.const 12
                                  i32.shr_u
                                  i32.const 16
                                  i32.and
                                  local.tee 0
                                  i32.shr_u
                                  local.tee 1
                                  i32.const 5
                                  i32.shr_u
                                  i32.const 8
                                  i32.and
                                  local.tee 2
                                  local.get 0
                                  i32.or
                                  local.get 1
                                  local.get 2
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 2
                                  i32.shr_u
                                  i32.const 4
                                  i32.and
                                  local.tee 1
                                  i32.or
                                  local.get 0
                                  local.get 1
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 1
                                  i32.shr_u
                                  i32.const 2
                                  i32.and
                                  local.tee 1
                                  i32.or
                                  local.get 0
                                  local.get 1
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 1
                                  i32.shr_u
                                  i32.const 1
                                  i32.and
                                  local.tee 1
                                  i32.or
                                  local.get 0
                                  local.get 1
                                  i32.shr_u
                                  i32.add
                                  local.tee 2
                                  i32.const 3
                                  i32.shl
                                  local.tee 3
                                  i32.const 2068
                                  i32.add
                                  i32.load
                                  local.tee 1
                                  i32.load offset=8
                                  local.tee 0
                                  local.get 3
                                  i32.const 2060
                                  i32.add
                                  local.tee 3
                                  i32.eq
                                  if  ;; label = @16
                                    i32.const 2020
                                    local.get 6
                                    i32.const -2
                                    local.get 2
                                    i32.rotl
                                    i32.and
                                    local.tee 6
                                    i32.store
                                    br 1 (;@15;)
                                  end
                                  i32.const 2036
                                  i32.load
                                  drop
                                  local.get 0
                                  local.get 3
                                  i32.store offset=12
                                  local.get 3
                                  local.get 0
                                  i32.store offset=8
                                end
                                local.get 1
                                i32.const 8
                                i32.add
                                local.set 0
                                local.get 1
                                local.get 4
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 1
                                local.get 4
                                i32.add
                                local.tee 3
                                local.get 2
                                i32.const 3
                                i32.shl
                                local.tee 5
                                local.get 4
                                i32.sub
                                local.tee 2
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 1
                                local.get 5
                                i32.add
                                local.get 2
                                i32.store
                                local.get 9
                                if  ;; label = @15
                                  local.get 9
                                  i32.const 3
                                  i32.shr_u
                                  local.tee 5
                                  i32.const 3
                                  i32.shl
                                  i32.const 2060
                                  i32.add
                                  local.set 4
                                  i32.const 2040
                                  i32.load
                                  local.set 1
                                  block (result i32)  ;; label = @16
                                    local.get 6
                                    i32.const 1
                                    local.get 5
                                    i32.shl
                                    local.tee 5
                                    i32.and
                                    i32.eqz
                                    if  ;; label = @17
                                      i32.const 2020
                                      local.get 5
                                      local.get 6
                                      i32.or
                                      i32.store
                                      local.get 4
                                      br 1 (;@16;)
                                    end
                                    local.get 4
                                    i32.load offset=8
                                  end
                                  local.set 5
                                  local.get 4
                                  local.get 1
                                  i32.store offset=8
                                  local.get 5
                                  local.get 1
                                  i32.store offset=12
                                  local.get 1
                                  local.get 4
                                  i32.store offset=12
                                  local.get 1
                                  local.get 5
                                  i32.store offset=8
                                end
                                i32.const 2040
                                local.get 3
                                i32.store
                                i32.const 2028
                                local.get 2
                                i32.store
                                br 13 (;@1;)
                              end
                              i32.const 2024
                              i32.load
                              local.tee 8
                              i32.eqz
                              br_if 1 (;@12;)
                              local.get 8
                              i32.const 0
                              local.get 8
                              i32.sub
                              i32.and
                              i32.const -1
                              i32.add
                              local.tee 0
                              local.get 0
                              i32.const 12
                              i32.shr_u
                              i32.const 16
                              i32.and
                              local.tee 0
                              i32.shr_u
                              local.tee 1
                              i32.const 5
                              i32.shr_u
                              i32.const 8
                              i32.and
                              local.tee 2
                              local.get 0
                              i32.or
                              local.get 1
                              local.get 2
                              i32.shr_u
                              local.tee 0
                              i32.const 2
                              i32.shr_u
                              i32.const 4
                              i32.and
                              local.tee 1
                              i32.or
                              local.get 0
                              local.get 1
                              i32.shr_u
                              local.tee 0
                              i32.const 1
                              i32.shr_u
                              i32.const 2
                              i32.and
                              local.tee 1
                              i32.or
                              local.get 0
                              local.get 1
                              i32.shr_u
                              local.tee 0
                              i32.const 1
                              i32.shr_u
                              i32.const 1
                              i32.and
                              local.tee 1
                              i32.or
                              local.get 0
                              local.get 1
                              i32.shr_u
                              i32.add
                              i32.const 2
                              i32.shl
                              i32.const 2324
                              i32.add
                              i32.load
                              local.tee 3
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 4
                              i32.sub
                              local.set 1
                              local.get 3
                              local.set 2
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 2
                                  i32.load offset=16
                                  local.tee 0
                                  i32.eqz
                                  if  ;; label = @16
                                    local.get 2
                                    i32.load offset=20
                                    local.tee 0
                                    i32.eqz
                                    br_if 1 (;@15;)
                                  end
                                  local.get 0
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 4
                                  i32.sub
                                  local.tee 2
                                  local.get 1
                                  local.get 2
                                  local.get 1
                                  i32.lt_u
                                  local.tee 2
                                  select
                                  local.set 1
                                  local.get 0
                                  local.get 3
                                  local.get 2
                                  select
                                  local.set 3
                                  local.get 0
                                  local.set 2
                                  br 1 (;@14;)
                                end
                              end
                              local.get 3
                              local.get 4
                              i32.add
                              local.tee 11
                              local.get 3
                              i32.le_u
                              br_if 2 (;@11;)
                              local.get 3
                              i32.load offset=24
                              local.set 10
                              local.get 3
                              local.get 3
                              i32.load offset=12
                              local.tee 5
                              i32.ne
                              if  ;; label = @14
                                i32.const 2036
                                i32.load
                                local.get 3
                                i32.load offset=8
                                local.tee 0
                                i32.le_u
                                if  ;; label = @15
                                  local.get 0
                                  i32.load offset=12
                                  drop
                                end
                                local.get 0
                                local.get 5
                                i32.store offset=12
                                local.get 5
                                local.get 0
                                i32.store offset=8
                                br 12 (;@2;)
                              end
                              local.get 3
                              i32.const 20
                              i32.add
                              local.tee 2
                              i32.load
                              local.tee 0
                              i32.eqz
                              if  ;; label = @14
                                local.get 3
                                i32.load offset=16
                                local.tee 0
                                i32.eqz
                                br_if 4 (;@10;)
                                local.get 3
                                i32.const 16
                                i32.add
                                local.set 2
                              end
                              loop  ;; label = @14
                                local.get 2
                                local.set 7
                                local.get 0
                                local.tee 5
                                i32.const 20
                                i32.add
                                local.tee 2
                                i32.load
                                local.tee 0
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 16
                                i32.add
                                local.set 2
                                local.get 5
                                i32.load offset=16
                                local.tee 0
                                br_if 0 (;@14;)
                              end
                              local.get 7
                              i32.const 0
                              i32.store
                              br 11 (;@2;)
                            end
                            i32.const -1
                            local.set 4
                            local.get 0
                            i32.const -65
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 11
                            i32.add
                            local.tee 0
                            i32.const -8
                            i32.and
                            local.set 4
                            i32.const 2024
                            i32.load
                            local.tee 9
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 31
                            local.set 7
                            local.get 4
                            i32.const 16777215
                            i32.le_u
                            if  ;; label = @13
                              local.get 0
                              i32.const 8
                              i32.shr_u
                              local.tee 0
                              local.get 0
                              i32.const 1048320
                              i32.add
                              i32.const 16
                              i32.shr_u
                              i32.const 8
                              i32.and
                              local.tee 0
                              i32.shl
                              local.tee 1
                              local.get 1
                              i32.const 520192
                              i32.add
                              i32.const 16
                              i32.shr_u
                              i32.const 4
                              i32.and
                              local.tee 1
                              i32.shl
                              local.tee 2
                              local.get 2
                              i32.const 245760
                              i32.add
                              i32.const 16
                              i32.shr_u
                              i32.const 2
                              i32.and
                              local.tee 2
                              i32.shl
                              i32.const 15
                              i32.shr_u
                              local.get 0
                              local.get 1
                              i32.or
                              local.get 2
                              i32.or
                              i32.sub
                              local.tee 0
                              i32.const 1
                              i32.shl
                              local.get 4
                              local.get 0
                              i32.const 21
                              i32.add
                              i32.shr_u
                              i32.const 1
                              i32.and
                              i32.or
                              i32.const 28
                              i32.add
                              local.set 7
                            end
                            i32.const 0
                            local.get 4
                            i32.sub
                            local.set 1
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 7
                                  i32.const 2
                                  i32.shl
                                  i32.const 2324
                                  i32.add
                                  i32.load
                                  local.tee 2
                                  i32.eqz
                                  if  ;; label = @16
                                    i32.const 0
                                    local.set 0
                                    br 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.set 0
                                  local.get 4
                                  i32.const 0
                                  i32.const 25
                                  local.get 7
                                  i32.const 1
                                  i32.shr_u
                                  i32.sub
                                  local.get 7
                                  i32.const 31
                                  i32.eq
                                  select
                                  i32.shl
                                  local.set 3
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 2
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 4
                                      i32.sub
                                      local.tee 6
                                      local.get 1
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 2
                                      local.set 5
                                      local.get 6
                                      local.tee 1
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 1
                                      local.get 2
                                      local.set 0
                                      br 3 (;@14;)
                                    end
                                    local.get 0
                                    local.get 2
                                    i32.load offset=20
                                    local.tee 6
                                    local.get 6
                                    local.get 2
                                    local.get 3
                                    i32.const 29
                                    i32.shr_u
                                    i32.const 4
                                    i32.and
                                    i32.add
                                    i32.load offset=16
                                    local.tee 2
                                    i32.eq
                                    select
                                    local.get 0
                                    local.get 6
                                    select
                                    local.set 0
                                    local.get 3
                                    i32.const 1
                                    i32.shl
                                    local.set 3
                                    local.get 2
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                local.get 5
                                i32.or
                                i32.eqz
                                if  ;; label = @15
                                  i32.const 2
                                  local.get 7
                                  i32.shl
                                  local.tee 0
                                  i32.const 0
                                  local.get 0
                                  i32.sub
                                  i32.or
                                  local.get 9
                                  i32.and
                                  local.tee 0
                                  i32.eqz
                                  br_if 3 (;@12;)
                                  local.get 0
                                  i32.const 0
                                  local.get 0
                                  i32.sub
                                  i32.and
                                  i32.const -1
                                  i32.add
                                  local.tee 0
                                  local.get 0
                                  i32.const 12
                                  i32.shr_u
                                  i32.const 16
                                  i32.and
                                  local.tee 0
                                  i32.shr_u
                                  local.tee 2
                                  i32.const 5
                                  i32.shr_u
                                  i32.const 8
                                  i32.and
                                  local.tee 3
                                  local.get 0
                                  i32.or
                                  local.get 2
                                  local.get 3
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 2
                                  i32.shr_u
                                  i32.const 4
                                  i32.and
                                  local.tee 2
                                  i32.or
                                  local.get 0
                                  local.get 2
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 1
                                  i32.shr_u
                                  i32.const 2
                                  i32.and
                                  local.tee 2
                                  i32.or
                                  local.get 0
                                  local.get 2
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 1
                                  i32.shr_u
                                  i32.const 1
                                  i32.and
                                  local.tee 2
                                  i32.or
                                  local.get 0
                                  local.get 2
                                  i32.shr_u
                                  i32.add
                                  i32.const 2
                                  i32.shl
                                  i32.const 2324
                                  i32.add
                                  i32.load
                                  local.set 0
                                end
                                local.get 0
                                i32.eqz
                                br_if 1 (;@13;)
                              end
                              loop  ;; label = @14
                                local.get 0
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 4
                                i32.sub
                                local.tee 6
                                local.get 1
                                i32.lt_u
                                local.set 3
                                local.get 6
                                local.get 1
                                local.get 3
                                select
                                local.set 1
                                local.get 0
                                local.get 5
                                local.get 3
                                select
                                local.set 5
                                local.get 0
                                i32.load offset=16
                                local.tee 2
                                i32.eqz
                                if  ;; label = @15
                                  local.get 0
                                  i32.load offset=20
                                  local.set 2
                                end
                                local.get 2
                                local.tee 0
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 5
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 1
                            i32.const 2028
                            i32.load
                            local.get 4
                            i32.sub
                            i32.ge_u
                            br_if 0 (;@12;)
                            local.get 4
                            local.get 5
                            i32.add
                            local.tee 7
                            local.get 5
                            i32.le_u
                            br_if 1 (;@11;)
                            local.get 5
                            i32.load offset=24
                            local.set 8
                            local.get 5
                            local.get 5
                            i32.load offset=12
                            local.tee 3
                            i32.ne
                            if  ;; label = @13
                              i32.const 2036
                              i32.load
                              local.get 5
                              i32.load offset=8
                              local.tee 0
                              i32.le_u
                              if  ;; label = @14
                                local.get 0
                                i32.load offset=12
                                drop
                              end
                              local.get 0
                              local.get 3
                              i32.store offset=12
                              local.get 3
                              local.get 0
                              i32.store offset=8
                              br 10 (;@3;)
                            end
                            local.get 5
                            i32.const 20
                            i32.add
                            local.tee 2
                            i32.load
                            local.tee 0
                            i32.eqz
                            if  ;; label = @13
                              local.get 5
                              i32.load offset=16
                              local.tee 0
                              i32.eqz
                              br_if 4 (;@9;)
                              local.get 5
                              i32.const 16
                              i32.add
                              local.set 2
                            end
                            loop  ;; label = @13
                              local.get 2
                              local.set 6
                              local.get 0
                              local.tee 3
                              i32.const 20
                              i32.add
                              local.tee 2
                              i32.load
                              local.tee 0
                              br_if 0 (;@13;)
                              local.get 3
                              i32.const 16
                              i32.add
                              local.set 2
                              local.get 3
                              i32.load offset=16
                              local.tee 0
                              br_if 0 (;@13;)
                            end
                            local.get 6
                            i32.const 0
                            i32.store
                            br 9 (;@3;)
                          end
                          i32.const 2028
                          i32.load
                          local.tee 0
                          local.get 4
                          i32.ge_u
                          if  ;; label = @12
                            i32.const 2040
                            i32.load
                            local.set 1
                            block  ;; label = @13
                              local.get 0
                              local.get 4
                              i32.sub
                              local.tee 2
                              i32.const 16
                              i32.ge_u
                              if  ;; label = @14
                                i32.const 2028
                                local.get 2
                                i32.store
                                i32.const 2040
                                local.get 1
                                local.get 4
                                i32.add
                                local.tee 3
                                i32.store
                                local.get 3
                                local.get 2
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 0
                                local.get 1
                                i32.add
                                local.get 2
                                i32.store
                                local.get 1
                                local.get 4
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                br 1 (;@13;)
                              end
                              i32.const 2040
                              i32.const 0
                              i32.store
                              i32.const 2028
                              i32.const 0
                              i32.store
                              local.get 1
                              local.get 0
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 0
                              local.get 1
                              i32.add
                              local.tee 0
                              local.get 0
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                            end
                            local.get 1
                            i32.const 8
                            i32.add
                            local.set 0
                            br 11 (;@1;)
                          end
                          i32.const 2032
                          i32.load
                          local.tee 3
                          local.get 4
                          i32.gt_u
                          if  ;; label = @12
                            i32.const 2032
                            local.get 3
                            local.get 4
                            i32.sub
                            local.tee 1
                            i32.store
                            i32.const 2044
                            i32.const 2044
                            i32.load
                            local.tee 0
                            local.get 4
                            i32.add
                            local.tee 2
                            i32.store
                            local.get 2
                            local.get 1
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 0
                            local.get 4
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 0
                            i32.const 8
                            i32.add
                            local.set 0
                            br 11 (;@1;)
                          end
                          i32.const 0
                          local.set 0
                          local.get 4
                          i32.const 47
                          i32.add
                          local.tee 9
                          block (result i32)  ;; label = @12
                            i32.const 2492
                            i32.load
                            if  ;; label = @13
                              i32.const 2500
                              i32.load
                              br 1 (;@12;)
                            end
                            i32.const 2504
                            i64.const -1
                            i64.store align=4
                            i32.const 2496
                            i64.const 17592186048512
                            i64.store align=4
                            i32.const 2492
                            local.get 12
                            i32.const 12
                            i32.add
                            i32.const -16
                            i32.and
                            i32.const 1431655768
                            i32.xor
                            i32.store
                            i32.const 2512
                            i32.const 0
                            i32.store
                            i32.const 2464
                            i32.const 0
                            i32.store
                            i32.const 4096
                          end
                          local.tee 1
                          i32.add
                          local.tee 6
                          i32.const 0
                          local.get 1
                          i32.sub
                          local.tee 7
                          i32.and
                          local.tee 5
                          local.get 4
                          i32.le_u
                          br_if 10 (;@1;)
                          i32.const 2460
                          i32.load
                          local.tee 1
                          if  ;; label = @12
                            i32.const 2452
                            i32.load
                            local.tee 2
                            local.get 5
                            i32.add
                            local.tee 8
                            local.get 2
                            i32.le_u
                            br_if 11 (;@1;)
                            local.get 8
                            local.get 1
                            i32.gt_u
                            br_if 11 (;@1;)
                          end
                          i32.const 2464
                          i32.load8_u
                          i32.const 4
                          i32.and
                          br_if 5 (;@6;)
                          block  ;; label = @12
                            block  ;; label = @13
                              i32.const 2044
                              i32.load
                              local.tee 1
                              if  ;; label = @14
                                i32.const 2468
                                local.set 0
                                loop  ;; label = @15
                                  local.get 0
                                  i32.load
                                  local.tee 2
                                  local.get 1
                                  i32.le_u
                                  if  ;; label = @16
                                    local.get 2
                                    local.get 0
                                    i32.load offset=4
                                    i32.add
                                    local.get 1
                                    i32.gt_u
                                    br_if 3 (;@13;)
                                  end
                                  local.get 0
                                  i32.load offset=8
                                  local.tee 0
                                  br_if 0 (;@15;)
                                end
                              end
                              i32.const 0
                              call $sbrk
                              local.tee 3
                              i32.const -1
                              i32.eq
                              br_if 6 (;@7;)
                              local.get 5
                              local.set 6
                              i32.const 2496
                              i32.load
                              local.tee 0
                              i32.const -1
                              i32.add
                              local.tee 1
                              local.get 3
                              i32.and
                              if  ;; label = @14
                                local.get 5
                                local.get 3
                                i32.sub
                                local.get 1
                                local.get 3
                                i32.add
                                i32.const 0
                                local.get 0
                                i32.sub
                                i32.and
                                i32.add
                                local.set 6
                              end
                              local.get 6
                              local.get 4
                              i32.le_u
                              br_if 6 (;@7;)
                              local.get 6
                              i32.const 2147483646
                              i32.gt_u
                              br_if 6 (;@7;)
                              i32.const 2460
                              i32.load
                              local.tee 0
                              if  ;; label = @14
                                i32.const 2452
                                i32.load
                                local.tee 1
                                local.get 6
                                i32.add
                                local.tee 2
                                local.get 1
                                i32.le_u
                                br_if 7 (;@7;)
                                local.get 2
                                local.get 0
                                i32.gt_u
                                br_if 7 (;@7;)
                              end
                              local.get 6
                              call $sbrk
                              local.tee 0
                              local.get 3
                              i32.ne
                              br_if 1 (;@12;)
                              br 8 (;@5;)
                            end
                            local.get 6
                            local.get 3
                            i32.sub
                            local.get 7
                            i32.and
                            local.tee 6
                            i32.const 2147483646
                            i32.gt_u
                            br_if 5 (;@7;)
                            local.get 6
                            call $sbrk
                            local.tee 3
                            local.get 0
                            i32.load
                            local.get 0
                            i32.load offset=4
                            i32.add
                            i32.eq
                            br_if 4 (;@8;)
                            local.get 3
                            local.set 0
                          end
                          block  ;; label = @12
                            local.get 4
                            i32.const 48
                            i32.add
                            local.get 6
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            i32.const 2500
                            i32.load
                            local.tee 1
                            local.get 9
                            local.get 6
                            i32.sub
                            i32.add
                            i32.const 0
                            local.get 1
                            i32.sub
                            i32.and
                            local.tee 1
                            i32.const 2147483646
                            i32.gt_u
                            if  ;; label = @13
                              local.get 0
                              local.set 3
                              br 8 (;@5;)
                            end
                            local.get 1
                            call $sbrk
                            i32.const -1
                            i32.ne
                            if  ;; label = @13
                              local.get 1
                              local.get 6
                              i32.add
                              local.set 6
                              local.get 0
                              local.set 3
                              br 8 (;@5;)
                            end
                            i32.const 0
                            local.get 6
                            i32.sub
                            call $sbrk
                            drop
                            br 5 (;@7;)
                          end
                          local.get 0
                          local.set 3
                          local.get 0
                          i32.const -1
                          i32.ne
                          br_if 6 (;@5;)
                          br 4 (;@7;)
                        end
                        unreachable
                      end
                      i32.const 0
                      local.set 5
                      br 7 (;@2;)
                    end
                    i32.const 0
                    local.set 3
                    br 5 (;@3;)
                  end
                  local.get 3
                  i32.const -1
                  i32.ne
                  br_if 2 (;@5;)
                end
                i32.const 2464
                i32.const 2464
                i32.load
                i32.const 4
                i32.or
                i32.store
              end
              local.get 5
              i32.const 2147483646
              i32.gt_u
              br_if 1 (;@4;)
              local.get 5
              call $sbrk
              local.tee 3
              i32.const 0
              call $sbrk
              local.tee 0
              i32.ge_u
              br_if 1 (;@4;)
              local.get 3
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              local.get 3
              i32.sub
              local.tee 6
              local.get 4
              i32.const 40
              i32.add
              i32.le_u
              br_if 1 (;@4;)
            end
            i32.const 2452
            i32.const 2452
            i32.load
            local.get 6
            i32.add
            local.tee 0
            i32.store
            local.get 0
            i32.const 2456
            i32.load
            i32.gt_u
            if  ;; label = @5
              i32.const 2456
              local.get 0
              i32.store
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 2044
                  i32.load
                  local.tee 1
                  if  ;; label = @8
                    i32.const 2468
                    local.set 0
                    loop  ;; label = @9
                      local.get 3
                      local.get 0
                      i32.load
                      local.tee 2
                      local.get 0
                      i32.load offset=4
                      local.tee 5
                      i32.add
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 0
                      i32.load offset=8
                      local.tee 0
                      br_if 0 (;@9;)
                    end
                    br 2 (;@6;)
                  end
                  i32.const 2036
                  i32.load
                  local.tee 0
                  i32.const 0
                  local.get 3
                  local.get 0
                  i32.ge_u
                  select
                  i32.eqz
                  if  ;; label = @8
                    i32.const 2036
                    local.get 3
                    i32.store
                  end
                  i32.const 0
                  local.set 0
                  i32.const 2472
                  local.get 6
                  i32.store
                  i32.const 2468
                  local.get 3
                  i32.store
                  i32.const 2052
                  i32.const -1
                  i32.store
                  i32.const 2056
                  i32.const 2492
                  i32.load
                  i32.store
                  i32.const 2480
                  i32.const 0
                  i32.store
                  loop  ;; label = @8
                    local.get 0
                    i32.const 3
                    i32.shl
                    local.tee 1
                    i32.const 2068
                    i32.add
                    local.get 1
                    i32.const 2060
                    i32.add
                    local.tee 2
                    i32.store
                    local.get 1
                    i32.const 2072
                    i32.add
                    local.get 2
                    i32.store
                    local.get 0
                    i32.const 1
                    i32.add
                    local.tee 0
                    i32.const 32
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  i32.const 2032
                  local.get 6
                  i32.const -40
                  i32.add
                  local.tee 0
                  i32.const -8
                  local.get 3
                  i32.sub
                  i32.const 7
                  i32.and
                  i32.const 0
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.const 7
                  i32.and
                  select
                  local.tee 1
                  i32.sub
                  local.tee 2
                  i32.store
                  i32.const 2044
                  local.get 1
                  local.get 3
                  i32.add
                  local.tee 1
                  i32.store
                  local.get 1
                  local.get 2
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 3
                  i32.add
                  i32.const 40
                  i32.store offset=4
                  i32.const 2048
                  i32.const 2508
                  i32.load
                  i32.store
                  br 2 (;@5;)
                end
                local.get 0
                i32.load8_u offset=12
                i32.const 8
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.get 1
                i32.le_u
                br_if 0 (;@6;)
                local.get 2
                local.get 1
                i32.gt_u
                br_if 0 (;@6;)
                local.get 0
                local.get 5
                local.get 6
                i32.add
                i32.store offset=4
                i32.const 2044
                local.get 1
                i32.const -8
                local.get 1
                i32.sub
                i32.const 7
                i32.and
                i32.const 0
                local.get 1
                i32.const 8
                i32.add
                i32.const 7
                i32.and
                select
                local.tee 0
                i32.add
                local.tee 2
                i32.store
                i32.const 2032
                i32.const 2032
                i32.load
                local.get 6
                i32.add
                local.tee 3
                local.get 0
                i32.sub
                local.tee 0
                i32.store
                local.get 2
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 1
                local.get 3
                i32.add
                i32.const 40
                i32.store offset=4
                i32.const 2048
                i32.const 2508
                i32.load
                i32.store
                br 1 (;@5;)
              end
              local.get 3
              i32.const 2036
              i32.load
              local.tee 5
              i32.lt_u
              if  ;; label = @6
                i32.const 2036
                local.get 3
                i32.store
                local.get 3
                local.set 5
              end
              local.get 3
              local.get 6
              i32.add
              local.set 2
              i32.const 2468
              local.set 0
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          loop  ;; label = @12
                            local.get 2
                            local.get 0
                            i32.load
                            i32.ne
                            if  ;; label = @13
                              local.get 0
                              i32.load offset=8
                              local.tee 0
                              br_if 1 (;@12;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 0
                          i32.load8_u offset=12
                          i32.const 8
                          i32.and
                          i32.eqz
                          br_if 1 (;@10;)
                        end
                        i32.const 2468
                        local.set 0
                        loop  ;; label = @11
                          local.get 0
                          i32.load
                          local.tee 2
                          local.get 1
                          i32.le_u
                          if  ;; label = @12
                            local.get 2
                            local.get 0
                            i32.load offset=4
                            i32.add
                            local.tee 2
                            local.get 1
                            i32.gt_u
                            br_if 3 (;@9;)
                          end
                          local.get 0
                          i32.load offset=8
                          local.set 0
                          br 0 (;@11;)
                        end
                        unreachable
                      end
                      local.get 0
                      local.get 3
                      i32.store
                      local.get 0
                      local.get 0
                      i32.load offset=4
                      local.get 6
                      i32.add
                      i32.store offset=4
                      local.get 3
                      i32.const -8
                      local.get 3
                      i32.sub
                      i32.const 7
                      i32.and
                      i32.const 0
                      local.get 3
                      i32.const 8
                      i32.add
                      i32.const 7
                      i32.and
                      select
                      i32.add
                      local.tee 7
                      local.get 4
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 2
                      i32.const -8
                      local.get 2
                      i32.sub
                      i32.const 7
                      i32.and
                      i32.const 0
                      local.get 2
                      i32.const 8
                      i32.add
                      i32.const 7
                      i32.and
                      select
                      i32.add
                      local.tee 3
                      local.get 7
                      i32.sub
                      local.get 4
                      i32.sub
                      local.set 0
                      local.get 4
                      local.get 7
                      i32.add
                      local.set 2
                      local.get 1
                      local.get 3
                      i32.eq
                      if  ;; label = @10
                        i32.const 2044
                        local.get 2
                        i32.store
                        i32.const 2032
                        i32.const 2032
                        i32.load
                        local.get 0
                        i32.add
                        local.tee 0
                        i32.store
                        local.get 2
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 3 (;@7;)
                      end
                      local.get 3
                      i32.const 2040
                      i32.load
                      i32.eq
                      if  ;; label = @10
                        i32.const 2040
                        local.get 2
                        i32.store
                        i32.const 2028
                        i32.const 2028
                        i32.load
                        local.get 0
                        i32.add
                        local.tee 0
                        i32.store
                        local.get 2
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 0
                        local.get 2
                        i32.add
                        local.get 0
                        i32.store
                        br 3 (;@7;)
                      end
                      local.get 3
                      i32.load offset=4
                      local.tee 1
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.eq
                      if  ;; label = @10
                        local.get 1
                        i32.const -8
                        i32.and
                        local.set 9
                        block  ;; label = @11
                          local.get 1
                          i32.const 255
                          i32.le_u
                          if  ;; label = @12
                            local.get 3
                            i32.load offset=8
                            local.tee 6
                            local.get 1
                            i32.const 3
                            i32.shr_u
                            local.tee 8
                            i32.const 3
                            i32.shl
                            i32.const 2060
                            i32.add
                            local.tee 1
                            i32.ne
                            drop
                            local.get 3
                            i32.load offset=12
                            local.tee 4
                            local.get 6
                            i32.eq
                            if  ;; label = @13
                              i32.const 2020
                              i32.const 2020
                              i32.load
                              i32.const -2
                              local.get 8
                              i32.rotl
                              i32.and
                              i32.store
                              br 2 (;@11;)
                            end
                            local.get 6
                            local.get 4
                            i32.store offset=12
                            local.get 4
                            local.get 6
                            i32.store offset=8
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=24
                          local.set 8
                          block  ;; label = @12
                            local.get 3
                            local.get 3
                            i32.load offset=12
                            local.tee 6
                            i32.ne
                            if  ;; label = @13
                              local.get 5
                              local.get 3
                              i32.load offset=8
                              local.tee 1
                              i32.le_u
                              if  ;; label = @14
                                local.get 1
                                i32.load offset=12
                                drop
                              end
                              local.get 1
                              local.get 6
                              i32.store offset=12
                              local.get 6
                              local.get 1
                              i32.store offset=8
                              br 1 (;@12;)
                            end
                            block  ;; label = @13
                              local.get 3
                              i32.const 20
                              i32.add
                              local.tee 1
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 3
                              i32.const 16
                              i32.add
                              local.tee 1
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 6
                              br 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 1
                              local.set 5
                              local.get 4
                              local.tee 6
                              i32.const 20
                              i32.add
                              local.tee 1
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 6
                              i32.const 16
                              i32.add
                              local.set 1
                              local.get 6
                              i32.load offset=16
                              local.tee 4
                              br_if 0 (;@13;)
                            end
                            local.get 5
                            i32.const 0
                            i32.store
                          end
                          local.get 8
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            local.get 3
                            local.get 3
                            i32.load offset=28
                            local.tee 4
                            i32.const 2
                            i32.shl
                            i32.const 2324
                            i32.add
                            local.tee 1
                            i32.load
                            i32.eq
                            if  ;; label = @13
                              local.get 1
                              local.get 6
                              i32.store
                              local.get 6
                              br_if 1 (;@12;)
                              i32.const 2024
                              i32.const 2024
                              i32.load
                              i32.const -2
                              local.get 4
                              i32.rotl
                              i32.and
                              i32.store
                              br 2 (;@11;)
                            end
                            local.get 8
                            i32.const 16
                            i32.const 20
                            local.get 8
                            i32.load offset=16
                            local.get 3
                            i32.eq
                            select
                            i32.add
                            local.get 6
                            i32.store
                            local.get 6
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          local.get 6
                          local.get 8
                          i32.store offset=24
                          local.get 3
                          i32.load offset=16
                          local.tee 1
                          if  ;; label = @12
                            local.get 6
                            local.get 1
                            i32.store offset=16
                            local.get 1
                            local.get 6
                            i32.store offset=24
                          end
                          local.get 3
                          i32.load offset=20
                          local.tee 1
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 6
                          local.get 1
                          i32.store offset=20
                          local.get 1
                          local.get 6
                          i32.store offset=24
                        end
                        local.get 3
                        local.get 9
                        i32.add
                        local.set 3
                        local.get 0
                        local.get 9
                        i32.add
                        local.set 0
                      end
                      local.get 3
                      local.get 3
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 2
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 2
                      i32.add
                      local.get 0
                      i32.store
                      local.get 0
                      i32.const 255
                      i32.le_u
                      if  ;; label = @10
                        local.get 0
                        i32.const 3
                        i32.shr_u
                        local.tee 1
                        i32.const 3
                        i32.shl
                        i32.const 2060
                        i32.add
                        local.set 0
                        block (result i32)  ;; label = @11
                          i32.const 2020
                          i32.load
                          local.tee 4
                          i32.const 1
                          local.get 1
                          i32.shl
                          local.tee 1
                          i32.and
                          i32.eqz
                          if  ;; label = @12
                            i32.const 2020
                            local.get 1
                            local.get 4
                            i32.or
                            i32.store
                            local.get 0
                            br 1 (;@11;)
                          end
                          local.get 0
                          i32.load offset=8
                        end
                        local.set 1
                        local.get 0
                        local.get 2
                        i32.store offset=8
                        local.get 1
                        local.get 2
                        i32.store offset=12
                        local.get 2
                        local.get 0
                        i32.store offset=12
                        local.get 2
                        local.get 1
                        i32.store offset=8
                        br 3 (;@7;)
                      end
                      i32.const 31
                      local.set 1
                      local.get 0
                      i32.const 16777215
                      i32.le_u
                      if  ;; label = @10
                        local.get 0
                        i32.const 8
                        i32.shr_u
                        local.tee 1
                        local.get 1
                        i32.const 1048320
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 8
                        i32.and
                        local.tee 1
                        i32.shl
                        local.tee 4
                        local.get 4
                        i32.const 520192
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 4
                        i32.and
                        local.tee 4
                        i32.shl
                        local.tee 3
                        local.get 3
                        i32.const 245760
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 2
                        i32.and
                        local.tee 3
                        i32.shl
                        i32.const 15
                        i32.shr_u
                        local.get 1
                        local.get 4
                        i32.or
                        local.get 3
                        i32.or
                        i32.sub
                        local.tee 1
                        i32.const 1
                        i32.shl
                        local.get 0
                        local.get 1
                        i32.const 21
                        i32.add
                        i32.shr_u
                        i32.const 1
                        i32.and
                        i32.or
                        i32.const 28
                        i32.add
                        local.set 1
                      end
                      local.get 2
                      local.get 1
                      i32.store offset=28
                      local.get 2
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 1
                      i32.const 2
                      i32.shl
                      i32.const 2324
                      i32.add
                      local.set 4
                      block  ;; label = @10
                        i32.const 2024
                        i32.load
                        local.tee 3
                        i32.const 1
                        local.get 1
                        i32.shl
                        local.tee 5
                        i32.and
                        i32.eqz
                        if  ;; label = @11
                          i32.const 2024
                          local.get 3
                          local.get 5
                          i32.or
                          i32.store
                          local.get 4
                          local.get 2
                          i32.store
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.const 0
                        i32.const 25
                        local.get 1
                        i32.const 1
                        i32.shr_u
                        i32.sub
                        local.get 1
                        i32.const 31
                        i32.eq
                        select
                        i32.shl
                        local.set 1
                        local.get 4
                        i32.load
                        local.set 3
                        loop  ;; label = @11
                          local.get 3
                          local.tee 4
                          i32.load offset=4
                          i32.const -8
                          i32.and
                          local.get 0
                          i32.eq
                          br_if 3 (;@8;)
                          local.get 1
                          i32.const 29
                          i32.shr_u
                          local.set 3
                          local.get 1
                          i32.const 1
                          i32.shl
                          local.set 1
                          local.get 4
                          local.get 3
                          i32.const 4
                          i32.and
                          i32.add
                          local.tee 13
                          i32.const 16
                          i32.add
                          local.tee 5
                          i32.load
                          local.tee 3
                          br_if 0 (;@11;)
                        end
                        local.get 13
                        local.get 2
                        i32.store offset=16
                      end
                      local.get 2
                      local.get 4
                      i32.store offset=24
                      local.get 2
                      local.get 2
                      i32.store offset=12
                      local.get 2
                      local.get 2
                      i32.store offset=8
                      br 2 (;@7;)
                    end
                    i32.const 2032
                    local.get 6
                    i32.const -40
                    i32.add
                    local.tee 0
                    i32.const -8
                    local.get 3
                    i32.sub
                    i32.const 7
                    i32.and
                    i32.const 0
                    local.get 3
                    i32.const 8
                    i32.add
                    i32.const 7
                    i32.and
                    select
                    local.tee 5
                    i32.sub
                    local.tee 7
                    i32.store
                    i32.const 2044
                    local.get 3
                    local.get 5
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 5
                    local.get 7
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.add
                    i32.const 40
                    i32.store offset=4
                    i32.const 2048
                    i32.const 2508
                    i32.load
                    i32.store
                    local.get 1
                    local.get 2
                    i32.const 39
                    local.get 2
                    i32.sub
                    i32.const 7
                    i32.and
                    i32.const 0
                    local.get 2
                    i32.const -39
                    i32.add
                    i32.const 7
                    i32.and
                    select
                    i32.add
                    i32.const -47
                    i32.add
                    local.tee 0
                    local.get 0
                    local.get 1
                    i32.const 16
                    i32.add
                    i32.lt_u
                    select
                    local.tee 5
                    i32.const 27
                    i32.store offset=4
                    local.get 5
                    i32.const 2476
                    i64.load align=4
                    i64.store offset=16 align=4
                    local.get 5
                    i32.const 2468
                    i64.load align=4
                    i64.store offset=8 align=4
                    i32.const 2476
                    local.get 5
                    i32.const 8
                    i32.add
                    i32.store
                    i32.const 2472
                    local.get 6
                    i32.store
                    i32.const 2468
                    local.get 3
                    i32.store
                    i32.const 2480
                    i32.const 0
                    i32.store
                    local.get 5
                    i32.const 24
                    i32.add
                    local.set 0
                    loop  ;; label = @9
                      local.get 0
                      i32.const 7
                      i32.store offset=4
                      local.get 0
                      i32.const 8
                      i32.add
                      local.set 3
                      local.get 0
                      i32.const 4
                      i32.add
                      local.set 0
                      local.get 2
                      local.get 3
                      i32.gt_u
                      br_if 0 (;@9;)
                    end
                    local.get 1
                    local.get 5
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 5
                    local.get 5
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 1
                    local.get 5
                    local.get 1
                    i32.sub
                    local.tee 6
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 5
                    local.get 6
                    i32.store
                    local.get 6
                    i32.const 255
                    i32.le_u
                    if  ;; label = @9
                      local.get 6
                      i32.const 3
                      i32.shr_u
                      local.tee 2
                      i32.const 3
                      i32.shl
                      i32.const 2060
                      i32.add
                      local.set 0
                      block (result i32)  ;; label = @10
                        i32.const 2020
                        i32.load
                        local.tee 3
                        i32.const 1
                        local.get 2
                        i32.shl
                        local.tee 2
                        i32.and
                        i32.eqz
                        if  ;; label = @11
                          i32.const 2020
                          local.get 2
                          local.get 3
                          i32.or
                          i32.store
                          local.get 0
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.load offset=8
                      end
                      local.set 2
                      local.get 0
                      local.get 1
                      i32.store offset=8
                      local.get 2
                      local.get 1
                      i32.store offset=12
                      local.get 1
                      local.get 0
                      i32.store offset=12
                      local.get 1
                      local.get 2
                      i32.store offset=8
                      br 4 (;@5;)
                    end
                    i32.const 31
                    local.set 0
                    local.get 1
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 6
                    i32.const 16777215
                    i32.le_u
                    if  ;; label = @9
                      local.get 6
                      i32.const 8
                      i32.shr_u
                      local.tee 0
                      local.get 0
                      i32.const 1048320
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 8
                      i32.and
                      local.tee 0
                      i32.shl
                      local.tee 2
                      local.get 2
                      i32.const 520192
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 4
                      i32.and
                      local.tee 2
                      i32.shl
                      local.tee 3
                      local.get 3
                      i32.const 245760
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 2
                      i32.and
                      local.tee 3
                      i32.shl
                      i32.const 15
                      i32.shr_u
                      local.get 0
                      local.get 2
                      i32.or
                      local.get 3
                      i32.or
                      i32.sub
                      local.tee 0
                      i32.const 1
                      i32.shl
                      local.get 6
                      local.get 0
                      i32.const 21
                      i32.add
                      i32.shr_u
                      i32.const 1
                      i32.and
                      i32.or
                      i32.const 28
                      i32.add
                      local.set 0
                    end
                    local.get 1
                    local.get 0
                    i32.store offset=28
                    local.get 0
                    i32.const 2
                    i32.shl
                    i32.const 2324
                    i32.add
                    local.set 2
                    block  ;; label = @9
                      i32.const 2024
                      i32.load
                      local.tee 3
                      i32.const 1
                      local.get 0
                      i32.shl
                      local.tee 5
                      i32.and
                      i32.eqz
                      if  ;; label = @10
                        i32.const 2024
                        local.get 3
                        local.get 5
                        i32.or
                        i32.store
                        local.get 2
                        local.get 1
                        i32.store
                        br 1 (;@9;)
                      end
                      local.get 6
                      i32.const 0
                      i32.const 25
                      local.get 0
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 0
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 0
                      local.get 2
                      i32.load
                      local.set 3
                      loop  ;; label = @10
                        local.get 3
                        local.tee 2
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 6
                        i32.eq
                        br_if 4 (;@6;)
                        local.get 0
                        i32.const 29
                        i32.shr_u
                        local.set 3
                        local.get 0
                        i32.const 1
                        i32.shl
                        local.set 0
                        local.get 2
                        local.get 3
                        i32.const 4
                        i32.and
                        i32.add
                        local.tee 14
                        i32.const 16
                        i32.add
                        local.tee 5
                        i32.load
                        local.tee 3
                        br_if 0 (;@10;)
                      end
                      local.get 14
                      local.get 1
                      i32.store offset=16
                    end
                    local.get 1
                    local.get 2
                    i32.store offset=24
                    local.get 1
                    local.get 1
                    i32.store offset=12
                    local.get 1
                    local.get 1
                    i32.store offset=8
                    br 3 (;@5;)
                  end
                  local.get 4
                  i32.load offset=8
                  local.tee 0
                  local.get 2
                  i32.store offset=12
                  local.get 4
                  local.get 2
                  i32.store offset=8
                  local.get 2
                  i32.const 0
                  i32.store offset=24
                  local.get 2
                  local.get 4
                  i32.store offset=12
                  local.get 2
                  local.get 0
                  i32.store offset=8
                end
                local.get 7
                i32.const 8
                i32.add
                local.set 0
                br 5 (;@1;)
              end
              local.get 2
              i32.load offset=8
              local.tee 0
              local.get 1
              i32.store offset=12
              local.get 2
              local.get 1
              i32.store offset=8
              local.get 1
              i32.const 0
              i32.store offset=24
              local.get 1
              local.get 2
              i32.store offset=12
              local.get 1
              local.get 0
              i32.store offset=8
            end
            i32.const 2032
            i32.load
            local.tee 0
            local.get 4
            i32.le_u
            br_if 0 (;@4;)
            i32.const 2032
            local.get 0
            local.get 4
            i32.sub
            local.tee 1
            i32.store
            i32.const 2044
            i32.const 2044
            i32.load
            local.tee 0
            local.get 4
            i32.add
            local.tee 2
            i32.store
            local.get 2
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 4
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 0
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          call $__errno_location
          i32.const 48
          i32.store
          i32.const 0
          local.set 0
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 5
            i32.load offset=28
            local.tee 2
            i32.const 2
            i32.shl
            i32.const 2324
            i32.add
            local.tee 0
            i32.load
            local.get 5
            i32.eq
            if  ;; label = @5
              local.get 0
              local.get 3
              i32.store
              local.get 3
              br_if 1 (;@4;)
              i32.const 2024
              local.get 9
              i32.const -2
              local.get 2
              i32.rotl
              i32.and
              local.tee 9
              i32.store
              br 2 (;@3;)
            end
            local.get 8
            i32.const 16
            i32.const 20
            local.get 8
            i32.load offset=16
            local.get 5
            i32.eq
            select
            i32.add
            local.get 3
            i32.store
            local.get 3
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 3
          local.get 8
          i32.store offset=24
          local.get 5
          i32.load offset=16
          local.tee 0
          if  ;; label = @4
            local.get 3
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 3
            i32.store offset=24
          end
          local.get 5
          i32.load offset=20
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 0
          i32.store offset=20
          local.get 0
          local.get 3
          i32.store offset=24
        end
        block  ;; label = @3
          local.get 1
          i32.const 15
          i32.le_u
          if  ;; label = @4
            local.get 5
            local.get 1
            local.get 4
            i32.add
            local.tee 0
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 0
            local.get 5
            i32.add
            local.tee 0
            local.get 0
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 5
          local.get 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          local.get 7
          i32.add
          local.get 1
          i32.store
          local.get 1
          i32.const 255
          i32.le_u
          if  ;; label = @4
            local.get 1
            i32.const 3
            i32.shr_u
            local.tee 1
            i32.const 3
            i32.shl
            i32.const 2060
            i32.add
            local.set 0
            block (result i32)  ;; label = @5
              i32.const 2020
              i32.load
              local.tee 2
              i32.const 1
              local.get 1
              i32.shl
              local.tee 1
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 2020
                local.get 1
                local.get 2
                i32.or
                i32.store
                local.get 0
                br 1 (;@5;)
              end
              local.get 0
              i32.load offset=8
            end
            local.set 1
            local.get 0
            local.get 7
            i32.store offset=8
            local.get 1
            local.get 7
            i32.store offset=12
            local.get 7
            local.get 0
            i32.store offset=12
            local.get 7
            local.get 1
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 0
          local.get 1
          i32.const 16777215
          i32.le_u
          if  ;; label = @4
            local.get 1
            i32.const 8
            i32.shr_u
            local.tee 0
            local.get 0
            i32.const 1048320
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 8
            i32.and
            local.tee 0
            i32.shl
            local.tee 2
            local.get 2
            i32.const 520192
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 4
            i32.and
            local.tee 2
            i32.shl
            local.tee 4
            local.get 4
            i32.const 245760
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 2
            i32.and
            local.tee 4
            i32.shl
            i32.const 15
            i32.shr_u
            local.get 0
            local.get 2
            i32.or
            local.get 4
            i32.or
            i32.sub
            local.tee 0
            i32.const 1
            i32.shl
            local.get 1
            local.get 0
            i32.const 21
            i32.add
            i32.shr_u
            i32.const 1
            i32.and
            i32.or
            i32.const 28
            i32.add
            local.set 0
          end
          local.get 7
          local.get 0
          i32.store offset=28
          local.get 7
          i64.const 0
          i64.store offset=16 align=4
          local.get 0
          i32.const 2
          i32.shl
          i32.const 2324
          i32.add
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              local.get 9
              i32.const 1
              local.get 0
              i32.shl
              local.tee 4
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 2024
                local.get 4
                local.get 9
                i32.or
                i32.store
                local.get 2
                local.get 7
                i32.store
                br 1 (;@5;)
              end
              local.get 1
              i32.const 0
              i32.const 25
              local.get 0
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 0
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 0
              local.get 2
              i32.load
              local.set 4
              loop  ;; label = @6
                local.get 4
                local.tee 2
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 1
                i32.eq
                br_if 2 (;@4;)
                local.get 0
                i32.const 29
                i32.shr_u
                local.set 4
                local.get 0
                i32.const 1
                i32.shl
                local.set 0
                local.get 2
                local.get 4
                i32.const 4
                i32.and
                i32.add
                local.tee 15
                i32.const 16
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 15
              local.get 7
              i32.store offset=16
            end
            local.get 7
            local.get 2
            i32.store offset=24
            local.get 7
            local.get 7
            i32.store offset=12
            local.get 7
            local.get 7
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.tee 0
          local.get 7
          i32.store offset=12
          local.get 2
          local.get 7
          i32.store offset=8
          local.get 7
          i32.const 0
          i32.store offset=24
          local.get 7
          local.get 2
          i32.store offset=12
          local.get 7
          local.get 0
          i32.store offset=8
        end
        local.get 5
        i32.const 8
        i32.add
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 10
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.load offset=28
          local.tee 2
          i32.const 2
          i32.shl
          i32.const 2324
          i32.add
          local.tee 0
          i32.load
          local.get 3
          i32.eq
          if  ;; label = @4
            local.get 0
            local.get 5
            i32.store
            local.get 5
            br_if 1 (;@3;)
            i32.const 2024
            local.get 8
            i32.const -2
            local.get 2
            i32.rotl
            i32.and
            i32.store
            br 2 (;@2;)
          end
          local.get 10
          i32.const 16
          i32.const 20
          local.get 10
          i32.load offset=16
          local.get 3
          i32.eq
          select
          i32.add
          local.get 5
          i32.store
          local.get 5
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 5
        local.get 10
        i32.store offset=24
        local.get 3
        i32.load offset=16
        local.tee 0
        if  ;; label = @3
          local.get 5
          local.get 0
          i32.store offset=16
          local.get 0
          local.get 5
          i32.store offset=24
        end
        local.get 3
        i32.load offset=20
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 0
        i32.store offset=20
        local.get 0
        local.get 5
        i32.store offset=24
      end
      block  ;; label = @2
        local.get 1
        i32.const 15
        i32.le_u
        if  ;; label = @3
          local.get 3
          local.get 1
          local.get 4
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 3
        local.get 4
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 11
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 11
        i32.add
        local.get 1
        i32.store
        local.get 9
        if  ;; label = @3
          local.get 9
          i32.const 3
          i32.shr_u
          local.tee 4
          i32.const 3
          i32.shl
          i32.const 2060
          i32.add
          local.set 2
          i32.const 2040
          i32.load
          local.set 0
          block (result i32)  ;; label = @4
            i32.const 1
            local.get 4
            i32.shl
            local.tee 4
            local.get 6
            i32.and
            i32.eqz
            if  ;; label = @5
              i32.const 2020
              local.get 4
              local.get 6
              i32.or
              i32.store
              local.get 2
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=8
          end
          local.set 4
          local.get 2
          local.get 0
          i32.store offset=8
          local.get 4
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 2
          i32.store offset=12
          local.get 0
          local.get 4
          i32.store offset=8
        end
        i32.const 2040
        local.get 11
        i32.store
        i32.const 2028
        local.get 1
        i32.store
      end
      local.get 3
      i32.const 8
      i32.add
      local.set 0
    end
    local.get 12
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $dlfree (type 2) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.add
        local.tee 2
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 1
        i32.const -8
        i32.and
        local.tee 0
        i32.add
        local.set 5
        block  ;; label = @3
          local.get 1
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          local.get 2
          i32.load
          local.tee 1
          i32.sub
          local.tee 2
          i32.const 2036
          i32.load
          local.tee 4
          i32.lt_u
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          i32.add
          local.set 0
          local.get 2
          i32.const 2040
          i32.load
          i32.ne
          if  ;; label = @4
            local.get 1
            i32.const 255
            i32.le_u
            if  ;; label = @5
              local.get 2
              i32.load offset=8
              local.tee 7
              local.get 1
              i32.const 3
              i32.shr_u
              local.tee 6
              i32.const 3
              i32.shl
              i32.const 2060
              i32.add
              local.tee 1
              i32.ne
              drop
              local.get 7
              local.get 2
              i32.load offset=12
              local.tee 3
              i32.eq
              if  ;; label = @6
                i32.const 2020
                i32.const 2020
                i32.load
                i32.const -2
                local.get 6
                i32.rotl
                i32.and
                i32.store
                br 3 (;@3;)
              end
              local.get 7
              local.get 3
              i32.store offset=12
              local.get 3
              local.get 7
              i32.store offset=8
              br 2 (;@3;)
            end
            local.get 2
            i32.load offset=24
            local.set 6
            block  ;; label = @5
              local.get 2
              local.get 2
              i32.load offset=12
              local.tee 3
              i32.ne
              if  ;; label = @6
                local.get 4
                local.get 2
                i32.load offset=8
                local.tee 1
                i32.le_u
                if  ;; label = @7
                  local.get 1
                  i32.load offset=12
                  drop
                end
                local.get 1
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 1
                i32.store offset=8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                i32.const 20
                i32.add
                local.tee 1
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 2
                i32.const 16
                i32.add
                local.tee 1
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 3
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 1
                local.set 7
                local.get 4
                local.tee 3
                i32.const 20
                i32.add
                local.tee 1
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 3
                i32.const 16
                i32.add
                local.set 1
                local.get 3
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 7
              i32.const 0
              i32.store
            end
            local.get 6
            i32.eqz
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 2
              local.get 2
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 2324
              i32.add
              local.tee 1
              i32.load
              i32.eq
              if  ;; label = @6
                local.get 1
                local.get 3
                i32.store
                local.get 3
                br_if 1 (;@5;)
                i32.const 2024
                i32.const 2024
                i32.load
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store
                br 3 (;@3;)
              end
              local.get 6
              i32.const 16
              i32.const 20
              local.get 6
              i32.load offset=16
              local.get 2
              i32.eq
              select
              i32.add
              local.get 3
              i32.store
              local.get 3
              i32.eqz
              br_if 2 (;@3;)
            end
            local.get 3
            local.get 6
            i32.store offset=24
            local.get 2
            i32.load offset=16
            local.tee 1
            if  ;; label = @5
              local.get 3
              local.get 1
              i32.store offset=16
              local.get 1
              local.get 3
              i32.store offset=24
            end
            local.get 2
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 3
            local.get 1
            i32.store offset=20
            local.get 1
            local.get 3
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=4
          local.tee 1
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 0 (;@3;)
          i32.const 2028
          local.get 0
          i32.store
          local.get 5
          local.get 1
          i32.const -2
          i32.and
          i32.store offset=4
          br 2 (;@1;)
        end
        local.get 5
        local.get 2
        i32.le_u
        br_if 0 (;@2;)
        local.get 5
        i32.load offset=4
        local.tee 1
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 1
          i32.const 2
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 5
            i32.const 2044
            i32.load
            i32.eq
            if  ;; label = @5
              i32.const 2044
              local.get 2
              i32.store
              i32.const 2032
              i32.const 2032
              i32.load
              local.get 0
              i32.add
              local.tee 0
              i32.store
              local.get 2
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 2
              i32.const 2040
              i32.load
              i32.ne
              br_if 3 (;@2;)
              i32.const 2028
              i32.const 0
              i32.store
              i32.const 2040
              i32.const 0
              i32.store
              return
            end
            local.get 5
            i32.const 2040
            i32.load
            i32.eq
            if  ;; label = @5
              i32.const 2040
              local.get 2
              i32.store
              i32.const 2028
              i32.const 2028
              i32.load
              local.get 0
              i32.add
              local.tee 0
              i32.store
              br 4 (;@1;)
            end
            local.get 1
            i32.const -8
            i32.and
            local.get 0
            i32.add
            local.set 0
            block  ;; label = @5
              local.get 1
              i32.const 255
              i32.le_u
              if  ;; label = @6
                local.get 5
                i32.load offset=12
                local.set 4
                local.get 5
                i32.load offset=8
                local.tee 3
                local.get 1
                i32.const 3
                i32.shr_u
                local.tee 5
                i32.const 3
                i32.shl
                i32.const 2060
                i32.add
                local.tee 1
                i32.ne
                if  ;; label = @7
                  i32.const 2036
                  i32.load
                  drop
                end
                local.get 3
                local.get 4
                i32.eq
                if  ;; label = @7
                  i32.const 2020
                  i32.const 2020
                  i32.load
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store
                  br 2 (;@5;)
                end
                local.get 1
                local.get 4
                i32.ne
                if  ;; label = @7
                  i32.const 2036
                  i32.load
                  drop
                end
                local.get 3
                local.get 4
                i32.store offset=12
                local.get 4
                local.get 3
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 5
              i32.load offset=24
              local.set 6
              block  ;; label = @6
                local.get 5
                local.get 5
                i32.load offset=12
                local.tee 3
                i32.ne
                if  ;; label = @7
                  i32.const 2036
                  i32.load
                  local.get 5
                  i32.load offset=8
                  local.tee 1
                  i32.le_u
                  if  ;; label = @8
                    local.get 1
                    i32.load offset=12
                    drop
                  end
                  local.get 1
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 1
                  i32.store offset=8
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 5
                  i32.const 20
                  i32.add
                  local.tee 1
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 16
                  i32.add
                  local.tee 1
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 3
                  br 1 (;@6;)
                end
                loop  ;; label = @7
                  local.get 1
                  local.set 7
                  local.get 4
                  local.tee 3
                  i32.const 20
                  i32.add
                  local.tee 1
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 1
                  local.get 3
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
              end
              local.get 6
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 5
                local.get 5
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 2324
                i32.add
                local.tee 1
                i32.load
                i32.eq
                if  ;; label = @7
                  local.get 1
                  local.get 3
                  i32.store
                  local.get 3
                  br_if 1 (;@6;)
                  i32.const 2024
                  i32.const 2024
                  i32.load
                  i32.const -2
                  local.get 4
                  i32.rotl
                  i32.and
                  i32.store
                  br 2 (;@5;)
                end
                local.get 6
                i32.const 16
                i32.const 20
                local.get 6
                i32.load offset=16
                local.get 5
                i32.eq
                select
                i32.add
                local.get 3
                i32.store
                local.get 3
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 3
              local.get 6
              i32.store offset=24
              local.get 5
              i32.load offset=16
              local.tee 1
              if  ;; label = @6
                local.get 3
                local.get 1
                i32.store offset=16
                local.get 1
                local.get 3
                i32.store offset=24
              end
              local.get 5
              i32.load offset=20
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              local.get 1
              i32.store offset=20
              local.get 1
              local.get 3
              i32.store offset=24
            end
            local.get 2
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 2
            i32.add
            local.get 0
            i32.store
            local.get 2
            i32.const 2040
            i32.load
            i32.ne
            br_if 1 (;@3;)
            i32.const 2028
            local.get 0
            i32.store
            return
          end
          local.get 5
          local.get 1
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 2
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 2
          i32.add
          local.get 0
          i32.store
        end
        local.get 0
        i32.const 255
        i32.le_u
        if  ;; label = @3
          local.get 0
          i32.const 3
          i32.shr_u
          local.tee 1
          i32.const 3
          i32.shl
          i32.const 2060
          i32.add
          local.set 0
          block (result i32)  ;; label = @4
            i32.const 2020
            i32.load
            local.tee 4
            i32.const 1
            local.get 1
            i32.shl
            local.tee 1
            i32.and
            i32.eqz
            if  ;; label = @5
              i32.const 2020
              local.get 1
              local.get 4
              i32.or
              i32.store
              local.get 0
              br 1 (;@4;)
            end
            local.get 0
            i32.load offset=8
          end
          local.set 1
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 1
          local.get 2
          i32.store offset=12
          local.get 2
          local.get 0
          i32.store offset=12
          local.get 2
          local.get 1
          i32.store offset=8
          return
        end
        i32.const 31
        local.set 1
        local.get 2
        i64.const 0
        i64.store offset=16 align=4
        local.get 0
        i32.const 16777215
        i32.le_u
        if  ;; label = @3
          local.get 0
          i32.const 8
          i32.shr_u
          local.tee 1
          local.get 1
          i32.const 1048320
          i32.add
          i32.const 16
          i32.shr_u
          i32.const 8
          i32.and
          local.tee 1
          i32.shl
          local.tee 4
          local.get 4
          i32.const 520192
          i32.add
          i32.const 16
          i32.shr_u
          i32.const 4
          i32.and
          local.tee 4
          i32.shl
          local.tee 3
          local.get 3
          i32.const 245760
          i32.add
          i32.const 16
          i32.shr_u
          i32.const 2
          i32.and
          local.tee 3
          i32.shl
          i32.const 15
          i32.shr_u
          local.get 1
          local.get 4
          i32.or
          local.get 3
          i32.or
          i32.sub
          local.tee 1
          i32.const 1
          i32.shl
          local.get 0
          local.get 1
          i32.const 21
          i32.add
          i32.shr_u
          i32.const 1
          i32.and
          i32.or
          i32.const 28
          i32.add
          local.set 1
        end
        local.get 2
        local.get 1
        i32.store offset=28
        local.get 1
        i32.const 2
        i32.shl
        i32.const 2324
        i32.add
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 2024
              i32.load
              local.tee 3
              i32.const 1
              local.get 1
              i32.shl
              local.tee 5
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 2024
                local.get 3
                local.get 5
                i32.or
                i32.store
                local.get 4
                local.get 2
                i32.store
                br 1 (;@5;)
              end
              local.get 0
              i32.const 0
              i32.const 25
              local.get 1
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 1
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 1
              local.get 4
              i32.load
              local.set 3
              loop  ;; label = @6
                local.get 3
                local.tee 4
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 0
                i32.eq
                br_if 2 (;@4;)
                local.get 1
                i32.const 29
                i32.shr_u
                local.set 3
                local.get 1
                i32.const 1
                i32.shl
                local.set 1
                local.get 4
                local.get 3
                i32.const 4
                i32.and
                i32.add
                local.tee 8
                i32.const 16
                i32.add
                local.tee 5
                i32.load
                local.tee 3
                br_if 0 (;@6;)
              end
              local.get 8
              local.get 2
              i32.store offset=16
            end
            local.get 2
            local.get 4
            i32.store offset=24
            local.get 2
            local.get 2
            i32.store offset=12
            local.get 2
            local.get 2
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=8
          local.tee 0
          local.get 2
          i32.store offset=12
          local.get 4
          local.get 2
          i32.store offset=8
          local.get 2
          i32.const 0
          i32.store offset=24
          local.get 2
          local.get 4
          i32.store offset=12
          local.get 2
          local.get 0
          i32.store offset=8
        end
        i32.const 2052
        i32.const 2052
        i32.load
        i32.const -1
        i32.add
        local.tee 2
        i32.store
        local.get 2
        br_if 0 (;@2;)
        i32.const 2476
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.load
          local.tee 0
          i32.const 8
          i32.add
          local.set 2
          local.get 0
          br_if 0 (;@3;)
        end
        i32.const 2052
        i32.const -1
        i32.store
      end
      return
    end
    local.get 2
    local.get 0
    i32.const 1
    i32.or
    i32.store offset=4
    local.get 0
    local.get 2
    i32.add
    local.get 0
    i32.store)
  (func $sbrk (type 0) (param i32) (result i32)
    (local i32 i32)
    i32.const 1620
    i32.load
    local.tee 1
    local.get 0
    i32.const 3
    i32.add
    i32.const -4
    i32.and
    local.tee 2
    i32.add
    local.set 0
    block  ;; label = @1
      local.get 2
      i32.const 1
      i32.ge_s
      i32.const 0
      local.get 0
      local.get 1
      i32.le_u
      select
      br_if 0 (;@1;)
      local.get 0
      memory.size
      i32.const 16
      i32.shl
      i32.gt_u
      if  ;; label = @2
        local.get 0
        call $emscripten_resize_heap
        i32.eqz
        br_if 1 (;@1;)
      end
      i32.const 1620
      local.get 0
      i32.store
      local.get 1
      return
    end
    call $__errno_location
    i32.const 48
    i32.store
    i32.const -1)
  (func $__wasi_syscall_ret (type 0) (param i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    call $__errno_location
    local.get 0
    i32.store
    i32.const -1)
  (func $_Exit (type 2) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $emscripten_memcpy_big (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 2
    if  ;; label = @1
      local.get 0
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.get 1
        local.get 2
        i32.const 508
        local.get 2
        i32.const 508
        i32.lt_u
        select
        local.tee 4
        call $memcpy
        local.set 3
        local.get 1
        i32.const 508
        i32.add
        local.set 1
        local.get 3
        i32.const 508
        i32.add
        local.set 3
        local.get 2
        local.get 4
        i32.sub
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $emscripten_resize_heap (type 0) (param i32) (result i32)
    i32.const 0)
  (func $libc_exit_fini (type 3)
    call $_fini)
  (func $exit (type 2) (param i32)
    call $_fini
    call $libc_exit_fini
    call $__stdio_exit
    local.get 0
    call $_Exit
    unreachable)
  (func $_fini (type 3)
    nop)
  (func $memcpy (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 512
    i32.ge_u
    if  ;; label = @1
      local.get 0
      local.get 1
      local.get 2
      call $emscripten_memcpy_big
      drop
      local.get 0
      return
    end
    local.get 0
    local.get 2
    i32.add
    local.set 3
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.xor
      i32.const 3
      i32.and
      i32.eqz
      if  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1
          i32.lt_s
          if  ;; label = @4
            local.get 0
            local.set 2
            br 1 (;@3;)
          end
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 0
            local.set 2
            br 1 (;@3;)
          end
          local.get 0
          local.set 2
          loop  ;; label = @4
            local.get 2
            local.get 1
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            local.get 3
            i32.ge_u
            br_if 1 (;@3;)
            local.get 2
            i32.const 3
            i32.and
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 3
          i32.const -4
          i32.and
          local.tee 4
          i32.const 64
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.const -64
          i32.add
          local.tee 5
          i32.gt_u
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 2
            local.get 1
            i32.load
            i32.store
            local.get 2
            local.get 1
            i32.load offset=4
            i32.store offset=4
            local.get 2
            local.get 1
            i32.load offset=8
            i32.store offset=8
            local.get 2
            local.get 1
            i32.load offset=12
            i32.store offset=12
            local.get 2
            local.get 1
            i32.load offset=16
            i32.store offset=16
            local.get 2
            local.get 1
            i32.load offset=20
            i32.store offset=20
            local.get 2
            local.get 1
            i32.load offset=24
            i32.store offset=24
            local.get 2
            local.get 1
            i32.load offset=28
            i32.store offset=28
            local.get 2
            local.get 1
            i32.load offset=32
            i32.store offset=32
            local.get 2
            local.get 1
            i32.load offset=36
            i32.store offset=36
            local.get 2
            local.get 1
            i32.load offset=40
            i32.store offset=40
            local.get 2
            local.get 1
            i32.load offset=44
            i32.store offset=44
            local.get 2
            local.get 1
            i32.load offset=48
            i32.store offset=48
            local.get 2
            local.get 1
            i32.load offset=52
            i32.store offset=52
            local.get 2
            local.get 1
            i32.load offset=56
            i32.store offset=56
            local.get 2
            local.get 1
            i32.load offset=60
            i32.store offset=60
            local.get 1
            i32.const -64
            i32.sub
            local.set 1
            local.get 2
            i32.const -64
            i32.sub
            local.tee 2
            local.get 5
            i32.le_u
            br_if 0 (;@4;)
          end
        end
        local.get 2
        local.get 4
        i32.ge_u
        br_if 1 (;@1;)
        loop  ;; label = @3
          local.get 2
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          local.get 4
          i32.lt_u
          br_if 0 (;@3;)
        end
        br 1 (;@1;)
      end
      local.get 3
      i32.const 4
      i32.lt_u
      if  ;; label = @2
        local.get 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 3
      i32.const -4
      i32.add
      local.tee 4
      local.get 0
      i32.lt_u
      if  ;; label = @2
        local.get 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 1
        i32.load8_u
        i32.store8
        local.get 2
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 2
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 2
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        local.get 2
        i32.const 4
        i32.add
        local.tee 2
        local.get 4
        i32.le_u
        br_if 0 (;@2;)
      end
    end
    local.get 2
    local.get 3
    i32.lt_u
    if  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.get 1
        i32.load8_u
        i32.store8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        local.get 3
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $memset (type 1) (param i32 i32 i32) (result i32)
    (local i32 i64 i32 i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 5
      i32.add
      local.tee 3
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 3
      local.get 2
      local.get 5
      i32.sub
      i32.const -4
      i32.and
      local.tee 5
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 1
      i32.store
      local.get 5
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=8
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 1
      i32.store
      local.get 5
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=24
      local.get 3
      local.get 1
      i32.store offset=20
      local.get 3
      local.get 1
      i32.store offset=16
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 1
      i32.store
      local.get 5
      local.get 3
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 6
      i32.sub
      local.tee 2
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      local.tee 4
      i64.const 32
      i64.shl
      local.get 4
      i64.or
      local.set 4
      local.get 3
      local.get 6
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 4
        i64.store offset=24
        local.get 1
        local.get 4
        i64.store offset=16
        local.get 1
        local.get 4
        i64.store offset=8
        local.get 1
        local.get 4
        i64.store
        local.get 1
        i32.const 32
        i32.add
        local.set 1
        local.get 2
        i32.const -32
        i32.add
        local.tee 2
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $__stdio_write (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 0
    i32.load offset=28
    local.tee 4
    i32.store offset=16
    local.get 0
    i32.load offset=20
    local.set 5
    local.get 3
    local.get 2
    i32.store offset=28
    local.get 3
    local.get 1
    i32.store offset=24
    local.get 3
    local.get 5
    local.get 4
    i32.sub
    local.tee 1
    i32.store offset=20
    local.get 1
    local.get 2
    i32.add
    local.set 6
    i32.const 2
    local.set 7
    local.get 3
    i32.const 16
    i32.add
    local.set 1
    block (result i32)  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=60
          local.get 3
          i32.const 16
          i32.add
          i32.const 2
          local.get 3
          i32.const 12
          i32.add
          call $__wasi_fd_write
          call $__wasi_syscall_ret
          i32.eqz
          if  ;; label = @4
            loop  ;; label = @5
              local.get 6
              local.get 3
              i32.load offset=12
              local.tee 4
              i32.eq
              br_if 2 (;@3;)
              local.get 4
              i32.const -1
              i32.le_s
              br_if 3 (;@2;)
              local.get 1
              local.get 4
              local.get 1
              i32.load offset=4
              local.tee 8
              i32.gt_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.add
              local.tee 9
              local.get 4
              local.get 8
              i32.const 0
              local.get 5
              select
              i32.sub
              local.tee 8
              local.get 9
              i32.load
              i32.add
              i32.store
              local.get 1
              i32.const 12
              i32.const 4
              local.get 5
              select
              i32.add
              local.tee 9
              local.get 9
              i32.load
              local.get 8
              i32.sub
              i32.store
              local.get 6
              local.get 4
              i32.sub
              local.set 6
              local.get 0
              i32.load offset=60
              local.get 1
              i32.const 8
              i32.add
              local.get 1
              local.get 5
              select
              local.tee 1
              local.get 7
              local.get 5
              i32.sub
              local.tee 7
              local.get 3
              i32.const 12
              i32.add
              call $__wasi_fd_write
              call $__wasi_syscall_ret
              i32.eqz
              br_if 0 (;@5;)
            end
          end
          local.get 6
          i32.const -1
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 0
        i32.load offset=44
        local.tee 1
        i32.store offset=28
        local.get 0
        local.get 1
        i32.store offset=20
        local.get 0
        local.get 1
        local.get 0
        i32.load offset=48
        i32.add
        i32.store offset=16
        local.get 2
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=28
      local.get 0
      i64.const 0
      i64.store offset=16
      local.get 0
      local.get 0
      i32.load
      i32.const 32
      i32.or
      i32.store
      i32.const 0
      local.tee 4
      local.get 7
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
      drop
      local.get 2
      local.get 1
      i32.load offset=4
      i32.sub
    end
    local.set 4
    local.get 3
    i32.const 32
    i32.add
    global.set 0
    local.get 4)
  (func $__emscripten_stdout_close (type 0) (param i32) (result i32)
    i32.const 0)
  (func $__emscripten_stdout_seek (type 5) (param i32 i64 i32) (result i64)
    i64.const 0)
  (func $memchr (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 2
    i32.const 0
    i32.ne
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          local.set 4
          loop  ;; label = @4
            local.get 0
            i32.load8_u
            local.get 4
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            i32.const 0
            i32.ne
            local.set 3
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.const 3
            i32.and
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 0 (;@2;)
        local.get 2
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 255
        i32.and
        i32.const 16843009
        i32.mul
        local.set 4
        loop  ;; label = @3
          local.get 0
          i32.load
          local.get 4
          i32.xor
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 2
          i32.const -4
          i32.add
          local.tee 2
          i32.const 3
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 255
      i32.and
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.get 0
        i32.load8_u
        i32.eq
        if  ;; label = @3
          local.get 0
          return
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    i32.const 0)
  (func $pthread_self (type 4) (result i32)
    i32.const 1772)
  (func $wcrtomb (type 1) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 0
      if  ;; label = @2
        local.get 1
        i32.const 127
        i32.le_u
        br_if 1 (;@1;)
        block  ;; label = @3
          call $__pthread_self
          i32.load offset=176
          i32.load
          i32.eqz
          if  ;; label = @4
            local.get 1
            i32.const -128
            i32.and
            i32.const 57216
            i32.eq
            br_if 3 (;@1;)
            br 1 (;@3;)
          end
          local.get 1
          i32.const 2047
          i32.le_u
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=1
            local.get 0
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 192
            i32.or
            i32.store8
            i32.const 2
            return
          end
          local.get 1
          i32.const 55296
          i32.ge_u
          i32.const 0
          local.get 1
          i32.const -8192
          i32.and
          i32.const 57344
          i32.ne
          select
          i32.eqz
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=2
            local.get 0
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8
            local.get 0
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=1
            i32.const 3
            return
          end
          local.get 1
          i32.const -65536
          i32.add
          i32.const 1048575
          i32.le_u
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=3
            local.get 0
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 240
            i32.or
            i32.store8
            local.get 0
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=2
            local.get 0
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=1
            i32.const 4
            return
          end
        end
        call $__errno_location
        i32.const 25
        i32.store
        i32.const -1
        local.set 3
      end
      local.get 3
      return
    end
    local.get 0
    local.get 1
    i32.store8
    i32.const 1)
  (func $__pthread_self (type 4) (result i32)
    call $pthread_self)
  (func $wctomb (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i32.const 0
    call $wcrtomb)
  (func $__lock (type 2) (param i32)
    nop)
  (func $__unlock (type 2) (param i32)
    nop)
  (func $__ofl_lock (type 4) (result i32)
    i32.const 3624
    call $__lock
    i32.const 3632)
  (func $__ofl_unlock (type 3)
    i32.const 3624
    call $__unlock)
  (func $__stdio_exit (type 3)
    (local i32)
    call $__ofl_lock
    i32.load
    local.tee 0
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        call $close_file
        local.get 0
        i32.load offset=56
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    i32.const 3636
    i32.load
    call $close_file
    i32.const 1768
    i32.load
    call $close_file)
  (func $close_file (type 2) (param i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=76
      i32.const 0
      i32.ge_s
      if  ;; label = @2
        local.get 0
        call $__lockfile
        drop
      end
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=28
      i32.gt_u
      if  ;; label = @2
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=36
        call_indirect (type 1)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=40
      call_indirect (type 5)
      drop
    end)
  (func $__towrite (type 0) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load8_u offset=74
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store8 offset=74
    local.get 0
    i32.load
    local.tee 1
    i32.const 8
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    local.get 0
    local.get 0
    i32.load offset=44
    local.tee 1
    i32.store offset=28
    local.get 0
    local.get 1
    i32.store offset=20
    local.get 0
    local.get 1
    local.get 0
    i32.load offset=48
    i32.add
    i32.store offset=16
    i32.const 0)
  (func $__fwritex (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block (result i32)  ;; label = @2
        local.get 2
        i32.load offset=16
        local.tee 3
        i32.eqz
        if  ;; label = @3
          local.get 2
          call $__towrite
          br_if 2 (;@1;)
          local.get 2
          i32.load offset=16
          local.set 3
        end
        local.get 3
        local.get 2
        i32.load offset=20
        local.tee 5
        i32.sub
        local.get 1
        i32.lt_u
      end
      if  ;; label = @2
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=36
        call_indirect (type 1)
        return
      end
      block  ;; label = @2
        local.get 2
        i32.load8_s offset=75
        i32.const 0
        i32.lt_s
        if  ;; label = @3
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 1
        local.set 4
        loop  ;; label = @3
          local.get 4
          local.tee 3
          i32.eqz
          if  ;; label = @4
            i32.const 0
            local.set 3
            br 2 (;@2;)
          end
          local.get 0
          local.get 3
          i32.const -1
          i32.add
          local.tee 4
          i32.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        local.get 3
        local.get 2
        i32.load offset=36
        call_indirect (type 1)
        local.tee 4
        local.get 3
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.add
        local.set 0
        local.get 1
        local.get 3
        i32.sub
        local.set 1
        local.get 2
        i32.load offset=20
        local.set 5
      end
      local.get 5
      local.get 0
      local.get 1
      call $memcpy
      drop
      local.get 2
      local.get 2
      i32.load offset=20
      local.get 1
      i32.add
      i32.store offset=20
      local.get 1
      local.get 3
      i32.add
      local.set 4
    end
    local.get 4)
  (func $__vfprintf_internal (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 208
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    local.get 2
    i32.store offset=204
    i32.const 0
    local.set 2
    local.get 5
    i32.const 160
    i32.add
    i32.const 0
    i32.const 40
    call $memset
    drop
    local.get 5
    local.get 5
    i32.load offset=204
    i32.store offset=200
    block  ;; label = @1
      i32.const 0
      local.get 1
      local.get 5
      i32.const 200
      i32.add
      local.get 5
      i32.const 80
      i32.add
      local.get 5
      i32.const 160
      i32.add
      local.get 3
      local.get 4
      call $printf_core
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        i32.const -1
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=76
      i32.const 0
      i32.ge_s
      if  ;; label = @2
        local.get 0
        call $__lockfile
        local.set 2
      end
      local.get 0
      i32.load
      local.set 6
      local.get 0
      i32.load8_s offset=74
      i32.const 0
      i32.le_s
      if  ;; label = @2
        local.get 0
        local.get 6
        i32.const -33
        i32.and
        i32.store
      end
      local.get 6
      i32.const 32
      i32.and
      local.set 6
      block (result i32)  ;; label = @2
        local.get 0
        i32.load offset=48
        if  ;; label = @3
          local.get 0
          local.get 1
          local.get 5
          i32.const 200
          i32.add
          local.get 5
          i32.const 80
          i32.add
          local.get 5
          i32.const 160
          i32.add
          local.get 3
          local.get 4
          call $printf_core
          br 1 (;@2;)
        end
        local.get 0
        i32.const 80
        i32.store offset=48
        local.get 0
        local.get 5
        i32.const 80
        i32.add
        i32.store offset=16
        local.get 0
        local.get 5
        i32.store offset=28
        local.get 0
        local.get 5
        i32.store offset=20
        local.get 0
        i32.load offset=44
        local.set 7
        local.get 0
        local.get 5
        i32.store offset=44
        local.get 0
        local.get 1
        local.get 5
        i32.const 200
        i32.add
        local.get 5
        i32.const 80
        i32.add
        local.get 5
        i32.const 160
        i32.add
        local.get 3
        local.get 4
        call $printf_core
        local.tee 1
        local.get 7
        i32.eqz
        br_if 0 (;@2;)
        drop
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=36
        call_indirect (type 1)
        drop
        local.get 0
        i32.const 0
        i32.store offset=48
        local.get 0
        local.get 7
        i32.store offset=44
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 0
        i32.const 0
        i32.store offset=16
        local.get 0
        i32.load offset=20
        local.set 3
        local.get 0
        i32.const 0
        i32.store offset=20
        local.get 1
        i32.const -1
        local.get 3
        select
      end
      local.set 1
      local.get 0
      local.get 0
      i32.load
      local.tee 3
      local.get 6
      i32.or
      i32.store
      i32.const -1
      local.get 1
      local.get 3
      i32.const 32
      i32.and
      select
      local.set 1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $__unlockfile
    end
    local.get 5
    i32.const 208
    i32.add
    global.set 0
    local.get 1)
  (func $printf_core (type 14) (param i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 7
    global.set 0
    local.get 7
    local.get 1
    i32.store offset=76
    local.get 7
    i32.const 55
    i32.add
    local.set 22
    local.get 7
    i32.const 56
    i32.add
    local.set 18
    i32.const 0
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 16
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 1
          i32.const 2147483647
          local.get 16
          i32.sub
          i32.gt_s
          if  ;; label = @4
            call $__errno_location
            i32.const 61
            i32.store
            i32.const -1
            local.set 16
            br 1 (;@3;)
          end
          local.get 1
          local.get 16
          i32.add
          local.set 16
        end
        local.get 7
        i32.load offset=76
        local.tee 11
        local.set 1
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 11
                i32.load8_u
                local.tee 8
                if  ;; label = @7
                  loop  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 8
                        i32.const 255
                        i32.and
                        local.tee 8
                        i32.eqz
                        if  ;; label = @11
                          local.get 1
                          local.set 8
                          br 1 (;@10;)
                        end
                        local.get 8
                        i32.const 37
                        i32.ne
                        br_if 1 (;@9;)
                        local.get 1
                        local.set 8
                        loop  ;; label = @11
                          local.get 1
                          i32.load8_u offset=1
                          i32.const 37
                          i32.ne
                          br_if 1 (;@10;)
                          local.get 7
                          local.get 1
                          i32.const 2
                          i32.add
                          local.tee 9
                          i32.store offset=76
                          local.get 8
                          i32.const 1
                          i32.add
                          local.set 8
                          local.get 1
                          i32.load8_u offset=2
                          local.set 12
                          local.get 9
                          local.set 1
                          local.get 12
                          i32.const 37
                          i32.eq
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 8
                      local.get 11
                      i32.sub
                      local.set 1
                      local.get 0
                      if  ;; label = @10
                        local.get 0
                        local.get 11
                        local.get 1
                        call $out
                      end
                      local.get 1
                      br_if 7 (;@2;)
                      local.get 7
                      i32.load offset=76
                      i32.load8_s offset=1
                      call $isdigit
                      local.set 1
                      local.get 7
                      i32.load offset=76
                      local.set 8
                      local.get 7
                      block (result i32)  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 8
                          i32.load8_u offset=2
                          i32.const 36
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 8
                          i32.load8_s offset=1
                          i32.const -48
                          i32.add
                          local.set 17
                          i32.const 1
                          local.set 20
                          local.get 8
                          i32.const 3
                          i32.add
                          br 1 (;@10;)
                        end
                        i32.const -1
                        local.set 17
                        local.get 8
                        i32.const 1
                        i32.add
                      end
                      local.tee 1
                      i32.store offset=76
                      i32.const 0
                      local.set 14
                      block  ;; label = @10
                        local.get 1
                        i32.load8_s
                        local.tee 12
                        i32.const -32
                        i32.add
                        local.tee 9
                        i32.const 31
                        i32.gt_u
                        if  ;; label = @11
                          local.get 1
                          local.set 8
                          br 1 (;@10;)
                        end
                        local.get 1
                        local.set 8
                        i32.const 1
                        local.get 9
                        i32.shl
                        local.tee 9
                        i32.const 75913
                        i32.and
                        i32.eqz
                        br_if 0 (;@10;)
                        loop  ;; label = @11
                          local.get 7
                          local.get 1
                          i32.const 1
                          i32.add
                          local.tee 8
                          i32.store offset=76
                          local.get 9
                          local.get 14
                          i32.or
                          local.set 14
                          local.get 1
                          i32.load8_s offset=1
                          local.tee 12
                          i32.const -32
                          i32.add
                          local.tee 9
                          i32.const 32
                          i32.ge_u
                          br_if 1 (;@10;)
                          local.get 8
                          local.set 1
                          i32.const 1
                          local.get 9
                          i32.shl
                          local.tee 9
                          i32.const 75913
                          i32.and
                          br_if 0 (;@11;)
                        end
                      end
                      block  ;; label = @10
                        local.get 12
                        i32.const 42
                        i32.eq
                        if  ;; label = @11
                          local.get 7
                          block (result i32)  ;; label = @12
                            block  ;; label = @13
                              local.get 8
                              i32.load8_s offset=1
                              call $isdigit
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 7
                              i32.load offset=76
                              local.tee 8
                              i32.load8_u offset=2
                              i32.const 36
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 8
                              i32.load8_s offset=1
                              i32.const 2
                              i32.shl
                              local.get 4
                              i32.add
                              i32.const -192
                              i32.add
                              i32.const 10
                              i32.store
                              local.get 8
                              i32.load8_s offset=1
                              i32.const 3
                              i32.shl
                              local.get 3
                              i32.add
                              i32.const -384
                              i32.add
                              i32.load
                              local.set 15
                              i32.const 1
                              local.set 20
                              local.get 8
                              i32.const 3
                              i32.add
                              br 1 (;@12;)
                            end
                            local.get 20
                            br_if 6 (;@6;)
                            i32.const 0
                            local.set 20
                            i32.const 0
                            local.set 15
                            local.get 0
                            if  ;; label = @13
                              local.get 2
                              local.get 2
                              i32.load
                              local.tee 1
                              i32.const 4
                              i32.add
                              i32.store
                              local.get 1
                              i32.load
                              local.set 15
                            end
                            local.get 7
                            i32.load offset=76
                            i32.const 1
                            i32.add
                          end
                          local.tee 1
                          i32.store offset=76
                          local.get 15
                          i32.const -1
                          i32.gt_s
                          br_if 1 (;@10;)
                          i32.const 0
                          local.get 15
                          i32.sub
                          local.set 15
                          local.get 14
                          i32.const 8192
                          i32.or
                          local.set 14
                          br 1 (;@10;)
                        end
                        local.get 7
                        i32.const 76
                        i32.add
                        call $getint
                        local.tee 15
                        i32.const 0
                        i32.lt_s
                        br_if 4 (;@6;)
                        local.get 7
                        i32.load offset=76
                        local.set 1
                      end
                      i32.const -1
                      local.set 10
                      block  ;; label = @10
                        local.get 1
                        i32.load8_u
                        i32.const 46
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 1
                        i32.load8_u offset=1
                        i32.const 42
                        i32.eq
                        if  ;; label = @11
                          block  ;; label = @12
                            local.get 1
                            i32.load8_s offset=2
                            call $isdigit
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 7
                            i32.load offset=76
                            local.tee 1
                            i32.load8_u offset=3
                            i32.const 36
                            i32.ne
                            br_if 0 (;@12;)
                            local.get 1
                            i32.load8_s offset=2
                            i32.const 2
                            i32.shl
                            local.get 4
                            i32.add
                            i32.const -192
                            i32.add
                            i32.const 10
                            i32.store
                            local.get 1
                            i32.load8_s offset=2
                            i32.const 3
                            i32.shl
                            local.get 3
                            i32.add
                            i32.const -384
                            i32.add
                            i32.load
                            local.set 10
                            local.get 7
                            local.get 1
                            i32.const 4
                            i32.add
                            local.tee 1
                            i32.store offset=76
                            br 2 (;@10;)
                          end
                          local.get 20
                          br_if 5 (;@6;)
                          local.get 0
                          if (result i32)  ;; label = @12
                            local.get 2
                            local.get 2
                            i32.load
                            local.tee 1
                            i32.const 4
                            i32.add
                            i32.store
                            local.get 1
                            i32.load
                          else
                            i32.const 0
                          end
                          local.set 10
                          local.get 7
                          local.get 7
                          i32.load offset=76
                          i32.const 2
                          i32.add
                          local.tee 1
                          i32.store offset=76
                          br 1 (;@10;)
                        end
                        local.get 7
                        local.get 1
                        i32.const 1
                        i32.add
                        i32.store offset=76
                        local.get 7
                        i32.const 76
                        i32.add
                        call $getint
                        local.set 10
                        local.get 7
                        i32.load offset=76
                        local.set 1
                      end
                      i32.const 0
                      local.set 8
                      loop  ;; label = @10
                        local.get 8
                        local.set 9
                        i32.const -1
                        local.set 13
                        local.get 1
                        i32.load8_s
                        i32.const -65
                        i32.add
                        i32.const 57
                        i32.gt_u
                        br_if 9 (;@1;)
                        local.get 7
                        local.get 1
                        i32.const 1
                        i32.add
                        local.tee 12
                        i32.store offset=76
                        local.get 1
                        i32.load8_s
                        local.set 8
                        local.get 12
                        local.set 1
                        local.get 8
                        local.get 9
                        i32.const 58
                        i32.mul
                        i32.add
                        i32.const 1071
                        i32.add
                        i32.load8_u
                        local.tee 8
                        i32.const -1
                        i32.add
                        i32.const 8
                        i32.lt_u
                        br_if 0 (;@10;)
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 8
                          i32.const 19
                          i32.ne
                          if  ;; label = @12
                            local.get 8
                            i32.eqz
                            br_if 11 (;@1;)
                            local.get 17
                            i32.const 0
                            i32.ge_s
                            if  ;; label = @13
                              local.get 4
                              local.get 17
                              i32.const 2
                              i32.shl
                              i32.add
                              local.get 8
                              i32.store
                              local.get 7
                              local.get 3
                              local.get 17
                              i32.const 3
                              i32.shl
                              i32.add
                              i64.load
                              i64.store offset=64
                              br 2 (;@11;)
                            end
                            local.get 0
                            i32.eqz
                            br_if 9 (;@3;)
                            local.get 7
                            i32.const -64
                            i32.sub
                            local.get 8
                            local.get 2
                            local.get 6
                            call $pop_arg
                            local.get 7
                            i32.load offset=76
                            local.set 12
                            br 2 (;@10;)
                          end
                          local.get 17
                          i32.const -1
                          i32.gt_s
                          br_if 10 (;@1;)
                        end
                        i32.const 0
                        local.set 1
                        local.get 0
                        i32.eqz
                        br_if 8 (;@2;)
                      end
                      local.get 14
                      i32.const -65537
                      i32.and
                      local.tee 21
                      local.get 14
                      local.get 14
                      i32.const 8192
                      i32.and
                      select
                      local.set 8
                      i32.const 0
                      local.set 13
                      i32.const 1108
                      local.set 17
                      local.get 18
                      local.set 14
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block (result i32)  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block (result i32)  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      local.get 12
                                                      i32.const -1
                                                      i32.add
                                                      i32.load8_s
                                                      local.tee 1
                                                      i32.const -33
                                                      i32.and
                                                      local.get 1
                                                      local.get 1
                                                      i32.const 15
                                                      i32.and
                                                      i32.const 3
                                                      i32.eq
                                                      select
                                                      local.get 1
                                                      local.get 9
                                                      select
                                                      local.tee 1
                                                      i32.const -88
                                                      i32.add
                                                      br_table 4 (;@21;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 14 (;@11;) 21 (;@4;) 15 (;@10;) 6 (;@19;) 14 (;@11;) 14 (;@11;) 14 (;@11;) 21 (;@4;) 6 (;@19;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 2 (;@23;) 5 (;@20;) 3 (;@22;) 21 (;@4;) 21 (;@4;) 9 (;@16;) 21 (;@4;) 1 (;@24;) 21 (;@4;) 21 (;@4;) 4 (;@21;) 0 (;@25;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 1
                                                      i32.const -65
                                                      i32.add
                                                      br_table 14 (;@11;) 21 (;@4;) 11 (;@14;) 21 (;@4;) 14 (;@11;) 14 (;@11;) 14 (;@11;) 0 (;@25;)
                                                    end
                                                    local.get 1
                                                    i32.const 83
                                                    i32.eq
                                                    br_if 9 (;@15;)
                                                    br 19 (;@5;)
                                                  end
                                                  local.get 7
                                                  i64.load offset=64
                                                  local.set 19
                                                  i32.const 1108
                                                  br 5 (;@18;)
                                                end
                                                i32.const 0
                                                local.set 1
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              local.get 9
                                                              i32.const 255
                                                              i32.and
                                                              br_table 0 (;@29;) 1 (;@28;) 2 (;@27;) 3 (;@26;) 4 (;@25;) 27 (;@2;) 5 (;@24;) 6 (;@23;) 27 (;@2;)
                                                            end
                                                            local.get 7
                                                            i32.load offset=64
                                                            local.get 16
                                                            i32.store
                                                            br 26 (;@2;)
                                                          end
                                                          local.get 7
                                                          i32.load offset=64
                                                          local.get 16
                                                          i32.store
                                                          br 25 (;@2;)
                                                        end
                                                        local.get 7
                                                        i32.load offset=64
                                                        local.get 16
                                                        i64.extend_i32_s
                                                        i64.store
                                                        br 24 (;@2;)
                                                      end
                                                      local.get 7
                                                      i32.load offset=64
                                                      local.get 16
                                                      i32.store16
                                                      br 23 (;@2;)
                                                    end
                                                    local.get 7
                                                    i32.load offset=64
                                                    local.get 16
                                                    i32.store8
                                                    br 22 (;@2;)
                                                  end
                                                  local.get 7
                                                  i32.load offset=64
                                                  local.get 16
                                                  i32.store
                                                  br 21 (;@2;)
                                                end
                                                local.get 7
                                                i32.load offset=64
                                                local.get 16
                                                i64.extend_i32_s
                                                i64.store
                                                br 20 (;@2;)
                                              end
                                              local.get 10
                                              i32.const 8
                                              local.get 10
                                              i32.const 8
                                              i32.gt_u
                                              select
                                              local.set 10
                                              local.get 8
                                              i32.const 8
                                              i32.or
                                              local.set 8
                                              i32.const 120
                                              local.set 1
                                            end
                                            local.get 7
                                            i64.load offset=64
                                            local.get 18
                                            local.get 1
                                            i32.const 32
                                            i32.and
                                            call $fmt_x
                                            local.set 11
                                            local.get 8
                                            i32.const 8
                                            i32.and
                                            i32.eqz
                                            br_if 3 (;@17;)
                                            local.get 7
                                            i64.load offset=64
                                            i64.eqz
                                            br_if 3 (;@17;)
                                            local.get 1
                                            i32.const 4
                                            i32.shr_u
                                            i32.const 1108
                                            i32.add
                                            local.set 17
                                            i32.const 2
                                            local.set 13
                                            br 3 (;@17;)
                                          end
                                          local.get 7
                                          i64.load offset=64
                                          local.get 18
                                          call $fmt_o
                                          local.set 11
                                          local.get 8
                                          i32.const 8
                                          i32.and
                                          i32.eqz
                                          br_if 2 (;@17;)
                                          local.get 10
                                          local.get 18
                                          local.get 11
                                          i32.sub
                                          local.tee 1
                                          i32.const 1
                                          i32.add
                                          local.get 10
                                          local.get 1
                                          i32.gt_s
                                          select
                                          local.set 10
                                          br 2 (;@17;)
                                        end
                                        local.get 7
                                        i64.load offset=64
                                        local.tee 19
                                        i64.const -1
                                        i64.le_s
                                        if  ;; label = @19
                                          local.get 7
                                          i64.const 0
                                          local.get 19
                                          i64.sub
                                          local.tee 19
                                          i64.store offset=64
                                          i32.const 1
                                          local.set 13
                                          i32.const 1108
                                          br 1 (;@18;)
                                        end
                                        local.get 8
                                        i32.const 2048
                                        i32.and
                                        if  ;; label = @19
                                          i32.const 1
                                          local.set 13
                                          i32.const 1109
                                          br 1 (;@18;)
                                        end
                                        i32.const 1110
                                        i32.const 1108
                                        local.get 8
                                        i32.const 1
                                        i32.and
                                        local.tee 13
                                        select
                                      end
                                      local.set 17
                                      local.get 19
                                      local.get 18
                                      call $fmt_u
                                      local.set 11
                                    end
                                    local.get 8
                                    i32.const -65537
                                    i32.and
                                    local.get 8
                                    local.get 10
                                    i32.const -1
                                    i32.gt_s
                                    select
                                    local.set 8
                                    local.get 7
                                    i64.load offset=64
                                    local.set 19
                                    block  ;; label = @17
                                      local.get 10
                                      br_if 0 (;@17;)
                                      local.get 19
                                      i64.eqz
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 10
                                      local.get 18
                                      local.set 11
                                      br 12 (;@5;)
                                    end
                                    local.get 10
                                    local.get 19
                                    i64.eqz
                                    local.get 18
                                    local.get 11
                                    i32.sub
                                    i32.add
                                    local.tee 1
                                    local.get 10
                                    local.get 1
                                    i32.gt_s
                                    select
                                    local.set 10
                                    br 11 (;@5;)
                                  end
                                  local.get 7
                                  i32.load offset=64
                                  local.tee 1
                                  i32.const 1118
                                  local.get 1
                                  select
                                  local.tee 11
                                  i32.const 0
                                  local.get 10
                                  call $memchr
                                  local.tee 1
                                  local.get 10
                                  local.get 11
                                  i32.add
                                  local.get 1
                                  select
                                  local.set 14
                                  local.get 21
                                  local.set 8
                                  local.get 1
                                  local.get 11
                                  i32.sub
                                  local.get 10
                                  local.get 1
                                  select
                                  local.set 10
                                  br 11 (;@4;)
                                end
                                local.get 10
                                if  ;; label = @15
                                  local.get 7
                                  i32.load offset=64
                                  br 2 (;@13;)
                                end
                                i32.const 0
                                local.set 1
                                local.get 0
                                i32.const 32
                                local.get 15
                                i32.const 0
                                local.get 8
                                call $pad
                                br 2 (;@12;)
                              end
                              local.get 7
                              i32.const 0
                              i32.store offset=12
                              local.get 7
                              local.get 7
                              i64.load offset=64
                              i64.store32 offset=8
                              local.get 7
                              local.get 7
                              i32.const 8
                              i32.add
                              i32.store offset=64
                              i32.const -1
                              local.set 10
                              local.get 7
                              i32.const 8
                              i32.add
                            end
                            local.set 9
                            i32.const 0
                            local.set 1
                            block  ;; label = @13
                              loop  ;; label = @14
                                local.get 9
                                i32.load
                                local.tee 12
                                i32.eqz
                                br_if 1 (;@13;)
                                block  ;; label = @15
                                  local.get 7
                                  i32.const 4
                                  i32.add
                                  local.get 12
                                  call $wctomb
                                  local.tee 12
                                  i32.const 0
                                  i32.lt_s
                                  local.tee 11
                                  br_if 0 (;@15;)
                                  local.get 12
                                  local.get 10
                                  local.get 1
                                  i32.sub
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  local.get 9
                                  i32.const 4
                                  i32.add
                                  local.set 9
                                  local.get 10
                                  local.get 1
                                  local.get 12
                                  i32.add
                                  local.tee 1
                                  i32.gt_u
                                  br_if 1 (;@14;)
                                  br 2 (;@13;)
                                end
                              end
                              i32.const -1
                              local.set 13
                              local.get 11
                              br_if 12 (;@1;)
                            end
                            local.get 0
                            i32.const 32
                            local.get 15
                            local.get 1
                            local.get 8
                            call $pad
                            local.get 1
                            i32.eqz
                            if  ;; label = @13
                              i32.const 0
                              local.set 1
                              br 1 (;@12;)
                            end
                            i32.const 0
                            local.set 12
                            local.get 7
                            i32.load offset=64
                            local.set 9
                            loop  ;; label = @13
                              local.get 9
                              i32.load
                              local.tee 11
                              i32.eqz
                              br_if 1 (;@12;)
                              local.get 7
                              i32.const 4
                              i32.add
                              local.get 11
                              call $wctomb
                              local.tee 11
                              local.get 12
                              i32.add
                              local.tee 12
                              local.get 1
                              i32.gt_s
                              br_if 1 (;@12;)
                              local.get 0
                              local.get 7
                              i32.const 4
                              i32.add
                              local.get 11
                              call $out
                              local.get 9
                              i32.const 4
                              i32.add
                              local.set 9
                              local.get 12
                              local.get 1
                              i32.lt_u
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 0
                          i32.const 32
                          local.get 15
                          local.get 1
                          local.get 8
                          i32.const 8192
                          i32.xor
                          call $pad
                          local.get 15
                          local.get 1
                          local.get 15
                          local.get 1
                          i32.gt_s
                          select
                          local.set 1
                          br 9 (;@2;)
                        end
                        local.get 0
                        local.get 7
                        f64.load offset=64
                        local.get 15
                        local.get 10
                        local.get 8
                        local.get 1
                        local.get 5
                        call_indirect (type 15)
                        local.set 1
                        br 8 (;@2;)
                      end
                      local.get 7
                      local.get 7
                      i64.load offset=64
                      i64.store8 offset=55
                      i32.const 1
                      local.set 10
                      local.get 22
                      local.set 11
                      local.get 21
                      local.set 8
                      br 5 (;@4;)
                    end
                    local.get 7
                    local.get 1
                    i32.const 1
                    i32.add
                    local.tee 9
                    i32.store offset=76
                    local.get 1
                    i32.load8_u offset=1
                    local.set 8
                    local.get 9
                    local.set 1
                    br 0 (;@8;)
                  end
                  unreachable
                end
                local.get 16
                local.set 13
                local.get 0
                br_if 5 (;@1;)
                local.get 20
                i32.eqz
                br_if 3 (;@3;)
                i32.const 1
                local.set 1
                loop  ;; label = @7
                  local.get 4
                  local.get 1
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  local.tee 8
                  if  ;; label = @8
                    local.get 3
                    local.get 1
                    i32.const 3
                    i32.shl
                    i32.add
                    local.get 8
                    local.get 2
                    local.get 6
                    call $pop_arg
                    i32.const 1
                    local.set 13
                    local.get 1
                    i32.const 1
                    i32.add
                    local.tee 1
                    i32.const 10
                    i32.ne
                    br_if 1 (;@7;)
                    br 7 (;@1;)
                  end
                end
                i32.const 1
                local.set 13
                local.get 1
                i32.const 10
                i32.ge_u
                br_if 5 (;@1;)
                loop  ;; label = @7
                  local.get 4
                  local.get 1
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  br_if 1 (;@6;)
                  local.get 1
                  i32.const 1
                  i32.add
                  local.tee 1
                  i32.const 10
                  i32.ne
                  br_if 0 (;@7;)
                end
                br 5 (;@1;)
              end
              i32.const -1
              local.set 13
              br 4 (;@1;)
            end
          end
          local.get 0
          i32.const 32
          local.get 13
          local.get 14
          local.get 11
          i32.sub
          local.tee 12
          local.get 10
          local.get 10
          local.get 12
          i32.lt_s
          select
          local.tee 14
          i32.add
          local.tee 9
          local.get 15
          local.get 15
          local.get 9
          i32.lt_s
          select
          local.tee 1
          local.get 9
          local.get 8
          call $pad
          local.get 0
          local.get 17
          local.get 13
          call $out
          local.get 0
          i32.const 48
          local.get 1
          local.get 9
          local.get 8
          i32.const 65536
          i32.xor
          call $pad
          local.get 0
          i32.const 48
          local.get 14
          local.get 12
          i32.const 0
          call $pad
          local.get 0
          local.get 11
          local.get 12
          call $out
          local.get 0
          i32.const 32
          local.get 1
          local.get 9
          local.get 8
          i32.const 8192
          i32.xor
          call $pad
          br 1 (;@2;)
        end
      end
      i32.const 0
      local.set 13
    end
    local.get 7
    i32.const 80
    i32.add
    global.set 0
    local.get 13)
  (func $out (type 9) (param i32 i32 i32)
    local.get 0
    i32.load8_u
    i32.const 32
    i32.and
    i32.eqz
    if  ;; label = @1
      local.get 1
      local.get 2
      local.get 0
      call $__fwritex
      drop
    end)
  (func $getint (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.load
    i32.load8_s
    call $isdigit
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load
        local.tee 2
        i32.load8_s
        local.set 3
        local.get 0
        local.get 2
        i32.const 1
        i32.add
        i32.store
        local.get 3
        local.get 1
        i32.const 10
        i32.mul
        i32.add
        i32.const -48
        i32.add
        local.set 1
        local.get 2
        i32.load8_s offset=1
        call $isdigit
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func $pop_arg (type 10) (param i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 20
      i32.gt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          i32.const -9
                          i32.add
                          br_table 0 (;@11;) 1 (;@10;) 2 (;@9;) 3 (;@8;) 4 (;@7;) 5 (;@6;) 6 (;@5;) 7 (;@4;) 8 (;@3;) 9 (;@2;) 10 (;@1;)
                        end
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 0
                        local.get 1
                        i32.load
                        i32.store
                        return
                      end
                      local.get 2
                      local.get 2
                      i32.load
                      local.tee 1
                      i32.const 4
                      i32.add
                      i32.store
                      local.get 0
                      local.get 1
                      i64.load32_s
                      i64.store
                      return
                    end
                    local.get 2
                    local.get 2
                    i32.load
                    local.tee 1
                    i32.const 4
                    i32.add
                    i32.store
                    local.get 0
                    local.get 1
                    i64.load32_u
                    i64.store
                    return
                  end
                  local.get 2
                  local.get 2
                  i32.load
                  i32.const 7
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee 1
                  i32.const 8
                  i32.add
                  i32.store
                  local.get 0
                  local.get 1
                  i64.load
                  i64.store
                  return
                end
                local.get 2
                local.get 2
                i32.load
                local.tee 1
                i32.const 4
                i32.add
                i32.store
                local.get 0
                local.get 1
                i64.load16_s
                i64.store
                return
              end
              local.get 2
              local.get 2
              i32.load
              local.tee 1
              i32.const 4
              i32.add
              i32.store
              local.get 0
              local.get 1
              i64.load16_u
              i64.store
              return
            end
            local.get 2
            local.get 2
            i32.load
            local.tee 1
            i32.const 4
            i32.add
            i32.store
            local.get 0
            local.get 1
            i64.load8_s
            i64.store
            return
          end
          local.get 2
          local.get 2
          i32.load
          local.tee 1
          i32.const 4
          i32.add
          i32.store
          local.get 0
          local.get 1
          i64.load8_u
          i64.store
          return
        end
        local.get 2
        local.get 2
        i32.load
        i32.const 7
        i32.add
        i32.const -8
        i32.and
        local.tee 1
        i32.const 8
        i32.add
        i32.store
        local.get 0
        local.get 1
        f64.load
        f64.store
        return
      end
      local.get 0
      local.get 2
      local.get 3
      call_indirect (type 8)
    end)
  (func $fmt_x (type 16) (param i64 i32 i32) (result i32)
    local.get 0
    i64.eqz
    i32.eqz
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        i32.wrap_i64
        i32.const 15
        i32.and
        i32.const 1600
        i32.add
        i32.load8_u
        local.get 2
        i32.or
        i32.store8
        local.get 0
        i64.const 4
        i64.shr_u
        local.tee 0
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func $fmt_o (type 7) (param i64 i32) (result i32)
    local.get 0
    i64.eqz
    i32.eqz
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        i32.wrap_i64
        i32.const 7
        i32.and
        i32.const 48
        i32.or
        i32.store8
        local.get 0
        i64.const 3
        i64.shr_u
        local.tee 0
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func $fmt_u (type 7) (param i64 i32) (result i32)
    (local i32 i64 i32 i32)
    block  ;; label = @1
      local.get 0
      i64.const 4294967296
      i64.lt_u
      if  ;; label = @2
        local.get 0
        local.set 3
        br 1 (;@1;)
      end
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        local.get 0
        i64.const 10
        i64.div_u
        local.tee 3
        i64.const 10
        i64.mul
        i64.sub
        i32.wrap_i64
        i32.const 48
        i32.or
        i32.store8
        local.get 0
        i64.const 42949672959
        i64.gt_u
        local.set 2
        local.get 3
        local.set 0
        local.get 2
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.wrap_i64
    local.tee 2
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 2
        local.get 2
        i32.const 10
        i32.div_u
        local.tee 4
        i32.const 10
        i32.mul
        i32.sub
        i32.const 48
        i32.or
        i32.store8
        local.get 2
        i32.const 9
        i32.gt_u
        local.set 5
        local.get 4
        local.set 2
        local.get 5
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func $pad (type 11) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 256
    i32.sub
    local.tee 5
    global.set 0
    block  ;; label = @1
      local.get 2
      local.get 3
      i32.le_s
      br_if 0 (;@1;)
      local.get 4
      i32.const 73728
      i32.and
      br_if 0 (;@1;)
      local.get 5
      local.get 1
      i32.const 255
      i32.and
      local.get 2
      local.get 3
      i32.sub
      local.tee 2
      i32.const 256
      local.get 2
      i32.const 256
      i32.lt_u
      local.tee 3
      select
      call $memset
      drop
      local.get 3
      i32.eqz
      if  ;; label = @2
        loop  ;; label = @3
          local.get 0
          local.get 5
          i32.const 256
          call $out
          local.get 2
          i32.const -256
          i32.add
          local.tee 2
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 5
      local.get 2
      call $out
    end
    local.get 5
    i32.const 256
    i32.add
    global.set 0)
  (func $vfiprintf (type 1) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i32.const 0
    i32.const 0
    call $__vfprintf_internal)
  (func $iprintf (type 6) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.store offset=12
    i32.const 1104
    i32.load
    local.get 0
    local.get 1
    call $vfiprintf
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $__lockfile (type 0) (param i32) (result i32)
    i32.const 1)
  (func $__unlockfile (type 2) (param i32)
    nop)
  (func $stackSave (type 4) (result i32)
    global.get 0)
  (func $stackRestore (type 2) (param i32)
    local.get 0
    global.set 0)
  (func $stackAlloc (type 0) (param i32) (result i32)
    (local i32)
    global.get 0
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 1
    global.set 0
    local.get 1)
  (func $fflush (type 0) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      if  ;; label = @2
        local.get 0
        i32.load offset=76
        i32.const -1
        i32.le_s
        if  ;; label = @3
          local.get 0
          call $__fflush_unlocked
          return
        end
        local.get 0
        call $__lockfile
        local.set 2
        local.get 0
        call $__fflush_unlocked
        local.set 1
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        call $__unlockfile
        local.get 1
        return
      end
      i32.const 1768
      i32.load
      if  ;; label = @2
        i32.const 1768
        i32.load
        call $fflush
        local.set 1
      end
      call $__ofl_lock
      i32.load
      local.tee 0
      if  ;; label = @2
        loop  ;; label = @3
          i32.const 0
          local.set 2
          local.get 0
          i32.load offset=76
          i32.const 0
          i32.ge_s
          if  ;; label = @4
            local.get 0
            call $__lockfile
            local.set 2
          end
          local.get 0
          i32.load offset=20
          local.get 0
          i32.load offset=28
          i32.gt_u
          if  ;; label = @4
            local.get 0
            call $__fflush_unlocked
            local.get 1
            i32.or
            local.set 1
          end
          local.get 2
          if  ;; label = @4
            local.get 0
            call $__unlockfile
          end
          local.get 0
          i32.load offset=56
          local.tee 0
          br_if 0 (;@3;)
        end
      end
      call $__ofl_unlock
    end
    local.get 1)
  (func $__fflush_unlocked (type 0) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=28
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 1)
      drop
      local.get 0
      i32.load offset=20
      br_if 0 (;@1;)
      i32.const -1
      return
    end
    local.get 0
    i32.load offset=4
    local.tee 1
    local.get 0
    i32.load offset=8
    local.tee 2
    i32.lt_u
    if  ;; label = @1
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=40
      call_indirect (type 5)
      drop
    end
    local.get 0
    i32.const 0
    i32.store offset=28
    local.get 0
    i64.const 0
    i64.store offset=16
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    i32.const 0)
  (table (;0;) 6 6 funcref)
  (memory (;0;) 256 256)
  (global (;0;) (mut i32) (i32.const 5246528))
  (global (;1;) i32 (i32.const 3640))
  (export "memory" (memory 0))
  (export "__indirect_function_table" (table 0))
  (export "_start" (func $_start))
  (export "__errno_location" (func $__errno_location))
  (export "fflush" (func $fflush))
  (export "stackSave" (func $stackSave))
  (export "stackRestore" (func $stackRestore))
  (export "stackAlloc" (func $stackAlloc))
  (export "__data_end" (global 1))
  (elem (;0;) (i32.const 1) func $_black_box $__wasm_call_ctors $__emscripten_stdout_close $__stdio_write $__emscripten_stdout_seek)
  (data (;0;) (i32.const 1024) "[ctype] running with str_size = %zu for %d iterations\0a\00[ctype] returned: %s\0a\00\00\00\00X\06\00\00-+   0X0x\00(null)")
  (data (;1;) (i32.const 1136) "\11\00\0a\00\11\11\11\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\11\00\0f\0a\11\11\11\03\0a\07\00\01\00\09\0b\0b\00\00\09\06\0b\00\00\0b\00\06\11\00\00\00\11\11\11")
  (data (;2;) (i32.const 1217) "\0b\00\00\00\00\00\00\00\00\11\00\0a\0a\11\11\11\00\0a\00\00\02\00\09\0b\00\00\00\09\00\0b\00\00\0b")
  (data (;3;) (i32.const 1275) "\0c")
  (data (;4;) (i32.const 1287) "\0c\00\00\00\00\0c\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c")
  (data (;5;) (i32.const 1333) "\0e")
  (data (;6;) (i32.const 1345) "\0d\00\00\00\04\0d\00\00\00\00\09\0e\00\00\00\00\00\0e\00\00\0e")
  (data (;7;) (i32.const 1391) "\10")
  (data (;8;) (i32.const 1403) "\0f\00\00\00\00\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\12\00\00\00\12\12\12")
  (data (;9;) (i32.const 1458) "\12\00\00\00\12\12\12\00\00\00\00\00\00\09")
  (data (;10;) (i32.const 1507) "\0b")
  (data (;11;) (i32.const 1519) "\0a\00\00\00\00\0a\00\00\00\00\09\0b\00\00\00\00\00\0b\00\00\0b")
  (data (;12;) (i32.const 1565) "\0c")
  (data (;13;) (i32.const 1577) "\0c\00\00\00\00\0c\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\000123456789ABCDEF")
  (data (;14;) (i32.const 1616) "\01\00\00\00@\0eP\00\05")
  (data (;15;) (i32.const 1636) "\03")
  (data (;16;) (i32.const 1660) "\04\00\00\00\05\00\00\00\e8\09\00\00\00\04")
  (data (;17;) (i32.const 1684) "\01")
  (data (;18;) (i32.const 1699) "\0a\ff\ff\ff\ff")
  (data (;19;) (i32.const 1768) "X\06")
  (data (;20;) (i32.const 1948) "\10\0e"))
