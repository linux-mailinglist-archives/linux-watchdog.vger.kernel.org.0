Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915FE403012
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 23:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346933AbhIGVHF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 17:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346984AbhIGVGt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 17:06:49 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25269C06175F
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Sep 2021 14:05:31 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id e23so393303lfj.9
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Sep 2021 14:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g82twVHBT3nIwib1kNATw3EUKJ53a0N5uNazF9kw1V4=;
        b=HSXE0gT8Qf6IWPV3zzXIMyBL4YFWjcmOD76oYR9y2M7iKdgH8f3CcGYRcw/d/6jDwg
         t7rKZa35VISPjjjZlybtFixfQxBmUt576kNn8j2nN3tWQfOsfN6OQhVB29iWsxtB+WUE
         Put9hy7fgU6BBlaLFM7bEenbHfnXtM39prIKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g82twVHBT3nIwib1kNATw3EUKJ53a0N5uNazF9kw1V4=;
        b=dQjzfaIB7enn6mGlXiatuCGcL59LvudEOgQfALQ9B4Zsz6xz3ybOt8NgiyDu+34ihE
         QDCUbu8DXUki/+ZXrGFz1GtG/zFACez61TwESp6SmW/i+SdTH5jzfCCTwzt9AjcmkGcv
         Kp82Yiaq8k1U5npXhe88SuvTfzGoePP+CZe+ywfr1/EXFxcev0symWU3wH5bisf/T4Dj
         udVmn3dWUGNHXowwSoJwQmoiGJjJ4kjy8rWH3iUFFE3oU3wkdo+ToCC57RcyURNDZJkv
         MaAV2gMbUigIT11pPVVDbyxM6tg0HgBoiCNUGdG/X8UJnj9FRLBcLpQNSkbQh9Rw3oEu
         gUkg==
X-Gm-Message-State: AOAM5330cJTt8+QX+msA6B6A2spQYWDLVt+O4y7pe9h5p05GfmvgxldX
        rZMXDPUI0O/ODUa1oOFlRyZ1I/v22p2Bs7SSD4Y=
X-Google-Smtp-Source: ABdhPJxthxd/GIhG+TAI0MD7FOykWFeTtiuyPiUYHRGBxLB3U+cMYhymt/3nj6mof8KDOVUXItvWIQ==
X-Received: by 2002:a05:6512:304f:: with SMTP id b15mr260653lfb.462.1631048729202;
        Tue, 07 Sep 2021 14:05:29 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id j17sm6051lfe.55.2021.09.07.14.05.29
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 14:05:29 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id e23so393254lfj.9
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Sep 2021 14:05:29 -0700 (PDT)
X-Received: by 2002:a2e:a363:: with SMTP id i3mr153633ljn.56.1631048334025;
 Tue, 07 Sep 2021 13:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210907191139.GA18865@www.linux-watchdog.org> <20210907192514.GA18886@www.linux-watchdog.org>
In-Reply-To: <20210907192514.GA18886@www.linux-watchdog.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Sep 2021 13:58:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7NEnwnbrNewJLvjsMc4gAOmGb4nOMfooZUXMr627Zxg@mail.gmail.com>
Message-ID: <CAHk-=wi7NEnwnbrNewJLvjsMc4gAOmGb4nOMfooZUXMr627Zxg@mail.gmail.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v5.12 Merge window
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christine Zhu <Christine.Zhu@mediatek.com>,
        Curtis Klein <curtis.klein@hpe.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 7, 2021 at 1:46 PM Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
>
> My Apologies. The subject of this e-mail is wrong again. It should have been [GIT PULL REQUEST] watchdog - v5.15 Merge window

Heh. That was fairly obvious. No problem.

My email search terms end up being just "git" and "pull", so it's not
like I end up even really looking at the version numbers except closer
to the end of the release. At that point people start sending me early
pull requests for the next merge window, and I start looking more
closely just to make sure I differentiate between "fixes for this
release" and "updates for the next merge window".

... and even then, it's usually pretty obvious from the actual
contents, and if somebody gets a version number wrong it generally
isn't all that confusing.

            Linus
