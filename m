Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6AD585085
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Jul 2022 15:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236461AbiG2NLN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Jul 2022 09:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236576AbiG2NKy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Jul 2022 09:10:54 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C073ED5B
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Jul 2022 06:10:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSYv2GSLz4x1h;
        Fri, 29 Jul 2022 23:10:43 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     linux-watchdog@vger.kernel.org,
        Scott Cheloha <cheloha@linux.ibm.com>
Cc:     mpe@ellerman.id.au, vaishnavi@linux.ibm.com, linux@roeck-us.net,
        npiggin@gmail.com, tzungbi@kernel.org, nathanl@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, wvoigt@us.ibm.com, aik@ozlabs.ru,
        brking@linux.ibm.com
In-Reply-To: <20220713202335.1217647-1-cheloha@linux.ibm.com>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
Message-Id: <165909971888.253830.15454249099878371474.b4-ty@ellerman.id.au>
Date:   Fri, 29 Jul 2022 23:01:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 13 Jul 2022 15:23:31 -0500, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
> adds support for this hypercall to powerpc/pseries kernels and
> introduces a new watchdog driver, "pseries-wdt", for the virtual
> timers exposed by the hypercall.
> 
> This series is preceded by the following:
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/pseries: hvcall.h: add H_WATCHDOG opcode, H_NOOP return code
      https://git.kernel.org/powerpc/c/c6b2bd262b33aa2451f52aec2190131d1762945a
[2/4] powerpc/pseries: add FW_FEATURE_WATCHDOG flag
      https://git.kernel.org/powerpc/c/1621563ec62ff143c7b817dd5eab0884cdfaf89d
[3/4] powerpc/pseries: register pseries-wdt device with platform bus
      https://git.kernel.org/powerpc/c/578030bfe117060bf86c81aaa7b3faead4589810
[4/4] watchdog/pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
      https://git.kernel.org/powerpc/c/69472ffa6575e3a1c1e3324dd06395af0f63eb71

cheers
