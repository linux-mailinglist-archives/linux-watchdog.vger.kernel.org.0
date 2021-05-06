Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79774375175
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 11:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhEFJZL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 05:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhEFJZL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 05:25:11 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE851C061574;
        Thu,  6 May 2021 02:24:13 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so3133143pjv.1;
        Thu, 06 May 2021 02:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WKiDmkU9aHDvsmqpyK/IMx1+CZITM8siFJbBXZS1Hm4=;
        b=m/S33qPgDnwR0eQwpEX8kQkaKZz8+2cVoq/PLi1wAqJCPcvVkEYfoN+gGCQLG1zfvj
         cQ1paj8eNe+5FeBhZPwC6Ex6hLc3w9mlfowY35XHIOo1YECmD6nUvvJGvNUPqroS6ICl
         kq0DB991bSxWxnL/AzHdn9IjxnfRVvoe9texpDpexMGRAaH6eU6Q3E9+dy+m7q9w4beJ
         XvLJUYnJ0DtkAZr0It+xDJyKUGDKOtrFa9FJtw9JA/o1KiLf567kBVGnebOdxKf0Q9EB
         YuDRsC8rh7BCSLx2qw2lkXboIoXHnr48wWq/XmK+jRzbVYp8N5Wqb+AVbHKYSNsa8CuX
         HrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WKiDmkU9aHDvsmqpyK/IMx1+CZITM8siFJbBXZS1Hm4=;
        b=R10M9HV09qFA7fIZtXa74oV71W9o4WT/lhYxmNE65gU5HBoPS1Ua4kdV9RkjagiWgy
         F3wJpN2nYG3SXkZbZB458lI/vXfHBP4PdLLUEUfR8+kBlylV7hmaCu3+S88CMOw1Uwfi
         9Lu6MmHRtfMAyUgZIfcHAmrvtjy7tTSlg8bsPb1AuYIwOIWPFgPI2th+SXcElC7MPbUB
         BkvOqjrZtBRvCrc3P7JVgqOgG1V7RzQJcGOt2n2OMhqn2SXUoh1YQGjtRm7kWn7StW6Q
         cVtcAa8VVtB0sTL71V9BWbaRDvJvwOvYQr3h5L11jd1qpHyAOG2YP4xe5FciR3LBQ/Z2
         FCpA==
X-Gm-Message-State: AOAM531lgzH4dJay9GBhdR8on9atMnfp+LoyKpQeZo7+E04bI75VKUqL
        HbliKt696SYyBRrzbZNyvD34lyG6XiqlVUPZKLm63HUADDM=
X-Google-Smtp-Source: ABdhPJzSrPxCJzIEupsbxwmbdAEf8MtqFEnS+0WwzbdBDzDgRc2+vS7yZgJiJjvj0/M9ymzO/WpMULfLzqRBMMHIP0Q=
X-Received: by 2002:a17:902:ecc6:b029:ee:af8f:899e with SMTP id
 a6-20020a170902ecc6b02900eeaf8f899emr3745174plh.21.1620293053157; Thu, 06 May
 2021 02:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210506081619.2443-1-campion.kang@advantech.com.tw> <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com>
In-Reply-To: <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 6 May 2021 12:23:57 +0300
Message-ID: <CAHp75VdPmkKTf_fbjAjrD3GC1ZZLuYsTJa0QtA3tuYtWwCgPMQ@mail.gmail.com>
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

On Thu, May 6, 2021 at 11:48 AM Hans de Goede <hdegoede@redhat.com> wrote:
> I'm replying here since this series has no cover-letter, for
> the next version for a series touching so many different
> sub-systems it would be good to start with a cover-letter
> providing some background info on the series.
>
> I see this is binding to an ACPI device, yet it is also using
> devicetree bindings and properties.
>
> So I take it this means that your ACPI tables are using the
> optional capability of embedded device-tree blobs inside the
> ACPI tables ?
>
> That is an unusual combination on a x86 device, note it is
> not wrong

It's actually not okay. We have agreed at some point with DT people,
that ACPI should not use non-native variants of natively supported
things. For example, it shouldn't use "interrupt" property for IOxAPIC
(or xIC) provided interrupts, rather Interrupt() has to be used and so
on.

> but AFAIK you are the first to do this on x86.

No, not the first. Once Intel tried to invent the pin control
configuration and muxing properties in ACPI, it was luckily rejected
(ACPI 6.x OTOH provides a set of special resources for that).

So, NAK from me, *if* it's really the case. ACPI tables must be revisited.

-- 
With Best Regards,
Andy Shevchenko
