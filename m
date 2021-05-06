Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CC53751BA
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 11:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhEFJnW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 05:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbhEFJnV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 05:43:21 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2542C061574;
        Thu,  6 May 2021 02:42:23 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id p4so4761757pfo.3;
        Thu, 06 May 2021 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bUlPp5SynFPom5XXOITni8FWTn622aMLK3463Wdyieo=;
        b=ijmdNX0FsLfhK21Fcv5g5ofIW/F03ccxpS8PrDoUAJmUmAdnYu5euqL/xsnAcyxPj4
         3ETQTfimcwd9abPbSmxmt/oUjwW8l24JZmm3Mc4kSqOfbYpYJtLDt/2ovdq5DRgcNVRH
         GuLjHAHQoaV4l0282PfZa9JVgLOiCcSDTPiGM4BrwRyfkP5aYgBf3yMPC3eELJEALGWs
         qXjsDfcJVg/Kb9R51NxF0c7ANkfcOwpJnex/ItnQcwm0115SxojGLWrScHOO+FeaG2+l
         RChp1UWr3Q5HNLEx6cja8ZTZOk0VPMFqs2uEuPUuy0W4sBiR9Ib7uPpOwZevRAEuJDeq
         yB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bUlPp5SynFPom5XXOITni8FWTn622aMLK3463Wdyieo=;
        b=jH/ABWd51pDuLwg13xc3QAwMtyfrs7K1mHPoxt1xk3+ChCgXiyRhJgxUO/aTkTlh/l
         qpTPC6Mopdo/+PJdlfGD3HSNyWkNz20eb2ihm6BX7u/uUvamDj2GKdnThgY+0R5iOqa4
         tjafik/DMlx+wYxdfVdTfreHEBwLb7aqlar6uQEAzCMyKf8UuXk+IOCkatBXpkbUKuhS
         zM2zIxGIcOqKAxYMaQa3dPcNLcF9c3tAvOJaA1rUHQco8Zh7jmeaiShXyk5SoB2FN0bb
         qGbAZszje+isOMdidwzChyNoDtl2fnAWVGqR3fWdXpCMBR3qLm0paHfuxkDd+seCfq6/
         tsmw==
X-Gm-Message-State: AOAM5322TBkXir1q7qnD26Xi3/kGp4fG4+GvOA5QmZWMRaHoqKbvNr5E
        z3YaI2cDYBlIc6npUfVf8RnHaq5EHpla8jv3bls=
X-Google-Smtp-Source: ABdhPJzBD3IFOSBUCUecA7JzQGF30gPDp2YPYJgwyOPwM2UQgVbgykMZvn279vPfGhAtFBMwKBpQxb6BzBirE4HIwR0=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr3496419pfb.7.1620294143344; Thu, 06
 May 2021 02:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
 <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com> <CAHp75VdPmkKTf_fbjAjrD3GC1ZZLuYsTJa0QtA3tuYtWwCgPMQ@mail.gmail.com>
 <cf181436-152c-7cd8-76cf-350705cd2bcb@redhat.com>
In-Reply-To: <cf181436-152c-7cd8-76cf-350705cd2bcb@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 6 May 2021 12:42:07 +0300
Message-ID: <CAHp75VfDGd3+fC3y6rxpqddFndBD974Q3hB2sEfdhpiccA6WxQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
 controller entry
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Campion Kang <campion.kang@advantech.com.tw>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 6, 2021 at 12:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/6/21 11:23 AM, Andy Shevchenko wrote:

...

> Campion, any reason why you went this route; and can the ACPI tables
> still be changed?

Yes, the main problem with the series is the absence of a cover letter
that should basically answer the (obvious) questions and give a
justification.

-- 
With Best Regards,
Andy Shevchenko
