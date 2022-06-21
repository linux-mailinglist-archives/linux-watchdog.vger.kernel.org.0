Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A87E5538F9
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jun 2022 19:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbiFURgi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 13:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiFURgh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 13:36:37 -0400
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 063D02C673
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 10:36:35 -0700 (PDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25LHVvY1008537;
        Tue, 21 Jun 2022 12:31:57 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 25LHVtN5008531;
        Tue, 21 Jun 2022 12:31:55 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 21 Jun 2022 12:31:55 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Nathan Lynch <nathanl@linux.ibm.com>
Cc:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org, wvoigt@us.ibm.com, aik@ozlabs.ru,
        vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org,
        brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux@roeck-us.net
Subject: Re: [PATCH v2 1/4] powerpc/pseries: hvcall.h: add H_WATCHDOG opcode, H_NOOP return code
Message-ID: <20220621173155.GQ25951@gate.crashing.org>
References: <20220602175353.68942-1-cheloha@linux.ibm.com> <20220602175353.68942-2-cheloha@linux.ibm.com> <87a6a6nkit.fsf@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6a6nkit.fsf@linux.ibm.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi!

On Tue, Jun 21, 2022 at 09:44:42AM -0500, Nathan Lynch wrote:
> Not a problem to fix in your series, but I guess these should be
> parenthesized i.e.
> 
> #define H_P7		(-60)
> #define H_P8		(-61)
> #define H_P9		(-62)
> #define H_NOOP		(-63)

Why?  It does not change the semantics of any correct code.  For what
incorrect code will it make the diagnostics clearer?


Segher
