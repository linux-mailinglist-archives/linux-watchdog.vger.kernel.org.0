Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175566C4044
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Mar 2023 03:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjCVCTR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Mar 2023 22:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCVCTQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Mar 2023 22:19:16 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95541716A
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Mar 2023 19:19:14 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id n137so4029854qka.2
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Mar 2023 19:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679451554;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jLb+fCTiipg98Q2/oCJxxRoqFSg1x1kkG9R8dy1VY48=;
        b=pyo+NX0rnAlS/Bf5mJe+Vw4LnJAgDk3b4FV3YG8cBFUlwtoXK8a2OyhMm3ba/COLWR
         p/mdBeBFq0aTopwGQz2O1exvhi653jtTAz9gWeBzvIFBzZkkdnz5jkXtfzJECI/R96r4
         bRWzjPkZS3a6g6+x3eYtmjdOOgKumhdXdqB/fvPChO+QQAd5jx+LdV4UDZlYDP1LqpH8
         mcxbnI9ux4fl3/axVQC2t+xdPV9L0FGIfJQX1LLMO+frKoVmJE824HSeiXQaRk9VECma
         GNKHy5dJQyQ1Fhujt9WnzN3dmqMsLAjFxyKC6uK3wqsVRfwppZIoYBmalOjfEj+rhZAG
         nkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679451554;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLb+fCTiipg98Q2/oCJxxRoqFSg1x1kkG9R8dy1VY48=;
        b=cSxVh6/2vaaGJMBAIxPuIVbk4axFTzn0ciMtE/qajIfIq2D5bAOLfnCWW5lxm+vmLZ
         0pGFnR0yK3QCKcMgGfH2MNC6fqxlRD69zJsakKYHFd4r4YPBCCP8Qql5FtitpEbc/V6/
         4YrE5IyJkhMJ1x/hQVrY3kYC/X85Jzat6KLhUJYTy68MV8eSjSly+BQ6YJclX9CryyMl
         HMol9Ch91parokFw6LSfytabSbc6NKoFI/jVAB1LCHmMThulBhR5om0dHrYT+zredugV
         JNwB00sZMmH+wGyihwvVsEFZsUX84XbnsJjCd8iDMLqfi1kvjgkx7OVfOtD9RFFKaRvU
         G1+A==
X-Gm-Message-State: AO0yUKWKA6aV49SPAgvW1rRsUAiXOR++xuR65bDrS1ulqmYzLGkruNRA
        mZbvSzN5/HuZQyamSjALkvvx8SiWaPRuVKTVXRBY2Y6nPHJNjw==
X-Google-Smtp-Source: AK7set8J0+G9ak6puRVSXgJylOGa3Ck8rzlsCfV0CpIl4D+QYF6w/OM+1W+J+fkVbsv2I8aegnpE0rQpCG0ffG113JU=
X-Received: by 2002:a05:620a:7f8:b0:71f:b89c:4f2f with SMTP id
 k24-20020a05620a07f800b0071fb89c4f2fmr435561qkk.9.1679451553822; Tue, 21 Mar
 2023 19:19:13 -0700 (PDT)
MIME-Version: 1.0
From:   Kean Ren <kean0048@gmail.com>
Date:   Wed, 22 Mar 2023 10:19:02 +0800
Message-ID: <CA+g2S9ow136yA4M-ECxw7z6wGKYkXTh3K4OyMcw4Y1050m3HbQ@mail.gmail.com>
Subject: [ISSUE]: iTCO_wdt driver's timeleft seem will not decrease when the
 watchdog is started.
To:     linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello everyone,

I encountered a problem while using Linux-watchdog and would like some
help. The specific issue is as follows:

[OS]
Fedora37 6.1.14

[DESCRIPTION]
My testing motherboard is ThinkPad x1 g10 with CPU 11th Gen Intel(R)
core(TM) i7-1185G7 @3.00GHz, when I start the watchdog, found the
timeleft no change, and I do the following steps:
1)cat /sys/class/watchdog/watchdog0/identity
> iTCO_wdt
2)check linus' tree patches, and compare them with the current kernel
version seems not much different.
drivers/i2c/busses/i2c-i801.c
051d769f0a36 ("i2c: i801: Add support for Intel Tiger Lake")
b84398d6d7f9 ("i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond")
04bbb97d1b73 ("i2c: i801: Do not add ICH_RES_IO_SMI for the iTCO_wdt device")
f46efbcad97b ("i2c: i801: Add support for Intel Tiger Lake PCH-H")

For drivers/watchdog/iTCO_wdt.c:
da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
e42b0c24389d ("watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional")
3) Check all the SMBus setting parameters and Inter 500 Series Chipset
Family PCH datasheet seems all registers set the right value.
4) What more, I found ICH_RES_IO_SMI resource is not useful for this type of CPU

[STEPS]:
1) Download the source code and compile the
tools/testing/selftests/watchdog/watchdog-test.c
2) Run watchdog-test with parameters -t 30 -p 20 -e
3) Run watch wdctl
4) We can find the 'Timeleft' value keeps at 30, not decrease. <----
that's the issue.

Has anyone encountered a similar problem? Do you know how I can solve
this problem?

Thank you!
Kean
