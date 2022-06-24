Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4801559A52
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jun 2022 15:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbiFXN1j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 Jun 2022 09:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbiFXN1j (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 Jun 2022 09:27:39 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DF655368
        for <linux-watchdog@vger.kernel.org>; Fri, 24 Jun 2022 06:27:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LTybX4Z9lz4xbd;
        Fri, 24 Jun 2022 23:27:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1656077256;
        bh=5vrfcOv26V+lDLOC3WyTvVljocKADw4QjN6tnRjDRLw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=i54nHJEcYvdKTWdeFqLo9vffKIdbdPfubQ3Hpb82tshH2oGFJosR+2Wpod0t8BKW2
         MoMChAKFWXrwsKHz2OJy4Q2FnIJd77SglPdYLyNQdiNc5QcZ/DX0NcDDDKLSHv8X+P
         JOWwX5oaPT5HX9Y0kh8xUU9FnBl7fufCmNO1IeNGT3JN5g3LIkh8ViXmrF3OAJptvA
         7Xe6s5UXHs2Whu0CtTRtbEqkww2ZD2B7jZ9t8UTN+qVe3Yx+qfuPWdk4+gaikEGsKs
         ArMKcq3BBJy5r0beQfdXzGaE+YGCwlHmBzFGdqhAyQUtV3CzslFY1w1O1LMBhgtHqO
         oNnY1FUD6epOw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Nathan Lynch <nathanl@linux.ibm.com>,
        Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     wvoigt@us.ibm.com, aik@ozlabs.ru,
        Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com,
        npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Subject: Re: [PATCH v2 3/4] powerpc/pseries: register pseries-wdt device
 with platform bus
In-Reply-To: <874k0enied.fsf@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-4-cheloha@linux.ibm.com>
 <874k0enied.fsf@linux.ibm.com>
Date:   Fri, 24 Jun 2022 23:27:36 +1000
Message-ID: <87v8sq42ev.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Scott Cheloha <cheloha@linux.ibm.com> writes:
>> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
>> guest control of one or more virtual watchdog timers.
...
>
> Seems like we don't need pseries_wdt_pdev as it's unused elsewhere? But
> that's quite minor.

It's minor but please drop it in the next version.

cheers
