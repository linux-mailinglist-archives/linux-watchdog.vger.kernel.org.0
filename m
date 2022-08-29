Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042705A45A8
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Aug 2022 11:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiH2JDp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Aug 2022 05:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiH2JDp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Aug 2022 05:03:45 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EB25005C
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Aug 2022 02:03:44 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id s10-20020a0568302a8a00b0063b1cac26deso3352161otu.2
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Aug 2022 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=iLUibVBQmwWodElBUlXJlkWfaxi0Zl3KEM5Va0FpN2U=;
        b=gHHYwVLoD+hNpocA0G8vkSQ1fPFfrNj/CDk0vzCQerx5ZbNeOBUHC4MoakVGJX1Q+b
         1RDIvUoB2wjye7/BILImzenvjs4kk9uILzFttqt5zIC2pQsK29rigpY2D5Fyg8Ai5FGp
         imcoGQtnoFip0JKwPesrHMW+J/gdj53moNPHPziS/cOEBKmW+Cg0jCFhF/395VUOqSun
         b91I0qbMLqJdTznl+1d+JPoeUxOCnWkxJjnDn4VsgSFQPZ6i7EAYp1EcBy9Gp/Z0Sk2z
         LtuU1M88lpsvv0hXpzwgkohMaObUzBladK+DhKr4CzbZpB3BhmdoK7M+VoJoXWyT5uzd
         U32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=iLUibVBQmwWodElBUlXJlkWfaxi0Zl3KEM5Va0FpN2U=;
        b=PIWxj5VQMBc3FutIv+RcYIjfGH7itfRdaOAO/zf0QCBHgIStqA/kKYv9rwhGjlek+x
         JMe+5pEGRc0vFsYyv9xSdYFgCVm0z3Mq9L09MH8cqTov7GhtRxArmcYTAF7IlayxFzB2
         xUke80BWJD9XhGFxI0s4NUw2SuEgnB6MD/4lYW/A3VFjKRa/rUgm6zAfX5fek2o9F5aQ
         fLfSX0nM/DYbMfg5+dgU4olnptdHgbkmHJiVaaymd60U/tUFaLxO1ckaiHFQaSL9g+da
         /0Ylf/Ayy3wtZqjSIIOc5uM7Mzm2Swq/uaciXOPwxE7s2C7pnv1rnQt1RxtYbgcfpNlc
         ig7w==
X-Gm-Message-State: ACgBeo2TYeJG9yp2H9jicu1PTrC7BTTWaxPNTc++1MEaKHFuR1YjEupr
        lmlbomVCfz8hK0BDRUyDIperiY7jelGBJ9Pqj7Uxagatc8A=
X-Google-Smtp-Source: AA6agR455LoSNY9NyYhlUokhxybwStYYZYnrPZAfvMsOoSW9yviZ7KupGVMwycVUHqCSXUwbaiJV+9+Lln/MQg8cwos=
X-Received: by 2002:a05:6830:6986:b0:61c:fd55:5b64 with SMTP id
 cy6-20020a056830698600b0061cfd555b64mr6012005otb.92.1661763823788; Mon, 29
 Aug 2022 02:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220827142414.4017751-1-saproj@gmail.com> <ec167bd9-e514-648b-f87c-bb320115cba7@roeck-us.net>
In-Reply-To: <ec167bd9-e514-648b-f87c-bb320115cba7@roeck-us.net>
From:   Sergei Antonov <saproj@gmail.com>
Date:   Mon, 29 Aug 2022 12:03:32 +0300
Message-ID: <CABikg9x9JW2U1xKrZ3g2MJ0h4CVBd1u2XNrP72abMoR3gRdhkA@mail.gmail.com>
Subject: Re: [PATCH v2] watchdog: ftwdt010_wdt: implement _restart() function
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, 28 Aug 2022 at 17:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/27/22 07:24, Sergei Antonov wrote:
> > Implement ftwdt010_wdt_restart(). It enables watchdog with timeout = 0
> > and disabled IRQ. Since it needs code similar to ftwdt010_wdt_start(),
> > add a new function ftwdt010_enable() and move common code there.
> >
> > v1 -> v2:
> > Do not let IRQ trigger when restarting.
> > Add a helper function ftwdt010_enable().
> >
>
> Version history should be after ---.

Thanks. Forgot about it. I will send v3 then with only that little change.
