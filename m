Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B92F108F
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2019 08:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731568AbfKFHoi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 6 Nov 2019 02:44:38 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38275 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731552AbfKFHoh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 6 Nov 2019 02:44:37 -0500
Received: by mail-lj1-f196.google.com with SMTP id v8so9253910ljh.5
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Nov 2019 23:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GQiDbpJ2lWoQjxogiLC76wvVDvALWHHs4GpRXuiccOI=;
        b=WAw9vU4JDVSEM4/tX3dXF8lllf4N+YzqBd5KUQ8snC5w5eDIIZ+umT4kLbyVnFM++0
         ZB8hLVMoITJnSq1rOsxgeKtkROl/uFH9ESV8xVpi8yb698FGYQmgutU67Wm0q//x2Bsj
         SZ/Bk5cn1mPajr330aCYxLLHJQpMBwRD7lKS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GQiDbpJ2lWoQjxogiLC76wvVDvALWHHs4GpRXuiccOI=;
        b=nROFUREjQB9iLpGuXUh6aWlDwgZ9ueeQiFzeZfEIT1SaG7oc9TA02eu5fkQ3Ge0Kt3
         xE+Tw6i/uzba5tEWo7Cen50gT0eeP/35reNk+szdLfgjYY4/K+xEq5isczeAhvJnLxbC
         MNfFkBUsS9LNftN0EkwaL+q3L6ryQz30bdsPIMI/27Vx8OVTtmAfgKAPB6Hu78q4ir5C
         lL8ObqsG+E/XzTHxGS8gxwEyPstTGALKMQs/oMbdwuTOI7NlxcQ1BrFDvc8VERddGF+M
         K4LfxwUInYwVjtrILM2vUv9jhlDOxKaKFUKqhfRCySHcwJOfEMhfeh0hVh6orYxkMXvM
         PB5w==
X-Gm-Message-State: APjAAAU5rw4guANXs/AadNM84QDwJFyGAomrk+1hKrvpO/3q2z1KnsSh
        t4QYj2TQA7kFfweTKDCCf/cWPBpKI5ET+Q==
X-Google-Smtp-Source: APXvYqw8lqO4bBk2ADhwLIclnOcuGlmrYsbeOu9P1od+oauKtzslw1xjfudWN5y+gXx9dri9uatmXA==
X-Received: by 2002:a2e:6a19:: with SMTP id f25mr798316ljc.147.1573026274938;
        Tue, 05 Nov 2019 23:44:34 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id t16sm8449870ljc.106.2019.11.05.23.44.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 23:44:34 -0800 (PST)
Subject: Re: [PATCH] watchdog: make nowayout sysfs file writable
To:     kbuild test robot <lkp@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     kbuild-all@lists.01.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20191105123125.25985-1-linux@rasmusvillemoes.dk>
 <201911060551.VIFgN8pe%lkp@intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <fdc909d7-bf73-740e-0da0-1aad41806734@rasmusvillemoes.dk>
Date:   Wed, 6 Nov 2019 08:44:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201911060551.VIFgN8pe%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05/11/2019 22.16, kbuild test robot wrote:

>    In file included from include/linux/mutex.h:14:0,
>                     from include/linux/kernfs.h:12,
>                     from include/linux/sysfs.h:16,
>                     from include/linux/kobject.h:20,
>                     from include/linux/cdev.h:5,
>                     from drivers/watchdog/watchdog_dev.c:31:
>    drivers/watchdog/watchdog_dev.c: In function 'nowayout_store':
>>> arch/ia64/include/asm/current.h:16:19: error: expected identifier or '(' before 'struct'
>     #define current ((struct task_struct *) ia64_getreg(_IA64_REG_TP))
>                       ^
>    drivers/watchdog/watchdog_dev.c:460:22: note: in expansion of macro 'current'
>      unsigned int value, current;
>                          ^~~~~~~

:facecpalm:

And it happened to work just fine in my test because I was targeting
ppc32 where unlike most other arches, current is not a macro but a
(more-or-less) ordinary global declaration

register struct task_struct *current asm ("r2");

Oh well, already fixed in v2 which dropped current for other reasons.

Rasmus
